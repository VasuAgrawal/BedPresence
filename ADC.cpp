#include <stdio.h>

#include <cstdint>
#include <cstring>
#include <bit>

#if PICO_ON_DEVICE
#include "hardware/spi.h"
#endif

#include "pico/stdlib.h"

#include "mcp356x.h"

// SPI Defines
// We are going to use SPI 0, and allocate it to the following GPIO pins
// Pins can be changed, see the GPIO function select table in the datasheet for
// information on GPIO assignments
#define SPI_PORT spi0
#define PIN_MISO 16
#define PIN_CS 17
#define PIN_SCK 18
#define PIN_MOSI 19

// Assumes little endian
void printBits(size_t const size, void const *const ptr) {
  unsigned char *b = (unsigned char *)ptr;
  unsigned char byte;
  int i, j;

  for (i = size - 1; i >= 0; i--) {
    for (j = 7; j >= 0; j--) {
      byte = (b[i] >> j) & 1;
      printf("%u", byte);
    }
  }
  // puts("");
}

void configureSpi() {
#if PICO_ON_DEVICE
  // SPI initialisation. This example will use SPI at 1MHz.
  spi_init(SPI_PORT, 1000);
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

bool validateDefaultRegisterMap() {
  // First, read all the default config values off the device.
  uint8_t inc_read_cmd_byte =
      makeCommandByte(kAdcAddr, AdcRegisterAddresses::kConfig0,
                      AdcCommandType::kIncrementalRead);
  AdcRegisters current_registers(false);
  uint8_t status;  // Status from the command transfer

#if PICO_ON_DEVICE
  gpio_put(PIN_CS, 0);
  spi_write_read_blocking(SPI_PORT, &inc_read_cmd_byte, &status, 1);
  spi_read_blocking(SPI_PORT, 0, current_registers.data(),
                    current_registers.REGISTER_MAP_SIZE);
  gpio_put(PIN_CS, 1);
#endif

  bool ret = true;
  AdcRegisters default_registers;
  for (size_t i = 0; i < AdcRegisters::REGISTER_MAP_SIZE; ++i) {
    printf("Byte %02lu: loaded ", i);
    printBits(1, &current_registers.data()[i]);
    printf(", default ");
    printBits(1, &default_registers.data()[i]);

    if (current_registers.data()[i] != default_registers.data()[i]) {
      printf(" <--------- mismatch!");
      ret = false;
    }

    printf("\n");
  }

  return ret;
}

void configureAdc() {
  AdcRegisters config;
  config.setClockSelection<AdcClockSelection::kInternalWithOutput>();
  config.setAdcMode<AdcAdcMode::kConversionMode>();
  config.setOversamplingRatio<AdcOversamplingRatio::kOsr256>();
  config.setBoost<AdcBoost::kCurrent1>();
  config.setGain<AdcGain::kGain1>();
  config.setAutoZeroingMux<AdcAutoZeroingMux::kDisable>();
}

int main() {
#if PICO_ON_DEVICE
  stdio_init_all();
#endif
  printf("\n===============================\n");

  if constexpr (std::endian::native == std::endian::big) {
    printf("Uh what the fuck\n");
  } else if constexpr (std::endian::native == std::endian::little) {
    printf("little endian, which is expected\n");
  } else {
    printf("Mixed endian1?@#?!@?#!@]\n");
  }

  // configureSpi();
  // validateDefaultRegisterMap();

  configureAdc();

  return 0;
}
