ENTRY(_prelude)

MEMORY {
  ram (rwx): ORIGIN = 0x80200000, LENGTH = 0x2fff000
}

SECTIONS {
  .text : ALIGN(8) {
    *(.text.prelude);

    *(.text);
    *(.text.*);
  } > ram

  .data : ALIGN(8) {
    *(.data);
    *(.data.*);
  } > ram

  .stack : ALIGN(8) {
    _stk_btm = .;
    . += 1024;
    _stk_top = .;
  } > ram
}
