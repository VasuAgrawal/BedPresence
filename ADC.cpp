#include <stdio.h>

#include <cstdint>
#include <cstring>

#include "bit_utils.h"
#include "hardware/gpio.h"

#if PICO_ON_DEVICE
#include "hardware/clocks.h"
#include "hardware/pwm.h"
#include "hardware/spi.h"
#endif

#include "mcp356x.h"
#include "pico/stdlib.h"

// SPI Defines
// We are going to use SPI 0, and allocate it to the following GPIO pins
// Pins can be changed, see the GPIO function select table in the datasheet for
// information on GPIO assignments
#define SPI_PORT spi0
#define PIN_MISO 16
#define PIN_CS 17
#define PIN_SCK 18
#define PIN_MOSI 19

#define PIN_IRQ 6

// Configures the clock on the RP2040
void configureClock() {
  set_sys_clock_pll(1596000000, 6, 2);  // 133 MHz
}

void configureStdio() {
#if PICO_ON_DEVICE
  stdio_init_all();
#endif

  printf("\n===============================\n");
}

// Initialize the SPI bus
void configureSpi() {
#if PICO_ON_DEVICE
  spi_init(SPI_PORT, 2e7);  // 20 MHz SPI
  gpio_set_function(PIN_MISO, GPIO_FUNC_SPI);
  gpio_set_function(PIN_CS, GPIO_FUNC_SIO);
  gpio_set_function(PIN_SCK, GPIO_FUNC_SPI);
  gpio_set_function(PIN_MOSI, GPIO_FUNC_SPI);

  // Chip select is active-low, so we'll initialise it to a driven-high state
  gpio_set_dir(PIN_CS, GPIO_OUT);
  gpio_put(PIN_CS, 1);

  // Be explicit about the SPI format
  spi_set_format(SPI_PORT, 8, SPI_CPOL_0, SPI_CPHA_0, SPI_MSB_FIRST);
#endif
}

// Load the default register map from the device into an empty register object,
// just to sanity check that we have all the correct defaults. Can be skipped
// for release builds.
bool validateDefaultRegisterMap() {
  // First, read all the default config values off the device.
  const uint8_t inc_read_cmd_byte =
      makeCommandByte(kAdcAddr, AdcRegisterAddresses::kConfig0,
                      AdcCommandType::kIncrementalRead);
  AdcRegisters current_registers;
  // Don't actually need to wipe.
  // current_registers.wipe();
  uint8_t status;  // Status from the command transfer

#if PICO_ON_DEVICE
  gpio_put(PIN_CS, 0);
  spi_write_read_blocking(SPI_PORT, &inc_read_cmd_byte, &status, 1);
  spi_read_blocking(SPI_PORT, 0, current_registers.data(),
                    current_registers.size());
  gpio_put(PIN_CS, 1);
#endif

  bool ret = true;
  const AdcRegisters default_registers;
  for (size_t i = 0; i < current_registers.size(); ++i) {
    printf("Byte %02lu: loaded ", i);
    printBits(1, &current_registers.data()[i]);
    printf(", default ");
    printBits(1, &default_registers.begin()[i]);

    if (current_registers.data()[i] != default_registers.data()[i]) {
      printf(" <--------- mismatch!");
      ret = false;
    }

    printf("\n");
  }

  printf("\n");

  return ret;
}

void printStatusByte(uint8_t status) {
  printf("Received status: ");
  printBits(sizeof(status), &status);
  printf(", addr: %d", (status & 0b00110000) >> 4);
  printf(", data ready status: %s", ((status & 0b100) >> 2) ? "none" : "READY");
  printf(", crccfg status: %s", ((status & 0b10) >> 1) ? "good" : "ERROR");
  printf(", por status: %s", ((status & 0b1)) ? "fine" : "REBOOTED");
};

