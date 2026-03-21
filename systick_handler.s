.syntax unified
.cpu cortex-m3
.thumb

.section .text
.global Systick_Handler
.type Systick_Handler, %function

Systick_Handler:
    /* Load and Increment var when SysTick hits */

    LDR r3, .L3
    LDR r4, [r3]
    ADD r4, r4, #1
    STR r4, [r3] 
    
    BX lr

.L3:
    .word var
    .align 4
