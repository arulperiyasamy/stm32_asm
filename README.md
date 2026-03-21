This is my repository for learning arm-assembly, mcu-startup, gpio-conifgs, startup, linker-scripts and buildsystems(make) on arm-cortex-m3 based stm32f103c8t6.

Things I learnt by this blinky...

    1. Creating vector table
    
    2. Creating symbols and placing the sections of the object file in appropriate memory using linker script
    
    3. Copying .data section and zeroing .bss section using the symbols that i created in linker script
    
    4. Setting two stack pointers MSP and PSP for Exception handling and User programs respectively
    
    5. Changing controller mode to thread mode before entering user program
    
    6. Understood Exception entry, Hardware stacking and previlage levels
    
    7. Writing makefile for building, debugging, flashing and cleaing
    
    8. Instruction by instrucion debugging using GDB and inspecting section placements using OBJDUMP


ref1: https://developer.arm.com/documentation/dui0552/a/the-cortex-m3-instruction-set

ref2: https://www.st.com/resource/en/reference_manual/rm0008-stm32f101xx-stm32f102xx-stm32f103xx-stm32f105xx-and-stm32f107xx-advanced-armbased-32bit-mcus-stmicroelectronics.pdf

