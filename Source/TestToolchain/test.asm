.section .text
.global _prelude

_prelude:
  wfi
  j _prelude
