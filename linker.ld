/* linker.ld */
ENTRY(_start)

SECTIONS
{
    /* Typically, the Raspberry Pi bootloader expects the kernel to be loaded at 0x80000.
       However, make sure to check the bootloader and firmware documentation in case this has
       changed or if you are using a different bootloader that might expect a different address. */
    . = 0x80000;
    
    /* Place the boot code first */
    .text.boot : ALIGN(4K)
    {
        *(.text.boot)
    }
    
    /* The main code section */
    .text : ALIGN(4K)
    {
        *(.text)
    }
    
    /* Read-only data section */
    .rodata : ALIGN(4K)
    {
        *(.rodata)
    }
    
    /* Initialized data section */
    .data : ALIGN(4K)
    {
        *(.data)
    }
    
    /* Uninitialized data section */
    .bss : ALIGN(4K)
    {
        *(COMMON)
        *(.bss)
    }
    
    /* Define a symbol '_end' to mark the end of the BSS section */
    . = ALIGN(4K);
    _end = .;
    
    /* Discard unnecessary sections */
    /DISCARD/ : {
        *(.comment)
        *(.eh_frame)
        *(.eh_frame_hdr)
    }
}