auto configureAdc() {
  AdcRegisters config;
  config.setAdcClockSelection<AdcClockSelection::kExternal>();
  config.setAdcOversamplingRatio<AdcOversamplingRatio::kOsr98304>();
  config.setAdcBoost<AdcBoost::kCurrent1>();
  config.setAdcGain<AdcGain::kGain4>();
  config.setAdcAutoZeroingMux<AdcAutoZeroingMux::kDisable>();
  config.setAdcConversionMode<AdcConversionMode::kContinuousConversion>();
  config.setAdcDataFormat<AdcDataFormat::k32BitWitChannelIdAndOverrange>();
  config.setAdcEnableDigitalOffsetCalibration<
      AdcEnableDigitalOffsetCalibration::kDisable>();
  config.setAdcEnableDigitalGainCalibration<
      AdcEnableDigitalGainCalibration::kDisable>();
  config.setAdcIrqModeOutputSelection<AdcIrqModeOutputSelection::kIrqOutput>();
  config.setAdcIrqModeInactiveSelection<
      AdcIrqModeInactiveSelection::kLogicHigh>();
  config.setAdcEnableConversionStartInterrupt<
      AdcEnableConversionStartInterrupt::kDisable>();
  config.setAdcMuxVinPlusSelection<AdcMuxVinPlusSelection::kCh0>();
  config.setAdcMuxVinMinusSelection<AdcMuxVinMinusSelection::kCh1>();

  const uint8_t inc_write_cmd_byte =
      makeCommandByte(kAdcAddr, AdcRegisterAddresses::kConfig0,
                      AdcCommandType::kIncrementalWrite);
  uint8_t status;  // Status from the command transfer

#if PICO_ON_DEVICE
  gpio_put(PIN_CS, 0);
  spi_write_read_blocking(SPI_PORT, &inc_write_cmd_byte, &status, 1);

  printStatusByte(status);
  printf("\n");

  spi_write_blocking(SPI_PORT, config.data(), config.size());
  gpio_put(PIN_CS, 1);
#endif

  return config;
}

void configurePwm(const uint32_t target_frequency) {
#if PICO_ON_DEVICE
  // Rise time (10-90) seems to be ~30 ns. Fall time is ~25 ns.
  // We want to make sure there's enough time to perform a rise and fall. The
  // intended precision (e.g. 1%) will set the PWM frequency. For example:
  //
  //  T_min = rise time + fall time = 55ns
  //  precision = 1/100
  //  clock = 133MHz
  //  clock_period = 1/clock = 1/133MHz = 7.5e-9 = 7.5ns
  //  clock_counts = (precision^-1 * T_min) / clock_period
  //               = (100 * 55ns) / 7.5ns
  //               = 5.5us / 7.5ns
  //               = 733
  //  min_steps = precision * clock_counts
  //
  // So, you'd take the clock_counts value and use that as the input to
  // set_wrap, which will set the PWM frequency (in this case to 181446KHz).
  // Then, whenever a duty cycle percentage is specified, you use the min_steps
  // variable to round to the nearest step. Or, at the very least, you use
  // min_steps to make sure you don't go lower than that for set_chan_level, as
  // you would otherwise not reach the full 3.3V output value of PWM.
  //
  // Also note that the number of counts needs to be <= 65536, as the counter
  // and TOP are 16 bits in size. This is a frequency of 2KHz or so, with a 133
  // MHz clock. This can be lowered by using the clock divider.

  const uint32_t f_clk_sys = frequency_count_khz(CLOCKS_FC0_SRC_VALUE_CLK_SYS);
  printf("clk_sys = %dkHz\n", f_clk_sys);

  const uint8_t kGpioNum = 22;
  gpio_set_function(kGpioNum, GPIO_FUNC_PWM);  // GPIO22 is on physical pin 29

  const auto slice_num = pwm_gpio_to_slice_num(kGpioNum);
  const auto channel_num = pwm_gpio_to_channel(kGpioNum);

  const uint32_t counts_per_period = (f_clk_sys * 1000) / target_frequency;
  printf("Using %u counts for a requested freq of %u\n", counts_per_period,
         target_frequency);

  pwm_set_wrap(slice_num, counts_per_period - 1);
  pwm_set_chan_level(slice_num, channel_num, counts_per_period / 2);
  pwm_set_enabled(slice_num, true);

#endif
}

void startAdc(AdcRegisters& config) {
  config.setAdcAdcMode<AdcAdcMode::kConversionMode>();

  // TODO: Come up with a better way to figure out the AdcRegisterAddress to
  // start writing to.
  const uint8_t inc_write_cmd_byte =
      makeCommandByte(kAdcAddr, AdcRegisterAddresses::kConfig0,
                      AdcCommandType::kIncrementalWrite);
  uint8_t status;  // Status from the command transfer

#if PICO_ON_DEVICE
  gpio_put(PIN_CS, 0);
  spi_write_read_blocking(SPI_PORT, &inc_write_cmd_byte, &status, 1);

  printStatusByte(status);
  printf("\n");

  spi_write_blocking(SPI_PORT, config.data(), 1);  // Only write config0 byte
  gpio_put(PIN_CS, 1);
#endif
}

template<const uint8_t bits, typename T>
int32_t sign_extend(T x) {
  T m = 1;
  m << bits - 1;
  return (x ^ m) - m;
}

void readAdc() {
  gpio_set_function(PIN_IRQ, GPIO_FUNC_SIO);
  gpio_disable_pulls(PIN_IRQ);  // Already has a pullup from the ADC
  gpio_set_input_hysteresis_enabled(PIN_IRQ, true);
  gpio_set_dir(PIN_IRQ, GPIO_IN);

  const uint8_t static_read_cmd_byte = makeCommandByte(
      kAdcAddr, AdcRegisterAddresses::kAdcData, AdcCommandType::kStaticRead);
  uint8_t status;
  uint32_t adc_data;

  int reads = 0;
  while (true) {
    if (gpio_get(PIN_IRQ)) {  // Active low signal
      continue;
    }

    reads += 1;

#if PICO_ON_DEVICE
    // Have _some_ data available. Let's figure out what it is.
    gpio_put(PIN_CS, 0);
    spi_write_read_blocking(SPI_PORT, &static_read_cmd_byte, &status, 1);
    spi_read_blocking(SPI_PORT, 0, reinterpret_cast<uint8_t*>(&adc_data), 4);
    gpio_put(PIN_CS, 1);
#endif

    // Use the status byte that was now populated to figure out what's up.
    printStatusByte(status);
    printf(" | ADCDATA");

    adc_data = swap_msb_and_host<4>(adc_data);
    uint32_t adc_data_ch_id = (adc_data >> 28) & 0xF;
    printf(" ch_id: 0x%X", adc_data_ch_id);
  
    printf(" raw bits: ");
    printBits(sizeof(adc_data), &adc_data);
    // printf(" raw bits hex: 0x%X", adc_data);

    int32_t raw_value = adc_data & 0xFFFFFF;
    raw_value = (raw_value << 8) >> 8;
    // // int32_t raw_value = static_cast<int32_t>(sign_extend<24>(adc_data & 0xFFFFFF)); // sign extension, hopefully
    // // int32_t raw_value = sign_extend<24>(adc_data & 0xFFFFFF); // sign extension, hopefully
    // printf(" twos bits: ");
    // printBits(sizeof(raw_value), &raw_value);
    // // printf(" twos bits hex: 0x%X", raw_value);
    // 
    printf(" converted: ");
    adc_data &= 0x0F'FF'FF'FF; // Remove the channel ID now
    if (adc_data == 0x00'FF'FF'FF) { // Overrange
      printf("OVERRANGE");
    } else if (adc_data == 0x0F'00'00'00) { // Underrange
      printf("UNDERRANGE");
    } else {
    
      // convert the lower 28 bits, which are a twos-complement signed integer
      // representing the number of counts. The actual data is only 24 bits,
      // plus a sign extension bit afterwards.
      
      // uint32_t raw_value = adc_data & 0xFFFFFF;
      float value = (3.3f / (1 << 23)) * raw_value;
      // adc_data &= 0xFF'FF'FF; // Remove the sign bit now, assumed to be 0.
      // float value = 3.3f * adc_data / ((1 << 23) - 1);
      printf("%0.5fV", value);
    }
    
    printf("\r");
  }
}

int main() {
  configureClock();

  configureStdio();

  configureSpi();
  // validateDefaultRegisterMap();

  auto adc_config = configureAdc();

  // Make sure to start the external clock only after we've told the ADC to
  // expect the external clock.
  configurePwm(5e6);

  // Start reading data!
  startAdc(adc_config);

  readAdc();

  return 0;
}
