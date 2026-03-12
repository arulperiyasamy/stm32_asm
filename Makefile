CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy

CFLAGS=-mcpu=cortex-m3 -mthumb -O0 -g -ffreestanding -nostdlib
LDFLAGS=-T stm32f103.ld

all: main.elf

main.elf: main.s startup_stm32f103.s
	$(CC) $(CFLAGS) $(LDFLAGS) startup_stm32f103.s main.s -o main.elf

flash: main.elf
	openocd -f interface/stlink.cfg -f target/stm32f1x.cfg \
	-c "program main.elf verify reset exit"

clean:
	rm -f *.elf

