.section .text.prelude
.global _prelude

_prelude:
  la sp, _stk_top
  call _initialize
