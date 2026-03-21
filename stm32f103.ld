ENTRY(Reset_Handler)
OUTPUT(a.elf)

/* Memory layout for STM32F103C8T6 */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 128K
    RAM   (rwx): ORIGIN = 0x20000000, LENGTH = 20K
}

/* mstack from 0x20000000 + 20k */
/* 0x20005000 */
_mstack = ORIGIN(RAM) + LENGTH(RAM);

/* pstack from 0x20000000 + 15k */
/* 0x20003c00 */
_pstack = ORIGIN(RAM) + 15k;

SECTIONS
{
    .isr_vector :
    {
        KEEP(*(.isr_vector));
    } > FLASH

    .text :
    {
        *.text;
        *(.rodata);
        _text_end = .; 
    } > FLASH

    .data :
    {
         _data_start = .; 
        *(.data*);
        _data_end = .; 
    } > RAM AT > FLASH

    .bss :
    {
        _bss_start = .;
        *(.bss*)
        *(COMMON);
        _bss_end = .;
    } > RAM
}
