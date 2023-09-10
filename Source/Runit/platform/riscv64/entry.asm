.section .text

.global _prelude
_prelude:
  la sp, stk_end
  call runit_prelude
  j _runit_hang // Hang after runit_prelude returns (it shouldn't)

.global _runit_hang
_runit_hang:
  wfi
  j _runit_hang

.section .bss
stk_start:
  .skip 0x1000
stk_end:
