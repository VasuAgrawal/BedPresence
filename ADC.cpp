#include <stdio.h>

#include <cstdint>
#include <cstring>

#include "bit_utils.h"

#if PICO_ON_DEVICE
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

// Initialize the SPI bus
void configureSpi() {
#if PICO_ON_DEVICE
  spi_init(SPI_PORT, 1e7);  // 10 MHz SPI
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
  printf("\n");
};

void configureAdc() {
  AdcRegisters config;
  config.setAdcClockSelection<AdcClockSelection::kInternalWithOutput>();
  // config.setAdcAdcMode<AdcAdcMode::kConversionMode>();
  config.setAdcOversamplingRatio<AdcOversamplingRatio::kOsr256>();
  config.setAdcBoost<AdcBoost::kCurrent1>();
  config.setAdcGain<AdcGain::kGain1>();
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

  spi_write_blocking(SPI_PORT, config.data(), config.size());
  gpio_put(PIN_CS, 1);
#endif
}

int main() {
#if PICO_ON_DEVICE
  stdio_init_all();
#endif

  printf("\n===============================\n");

  configureSpi();
  // validateDefaultRegisterMap();

  configureAdc();
  return 0;
}
