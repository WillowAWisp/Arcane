ENTRY(_prelude)

MEMORY {
  ram (rwx): ORIGIN = 0x80200000, LENGTH = 0x2FFF000
}

SECTIONS {
  .text : ALIGN(8) {
    *(.text);
    *(.text.*);
  } > ram

  .data : ALIGN(8) {
    *(.data);
    *(.data.*);
  } > ram

  .rodata : ALIGN(8) {
    *(.rodata);
    *(.rodata.*);
  } > ram

  .bss : ALIGN(8) {
    *(.bss);
    *(.bss.*);
  } > ram
}
