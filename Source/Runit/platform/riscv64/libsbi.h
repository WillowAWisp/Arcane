//
// Created by wbracker on 9/9/23.
//

#pragma once

// see https://github.com/riscv-non-isa/riscv-sbi-doc/blob/v1.0.0/riscv-sbi.adoc for documentation.

using u64 = __UINT64_TYPE__;

extern "C" long sbi_set_timer(u64);
extern "C" long sbi_console_putchar(int character);
extern "C" long sbi_console_getchar();
extern "C" long sbi_clear_ipi();
extern "C" long sbi_send_ipi(const unsigned long* hart_mask);
extern "C" long sbi_remote_fence_i(const unsigned long* hart_mask);
extern "C" long sbi_remote_sfence_vma(const unsigned long* hart_mast, unsigned long start, unsigned long size);
extern "C" long sbi_remote_sfence_vma_asid(const unsigned long* hart_mast, unsigned long start, unsigned long size, unsigned long asid);
extern "C" void sbi_shutdown();
