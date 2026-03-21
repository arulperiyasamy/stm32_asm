.syntax unified
.cpu cortex-m3
.thumb

/* Symbols from linker */
.extern _mstack
.extern _pstack
.extern _text_end
.extern _bss_start
.extern _bss_end
.extern _data_start
.extern _data_end


.extern bl gpio_config
.extern bl systick_config
.extern main

.section .isr_vector,"a",%progbits
.word _mstack            /* Initial stack pointer */
.word Reset_Handler      /* Reset handler */
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
.word 0
.word 0
.word Systick_Handler      /* SYSTICK_TIMER */
.word Systick_Handler

.section .text
.global Reset_Handler
.type Reset_Handler, %function

Reset_Handler:

    

    /*------------ Make .bss section 0 ---------*/
    LDR r0, = _bss_start
    LDR r1, = _bss_end
    MOV r2, #0

    /* Loop */
    CHK_BSS_OVERLAP:
    CMP r0, r1
    BHS DONE_BSS_0  

    STR r2, [r0]
    ADD r0, #4
    B CHK_BSS_OVERLAP

    DONE_BSS_0:



    /*------------- Copy .data section ----------*/
    LDR r0, =_text_end
    LDR r1, =_data_start
    LDR r2, =_data_end

    /* Loop */
    CHK_DATA_END:
    CMP r1, r2
    BHS DONE_DATA_CPY
  
    LDR r3, [r0]
    ADD r0, #4
    STR r3, [r1]
    ADD r1, #4
    B CHK_DATA_END

    DONE_DATA_CPY:


    BL gpio_config
    BL systick_config


    /* Change Stack Pounter */
    LDR R0, =_pstack
    MSR PSP, R0

    /* Change to Program MODE */
    MRS R0, CONTROL
    ORR R0, R0, #3
    MSR CONTROL, R0
    
    ISB 

    BL main

LoopForever:
    B LoopForever
