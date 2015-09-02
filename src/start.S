/* === Multiboot Header === */
MBALIGN     =  (1<<0)
MEMINFO     =  (1<<1)
MAGIC       =  0x1BADB002
FLAGS       = (MBALIGN | MEMINFO)
CHECKSUM    = -(MAGIC + FLAGS)

.section .multiboot, "a"
	.long MAGIC
	.long FLAGS
	.long CHECKSUM

.section .text
.extern kmain
.globl start
start:
	mov $init_stack, %esp
	call kmain
	/* If kmain returns, loop forefer */
.l:
	hlt
	jmp .l	

.section .bss
	.space 0x1000*2
init_stack:

