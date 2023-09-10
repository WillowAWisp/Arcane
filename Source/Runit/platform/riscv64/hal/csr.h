//
// Created by Willow Bracker on 9/10/23.
//

#pragma once

#include <types/ctypes.h>

#define read_csr(register) (                                                   \
  u64 _temp;                                                                   \
  asm volatile("csrr %0, " #register : "=r"(_temp) );                          \
  _temp;                                                                       \
)

#define write_csr(register, value)                                             \
  asm volatile("csrw " #register ", %0" :: "rK"(value));



