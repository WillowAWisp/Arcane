//
// Created by Willow Bracker on 9/10/23.
//

#pragma once

#include "types/ctypes.h"

extern "C" long sbi_set_timer(u64 time);
extern "C" long sbi_console_putchar(i32 character);
extern "C" long sbi_console_getchar();
extern "C" long sbi_clear_ipi();
extern "C" long sbi_send_ipi(FlatPtr hart_mask);
extern "C" long sbi_remote_fence_i(FlatPtr hart_mask);
extern "C" long sbi_remote_sfence_vma(FlatPtr hart_mask, FlatAddress start, FlatAddress end);
extern "C" long sbi_remote_sfence_vma_asid(FlatPtr hart_mask, FlatAddress start, FlatAddress end, FlatAddress asid);
extern "C" [[noreturn]] void sbi_shutdown();
