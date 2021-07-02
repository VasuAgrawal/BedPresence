#pragma once
#include <stdio.h>

#include <cassert>
#include <cstdint>
#include <cstring>

#include "magic_enum.hpp"

inline constexpr uint8_t bitmask(uint8_t end_bit, uint8_t start_bit) {
  const uint8_t end_masks[] = {
      0b00000001,  // 0
      0b00000011,  // 1
      0b00000111,  // 2
      0b00001111,  // 3
      0b00011111,  // 4
      0b00111111,  // 5
      0b01111111,  // 6
      0b11111111,  // 7
  };

  const uint8_t start_masks[] = {
      0b00000000,  // 0
      0b00000001,  // 1
      0b00000011,  // 2
      0b00000111,  // 3
      0b00001111,  // 4
      0b00011111,  // 5
      0b00111111,  // 6
      0b01111111,  // 7
  };

  return end_masks[end_bit] & ~start_masks[start_bit];
}

#define BYTEMANIP(fn_name, end_bit, start_bit, memory_offset)                 \
  inline Adc##fn_name get##fn_name() const {                                  \
    return Adc##fn_name((map[memory_offset] & bitmask(end_bit, start_bit)) >> \
                        start_bit);                                           \
  }                                                                           \
  template <Adc##fn_name val>                                                 \
  inline void set##fn_name() {                                                \
    printf("Setting " #fn_name " to %u (%.*s) from %u\n",                     \
           static_cast<uint8_t>(val),                                         \
           static_cast<int>(magic_enum::enum_name<val>().size() - 1),         \
           magic_enum::enum_name<val>().data() + 1,                           \
           static_cast<uint8_t>(get##fn_name()));                             \
    map[memory_offset] =                                                      \
        ((map[memory_offset] & ~bitmask(end_bit, start_bit)) |                \
         (static_cast<uint8_t>(val) << start_bit));                           \
    assert(get##fn_name() == val);                                            \
  }

constexpr uint8_t kAdcAddr = 0b01;

enum class AdcCommandType : uint8_t {
  kFastCommand = 0b00,
  kStaticRead = 0b01,
  kIncrementalWrite = 0b10,
  kIncrementalRead = 0b11,
};

// These are addresses of the register on the ADC itself. They have no
// correlation to how the data may be arranged in the AdcRegisters class.
enum class AdcRegisterAddresses : uint8_t {
  kAdcData = 0x0,
  kConfig0 = 0x1,
  kConfig1 = 0x2,
  kConfig2 = 0x3,
  kConfig3 = 0x4,
  kIrq = 0x5,
  kMux = 0x6,
  kScan = 0x7,
  kTimer = 0x8,
  kOffsetCal = 0x9,
  kGainCal = 0xA,
  kReserved1 = 0xB,
  kReserved2 = 0xC,
  kLock = 0xD,
  kReserved3 = 0xE,
  kCrcCfg = 0xF,
};

// =========== CONFIG0 ===========
enum class AdcClockSelection : uint8_t {
  kInternalWithOutput = 0b11,
  kInternalNoOutput = 0b10,
  kExternal = 0b00,  // default
};

enum class AdcAdcMode : uint8_t {
  kConversionMode = 0b11,
  kStandbyMode = 0b10,
  kShutdownMode = 0b00,  // default
};

// =========== CONFIG1 ===========
enum class AdcOversamplingRatio : uint8_t {
  kOsr98304 = 0b1111,
  kOsr81920 = 0b1110,
  kOsr49152 = 0b1101,
  kOsr40960 = 0b1100,
  kOsr24576 = 0b1011,
  kOsr20480 = 0b1010,
  kOsr16384 = 0b1001,
  kOsr8192 = 0b1000,
  kOsr4096 = 0b0111,
  kOsr2048 = 0b0110,
  kOsr1024 = 0b0101,
  kOsr512 = 0b0100,
  kOsr256 = 0b0011,  // default
  kOsr128 = 0b0010,
  kOsr64 = 0b0001,
  kOsr32 = 0b0000,
};

// =========== CONFIG2 ===========
enum class AdcBoost : uint8_t {
  kCurrent2 = 0b11,
  kCurrent1 = 0b10, // default
  kCurrent0p66 = 0b01,
  kCurrent0p50 = 0b00,
};

enum class AdcGain : uint8_t {
  kGain64 = 0b111, // x16 analog, x4 digital
  kGain32 = 0b110, // x16 analog, x2 digital
  kGain16 = 0b101,
  kGain8 = 0b100,
  kGain4 = 0b011,
  kGain2 = 0b010,
  kGain1 = 0b001, // default
  kGain0p33 = 0b000
};

enum class AdcAutoZeroingMux : uint8_t {
  kEnable = 0b1,
  kDisable = 0b0, // default
};

// Class providing a builder pattern for the ADC registers, so that I don't
// accidentally mess up a raw bit manipulation somewhere.
class AdcRegisters {
 public:
  static constexpr size_t REGISTER_MAP_SIZE = 23;

 private:
  // All the register data from CONFIG0 to GAINCAL, inclusive.
  //
  // Does include the RESERVED bytes before the LOCK byte, and the LOCK byte.
  //
  // Does not include the ADCDATA bytes (at the start of the register map).
  // Does not include the CRCCFG byte, as the reserved byte before that
  // depends on the product ID, and we can't incremental write to that address
  // (0xE) anyhow (as it'll loop back to CONFIG1 after LOCK).
  static constexpr uint8_t DEFAULT_REGISTER_MAP[REGISTER_MAP_SIZE] = {
      0b11000000,  // CONFIG0

      0b00001100,  // CONFIG1

      0b10001011,  // CONFIG2

      0b00000000,  // CONFIG3

      0b01110011,  // IRQ

      0b00000001,  // MUX

      0b00000000,  // SCAN_HIGH
      0b00000000,  // SCAN_MID
      0b00000000,  // SCAN_LOW

      0b00000000,  // TIMER_HIGH
      0b00000000,  // TIMER_MID
      0b00000000,  // TIMER_LOW

      0b00000000,  // OFFSET_CAL_HIGH
      0b00000000,  // OFFSET_CAL_MID
      0b00000000,  // OFFSET_CAL_LOW

      0b10000000,  // GAIN_CAL_HIGH
      0b00000000,  // GAIN_CAL_MID
      0b00000000,  // GAIN_CAL_LOW

      0x90,  // RESERVED1_HIGH
      0x00,  // RESERVED1_MID
      0x00,  // RESERVED1_LOW

      0x50,  // RESERVED2

      0b10100101,  // LOCK
  };

 public:
  AdcRegisters(bool load_default = true) {
    if (load_default) {
      std::memcpy(map, DEFAULT_REGISTER_MAP, REGISTER_MAP_SIZE);
    }
  };

  uint8_t *data() { return map; }

  // CONFIG0
  BYTEMANIP(ClockSelection, 5, 4, 0);
  BYTEMANIP(AdcMode, 1, 0, 0);
  // CONFIG1
  BYTEMANIP(OversamplingRatio, 5, 2, 1);
  // CONFIG2
  BYTEMANIP(Boost, 7, 6, 2);
  BYTEMANIP(Gain, 5, 3, 2);
  BYTEMANIP(AutoZeroingMux, 2, 2, 2);

 private:
  uint8_t map[REGISTER_MAP_SIZE] = {};
};

inline uint8_t makeCommandByte(uint8_t dev_addr, AdcRegisterAddresses cmd_addr,
                               AdcCommandType cmd_type) {
  return ((dev_addr & 0b11) << 6) |
         ((static_cast<uint8_t>(cmd_addr) & 0b1111) << 2) |
         (static_cast<uint8_t>(cmd_type) & 0b11);
}
