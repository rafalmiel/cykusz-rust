MBALIGN		equ	1<<0
MEMINFO		equ	1<<1
MAGIC		equ	0x1BADB002
FLAGS		equ	MBALIGN | MEMINFO
CHECKSUM	equ	-(MAGIC + FLAGS)

section .multiboot
align 4
	dd MAGIC
	dd FLAGS
	dd CHECKSUM

section .bootstrap_stack
align 4
stack_bottom:
times 16384 db 0
stack_top:

section .text
extern kmain
global start

start:
	mov esp, stack_top
	call kmain
	
.hang:
	hlt
	jmp .hang


