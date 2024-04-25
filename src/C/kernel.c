/* kernel.c */
#include <stdio.h>

/* Intialize Hardware*/
void init_hardware() {
    printf("Hello");
}

/* Kernel entry point */
void kernel_main() {

    init_hardware();

    /* Kernel Logic here */
    
    printf("Hardware initialized!");
}
