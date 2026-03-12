.syntax unified
.cpu cortex-m3
.thumb

/* Symbols from linker */
.extern _estack
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
.word 0      /* SYSTICK_TIMER */
.word 0

.section .text
.global Reset_Handler
.type Reset_Handler, %function

Reset_Handler:
    bl main

LoopForever:
    b LoopForever

