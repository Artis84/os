; kernel_entry.asm

[extern main]
[extern terminal_initialize]

section .text
global _start

_start:
    ; Set up stack
    mov esp, stack_top

    ; Call kernel main
    call main

    ; Halt CPU
    cli
.hang:
    hlt
    jmp .hang

section .bss
stack_bottom equ 0x8000000   ; Address of bottom of stack
stack_size   equ 0x1000       ; Stack size (4KB)
stack_top    equ stack_bottom - stack_size
