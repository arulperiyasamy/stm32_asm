ENTRY(Reset_Handler)
OUTPUT(a.elf)

/* Memory layout for STM32F103C8T6 */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 128K
    RAM   (rwx): ORIGIN = 0x20000000, LENGTH = 20K
}

/* Stack at top of RAM */
_estack = ORIGIN(RAM) + LENGTH(RAM);

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
