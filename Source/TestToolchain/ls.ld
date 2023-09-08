ENTRY(_prelude)

MEMORY {
    ram (rwx): ORIGIN = 0x80200000, LENGTH = 0x2fff000
}

SECTIONS {
    .text : ALIGN(8) {
        *(.text);
        *(.text.*);
    } > ram
}
