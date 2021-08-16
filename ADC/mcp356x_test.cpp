#include "mcp356x.h"

#include <gtest/gtest.h>

TEST(Swap, Swap4) {
  uint32_t msb = 0x12345678;
  uint32_t lsb = 0x78563412;
  EXPECT_EQ(msb, swap_msb_and_host<4>(lsb));
}

TEST(Swap, Swap3) {
  uint32_t msb = 0x00'03'02'01;
  uint32_t lsb = 0x00'01'02'03;
  EXPECT_EQ(msb, swap_msb_and_host<3>(lsb));
}

TEST(Swap, Swap2) {
  uint32_t msb = 0x00001234;
  uint32_t lsb = 0x00003412;
  EXPECT_EQ(msb, swap_msb_and_host<2>(lsb));
}

TEST(Swap, Swap1) {
  uint32_t msb = 0x00000012;
  uint32_t lsb = 0x00000012;
  EXPECT_EQ(msb, swap_msb_and_host<1>(lsb));
}
