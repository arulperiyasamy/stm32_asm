.syntax unified
.cpu cortex-m3
.thumb

.equ SYSTICK_CSR, 0xE000E010
.equ SYSTICK_RVR, 0xE000E014
.equ SYSTICK_, 0xE000E018
.equ SYSTICK_R, 0xE000E01C

.global systick_config
systick_config:
    /* Configure SYSTICK */
    CPSIE I
    LDR r3, =SYSTICK_CSR
    LDR r4, [r3]
    LDR r5, =0x7
    ORR r4, r4, r5
    STR r4, [r3]

    /* Setting reload value */
    LDR r0, =SYSTICK_RVR
    LDR r1, =0x00F
    STR r1, [r0]
    bx  lr
