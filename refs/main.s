.syntax unified
.cpu cortex-m3
.thumb

.equ RCC_BASE,      0x40021000
.equ GPIOC_BASE,    0x40011000

.equ RCC_APB2ENR,   (RCC_BASE  + 0x18)
.equ GPIOC_CRH,     (GPIOC_BASE + 0x04)
.equ GPIOC_ODR,     (GPIOC_BASE + 0x0C)

.equ RCC_IOPCEN,    (1 << 4)
.equ LED_PIN,       13

.global main

main:

/* Enable GPIOC clock */
    LDR r0, =RCC_APB2ENR
    LDR r1, [r0]
    ORR r1, r1, #RCC_IOPCEN
    STR r1, [r0]

/* Configure PC13 output push-pull */
    LDR r0, =GPIOC_CRH
    LDR r1, [r0]

/* Clear bits */
    LDR r2, =(0xF << ((LED_PIN - 8) * 4))
    BIC r1, r1, r2

/* Set MODE = 2MHz output */
    LDR r2, =(0x2 << ((LED_PIN - 8) * 4))
    ORR r1, r1, r2
    STR r1, [r0]

/* Infinite loop */
loop:

    LDR r0, =GPIOC_ODR
    LDR r1, [r0]

/* Toggle bit */
    EOR r1, r1, #(1 << LED_PIN)
    STR r1, [r0]

/* Delay */
    LDR r2, =500000

delay:
    NOP
    SUBS r2, r2, #1
    BNE delay

    B loop
