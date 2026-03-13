.syntax unified
.cpu cortex-m3
.thumb

.equ RCC_BASE,      0x40021000
.equ GPIOC_BASE,    0x40011000

.equ RCC_EN_APB2,   (RCC_BASE  + 0x18)
.equ GPIOC_CR_HI,     (GPIOC_BASE + 0x04)
.equ GPIOC_OP_DR,     (GPIOC_BASE + 0x0C)

.equ RCC_ENIO,    (1 << 4)
.equ LED_PIN,       13
.equ LED_PIN_BITS, (LED_PIN - 8) * 4

.global gpio_config
gpio_config:
/* Enable GPIOC clock */
    LDR r0, =RCC_EN_APB2
    LDR r1, [r0]
    ORR r1, r1, #RCC_ENIO
    STR r1, [r0]

/* Configure GPIO13 output push-pull */
    LDR r0, =GPIOC_CR_HI
    LDR r1, [r0]

    // Clear MODE and CNF Bits
    AND r1, r1, ~(0xF << LED_PIN_BITS)

    // Set MODE and CNF Bits 0010 => 2MHz output push pull
    ORR r1, r1, 0x2 << LED_PIN_BITS
    STR r1, [r0]

    bx lr
