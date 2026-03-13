.syntax unified
.cpu cortex-m3
.thumb

.equ SYSTICK_CSR, 0xE000E010
.equ SYSTICK_RVR, 0xE000E014
.equ SYSTICK_CVR, 0xE000E018
.equ SYSTICK_R, 0xE000E01C

.global systick_config
systick_config:

    /* Setting reload value */
    LDR r0, =SYSTICK_RVR
    LDR r1, =9000
    STR r1, [r0]

    /* Clear current value Reg.  */
    LDR     R0, =SYSTICK_CVR
    MOVS    R1, #0
    STR     R1, [R0]

    /* Configure SYSTICK */
    CPSIE I
    LDR r0, =SYSTICK_CSR
    MOV r1, #7
    STR r1, [r0]

    bx lr
