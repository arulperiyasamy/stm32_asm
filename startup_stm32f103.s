.syntax unified
.cpu cortex-m3
.thumb

/* Symbols from linker */
.extern _estack
.extern bl gpio_config
.extern bl systick_config
.extern main

.section .isr_vector,"a",%progbits
.word _estack            /* Initial stack pointer */
.word Reset_Handler      /* Reset handler */
.word 0                  /* NMI */
.word 0                  /* HardFault */
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word 0
.word Systick_Handler      /* SYSTICK_TIMER */
.word Systick_Handler

.section .text
.global Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    bl gpio_config
    bl systick_config
    bl main

LoopForever:
    b LoopForever

