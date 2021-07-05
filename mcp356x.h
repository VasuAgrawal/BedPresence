#pragma once
#include <stdio.h>

#include <array>
#include <bit>
#include <cassert>
#include <cstdint>
#include <cstring>

#include "bit_utils.h"
#include "magic_enum.hpp"

static_assert((std::endian::native == std::endian::big) ||
              (std::endian::native == std::endian::little));
#define MSB_BITFIELD(name, size, default_value)                           \
  uint32_t name                                                           \
      : size = swap_msb_and_host<numBitsToNumBytes(size)>(default_value); \
  static_assert(size > 0, "Bitfield must have postive size");             \
  static_assert(size < (sizeof(uint32_t) * sizeof(char) * 8),             \
                "Bitfield too big!");                                     \
  uint32_t internalGetData##name() const {                                \
    return swap_msb_and_host<numBitsToNumBytes(size)>(name);              \
  }                                                                       \
  void internalSetData##name(uint32_t value) {                            \
    name = swap_msb_and_host<numBitsToNumBytes(size)>(value);             \
  }

#define BITMANIP_READONLY(data_member_name, data_enum_name, end_bit,           \
                          start_bit)                                           \
  inline auto get##data_enum_name() const {                                    \
    return data_enum_name(                                                     \
        (internalGetData##data_member_name() & bitmask(end_bit, start_bit)) >> \
        start_bit);                                                            \
  }

