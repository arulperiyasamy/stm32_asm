.syntax unified
.cpu cortex-m3
.thumb

/* Debuging sec. */
.equ GPIOC_BASE,    0x40011000
.equ GPIOC_OP_DR,     (GPIOC_BASE + 0x0C)
/* Degub end */

.section .text
.global Systick_Handler
.type Systick_Handler, %function

Systick_Handler:
    ldr r3, .L3
    ldr r4, [r3]
    add r4, r4, #1
    str r4, [r3] 

/* Debuging sec. */
//    LDR r0, =GPIOC_OP_DR
//    LDR r1, [r0]
//    EOR r1, r1, #(1 << 13)
//    STR r1, [r0]
/* Degub end */

.L3:
    .word var
