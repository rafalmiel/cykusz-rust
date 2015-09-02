ENTRY(start)
OUTPUT_FORMAT(elf32-i386)

SECTIONS {
	. = 0x100000;

	.text  : AT(ADDR(.text)) {
                KEEP( *(.multiboot) )
		*(.text .text.*)
	}
	
	/* read-only data, page aligned to allow use of the no-execute feature */
	.rodata : AT(ADDR(.rodata)) {
		*(.rodata .rodata.*)
	}
	
	.data : AT(ADDR(.data)) {
		*(.data .data.*)
	}
	
	/* Zero-initialised data */
	.bss : AT(ADDR(.bss)) {
		*(.bss .bss.*)
	}
	
	kernel_end = .;
}
