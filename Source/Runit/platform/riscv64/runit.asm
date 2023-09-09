.section .text

.global _prelude
_prelude:
  la sp, stk_end
  call runit_prelude
  // Hang after runit_prelude returns (it shouldn't)
  j _runit_hang

.global _runit_hang
_runit_hang:
  wfi
  j _runit_hang

.global sbi_console_putchar
sbi_console_putchar:
  li a7, 0x01
  ecall
  ret

.section .bss
stk_start:
  .skip 0x1000
stk_end:
