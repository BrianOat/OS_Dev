.section .text
.global _start

_start:
    ldr x1, =hello_world    // Load the address of the hello_world string

print_char:
    ldrb w2, [x1], #1       // Load the next character into w2 and increment the address
    cbz w2, done            // If the byte is zero, we reached the end of the string
    
    // 0x09000000 is the base address for the UART
    ldr x0, =0x09000000     // Load the address of the serial port's data register
    strb w2, [x0]           // Store the character in the serial port's data register
    b print_char            // Loop back to print the next character

done:
    wfe                     // Wait for event
    b done                  // Loop indefinitely

.section .rodata
hello_world:
    .ascii "Hello World\n\0"
