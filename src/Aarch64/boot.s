// start.S
.global _start

.section ".text.boot"
_start:
    // Set up stack pointer
    ldr x1, =_stack_top
    mov sp, x1

    // Call the C kernel entry point
    bl kernel_main

    // Halt if we return from kernel_main
    b .

.section ".bss"
.balign 8
_stack_bottom:
    .skip 4096
_stack_top:
