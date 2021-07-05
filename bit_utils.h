#pragma once

#include <cstdint>
#include <array>
#include <bit>
#include <cassert>
#include <cstdio>

// There's probably a better way to do this ... oh well
consteval auto generateBitmasks(uint8_t offset = 0) {
  std::array<uint32_t, 32> masks{0};
  for (size_t i = 0; i < masks.size(); ++i) {
    for (size_t j = 0; j < (i + 1 - offset); ++j) {
      masks[i] |= 1 << j;
    }
  }

  return masks;
}

inline consteval uint8_t bitmask(uint8_t end_bit, uint8_t start_bit) {
  const auto kBitmasks = generateBitmasks();
  const auto kOffsetBitmasks = generateBitmasks(1);
  return kBitmasks[end_bit] & ~kOffsetBitmasks[start_bit];
}

template <uint32_t bitfield_bytes>
constexpr uint32_t swap_msb_and_host(uint32_t value) {
  static_assert(0 < bitfield_bytes, "Too few bitfield bytes!");
  static_assert(bitfield_bytes <= 4, "Too many bitfield bytes!");
  if constexpr (std::endian::native == std::endian::big) {
    // Don't need to do anything when the host is also big endian
    return value;
  } else if constexpr (std::endian::native == std::endian::little) {
    if constexpr (bitfield_bytes == 1) {
      return value & 0xFF;
    } else if constexpr (bitfield_bytes == 2) {
      return ((value & 0xFF) << 8) | ((value >> 8) & 0xFF);
    } else if constexpr (bitfield_bytes == 3) {
      return (((value & 0xFF) << 16) | (value & 0xFF00) |
              ((value >> 16) & 0xFF));
    } else {
      return (((value & 0xFF) << 24) | (((value >> 8) & 0xFF) << 16) |
              (((value >> 16) & 0xFF) << 8) | ((value >> 24) & 0xFF));
    }
  }
}

consteval uint32_t numBitsToNumBytes(uint32_t bits) {
  assert(bits > 0);
  return ((bits - 1) / 8) + 1;
}

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