#define BITMANIP(data_member_name, data_enum_name, end_bit, start_bit)         \
  BITMANIP_READONLY(data_member_name, data_enum_name, end_bit, start_bit);     \
  template <data_enum_name val>                                                \
  inline void set##data_enum_name() {                                          \
    printf("%sSetting %35s to %2u (%35.*s) from %2u (%35.*s)\n",               \
           (get##data_enum_name() == val) ? "   " : "** ", #data_enum_name,    \
           static_cast<uint8_t>(val),                                          \
           static_cast<int>(magic_enum::enum_name<val>().size() - 1),          \
           magic_enum::enum_name<val>().data() + 1,                            \
           static_cast<uint8_t>(get##data_enum_name()),                        \
           static_cast<int>(                                                   \
               magic_enum::enum_name(get##data_enum_name()).size() - 1),       \
           magic_enum::enum_name(get##data_enum_name()).data() + 1);           \
    internalSetData##data_member_name(                                         \
        (internalGetData##data_member_name() & ~bitmask(end_bit, start_bit)) | \
        (static_cast<uint32_t>(val) << start_bit));                            \
    assert(get##data_enum_name() == val);                                      \
  }

constexpr uint8_t kAdcAddr = 0b01;

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

enum class AdcCommandType : uint8_t {
  kFastCommand = 0b00,
  kStaticRead = 0b01,
  kIncrementalWrite = 0b10,
  kIncrementalRead = 0b11,
};

inline uint8_t makeCommandByte(uint8_t dev_addr, AdcRegisterAddresses cmd_addr,
                               AdcCommandType cmd_type) {
  return ((dev_addr & 0b11) << 6) |
         ((static_cast<uint8_t>(cmd_addr) & 0b1111) << 2) |
         (static_cast<uint8_t>(cmd_type) & 0b11);
}

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
  kCurrent1 = 0b10,  // default
  kCurrent0p66 = 0b01,
  kCurrent0p50 = 0b00,
};

enum class AdcGain : uint8_t {
  kGain64 = 0b111,  // x16 analog, x4 digital
  kGain32 = 0b110,  // x16 analog, x2 digital
  kGain16 = 0b101,
  kGain8 = 0b100,
  kGain4 = 0b011,
  kGain2 = 0b010,
  kGain1 = 0b001,  // default
  kGain0p33 = 0b000
};

enum class AdcAutoZeroingMux : uint8_t {
  kEnable = 0b1,
  kDisable = 0b0,  // default
};

// =========== CONFIG3 ===========
enum class AdcConversionMode : uint8_t {
  kContinuousConversion = 0b11,
  kOneShotStandby = 0b10,
  kOneShotShutdown = 0b00,  // default
};

enum class AdcDataFormat : uint8_t {
  k32BitWitChannelIdAndOverrange = 0b11,
  k32BitWitOverrange = 0b10,
  k32BitNoOverrange = 0b01,
  k24BitNoOverrange = 0b00,  // default
};

enum class AdcEnableDigitalOffsetCalibration : uint8_t {
  kEnable = 0b1,
  kDisable = 0b0,  // default
};

enum class AdcEnableDigitalGainCalibration : uint8_t {
  kEnable = 0b1,
  kDisable = 0b0,  // default
};

// =========== IRQ ===========
enum class AdcDataReadyFlag : uint8_t {
  kNotUpdated = 0b1,  // default
  kReady = 0b0,
};

enum class AdcPowerOnResetFlag : uint8_t {
  kResetOccured = 0b1,  // default
  kNoReset = 0b0,
};

enum class AdcIrqModeOutputSelection : uint8_t {
  kMdatOutput = 0b1,
  kIrqOutput = 0b0,  // default
};

enum class AdcIrqModeInactiveSelection : uint8_t {
  kLogicHigh = 0b1,
  kHighZ = 0b0,  // default
};

enum class AdcEnableFastCommands : uint8_t {
  kEnable = 0b1,  // default
  kDisable = 0b0,
};

enum class AdcEnableConversionStartInterrupt : uint8_t {
  kEnable = 0b1,  // default
  kDisable = 0b0,
};

// =========== MUX ===========
enum class AdcMuxVinPlusSelection : uint8_t {
  kInternalVcm = 0b1111,
  kInternalTempDiodeM = 0b1110,
  kInternalTempDiodeP = 0b1101,
  kRefInMinus = 0b1100,
  kRefInPlus = 0b1011,
  kAvdd = 0b1001,
  kAgnd = 0b1000,
  kCh7 = 0b0111,
  kCh6 = 0b0110,
  kCh5 = 0b0101,
  kCh4 = 0b0100,
  kCh3 = 0b0011,
  kCh2 = 0b0010,
  kCh1 = 0b0001,
  kCh0 = 0b0000,  // default
};

enum class AdcMuxVinMinusSelection : uint8_t {
  kInternalVcm = 0b1111,
  kInternalTempDiodeM = 0b1110,
  kInternalTempDiodeP = 0b1101,
  kRefInMinus = 0b1100,
  kRefInPlus = 0b1011,
  kAvdd = 0b1001,
  kAgnd = 0b1000,
  kCh7 = 0b0111,
  kCh6 = 0b0110,
  kCh5 = 0b0101,
  kCh4 = 0b0100,
  kCh3 = 0b0011,
  kCh2 = 0b0010,
  kCh1 = 0b0001,  // default
  kCh0 = 0b0000,
};

class AdcRegisters {
 public:
  uint8_t const* begin() const {
    return reinterpret_cast<uint8_t const*>(this);
  }

  uint8_t const* end() const { return begin() + sizeof(*this); }

  uint8_t* data() { return reinterpret_cast<uint8_t*>(this); }

  uint8_t const* data() const { return begin(); }

  size_t size() const { return sizeof(*this); };

  void wipe() { std::memset(data(), 0, sizeof(AdcRegisters)); }

  BITMANIP(config0, AdcClockSelection, 5, 4);
  BITMANIP(config0, AdcAdcMode, 1, 0);

  BITMANIP(config1, AdcOversamplingRatio, 5, 2);

  BITMANIP(config2, AdcBoost, 7, 6);
  BITMANIP(config2, AdcGain, 5, 3);
  BITMANIP(config2, AdcAutoZeroingMux, 2, 2);

  BITMANIP(config3, AdcConversionMode, 7, 6);
  BITMANIP(config3, AdcDataFormat, 5, 4);
  BITMANIP(config3, AdcEnableDigitalOffsetCalibration, 1, 1);
  BITMANIP(config3, AdcEnableDigitalGainCalibration, 0, 0);

  BITMANIP_READONLY(irq, AdcDataReadyFlag, 6, 6);
  BITMANIP_READONLY(irq, AdcPowerOnResetFlag, 4, 4);
  BITMANIP(irq, AdcIrqModeOutputSelection, 3, 3);
  BITMANIP(irq, AdcIrqModeInactiveSelection, 2, 2);
  BITMANIP(irq, AdcEnableFastCommands, 1, 1);
  BITMANIP(irq, AdcEnableConversionStartInterrupt, 0, 0);

  BITMANIP(mux, AdcMuxVinPlusSelection, 7, 4);
  BITMANIP(mux, AdcMuxVinMinusSelection, 3, 0);

 private:
  MSB_BITFIELD(config0, 8, 0b11000000);
  MSB_BITFIELD(config1, 8, 0b00001100);
  MSB_BITFIELD(config2, 8, 0b10001011);
  MSB_BITFIELD(config3, 8, 0b00000000);
  MSB_BITFIELD(irq, 8, 0b01110011);
  MSB_BITFIELD(mux, 8, 0b00000001);
  MSB_BITFIELD(scan, 24, 0b00000000'00000000'00000000);
  MSB_BITFIELD(timer, 24, 0b00000000'00000000'00000000);
  MSB_BITFIELD(offset_cal, 24, 0b00000000'00000000'00000000);
  MSB_BITFIELD(gain_cal, 24, 0b10000000'00000000'00000000);
  MSB_BITFIELD(reserved1, 24, 0x900000);
  MSB_BITFIELD(reserved2, 8, 0x50);
  MSB_BITFIELD(lock, 8, 0b10100101);

} __attribute__((packed));

static_assert(sizeof(AdcRegisters) == 23, "Size is wrong!");
