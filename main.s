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
    /* Load Data Reg. value to R0 */
    LDR r0, =GPIOC_OP_DR
    LDR r1, [r0]

    /* Toggle LED_PIN Bit */
toggle:
    EOR r1, r1, #(1 << LED_PIN)
    STR r1, [r0]
    
    /* Compare is var value 500 */
    /* Var incremeted by the SysTick_Handler */
wait:
    LDR r2, =var
    LDR r3, [r2]
    CMP r3, #500

    /* If != Branch to wait: */
    BLT wait

    /* If == Reset var & Branch to toggle: */
    MOV r3, #0
    STR r3, [r2]
    B toggle

.L3:
    .word var
