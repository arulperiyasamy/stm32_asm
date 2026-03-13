.syntax unified
.cpu cortex-m3
.thumb

.equ GPIOC_BASE,    0x40011000
.equ GPIOC_OP_DR,     (GPIOC_BASE + 0x0C)
.equ LED_PIN,       13

.section .bss
.global var
.align 2
.type var, %object
.size var, 4
var:

.section .text
.global main
.type main, %function

main:
/* Infinite loop */

    LDR r0, =GPIOC_OP_DR
    LDR r1, [r0]

toggle:
    EOR r1, r1, #(1 << LED_PIN)
    STR r1, [r0]

loop:
    LDR r0, .L3
    LDR r1, =10000
    CMP r1, r0
    
    
    B loop 

.L3:
    .word var
