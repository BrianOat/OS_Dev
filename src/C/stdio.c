#include "stdio.h"

/* Uart - Serial Communicatio Protocol */
#define UART_BASE_ADDR 0xFE000000 /* Find out the one for Rpi4 */

/* Work in Progress, we need UART hardware specifications */
int putchar(int c) {
    /* Assuming UART_BASE_ADDR is the base address of the UART hardware */
    volatile unsigned int *uart = (volatile unsigned int *)UART_BASE_ADDR;

    /* Wait until the UART is ready to transmit */
    while (uart[0x18 / 4] & (1 << 5))
        ;

    /* Transmit the character */
    uart[0x00 / 4] = c;

    return c;
}

int printf(const char *format, ...) {
    /* Use putchar() for this implementation */
}
