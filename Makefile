CC = arm-none-eabi-gcc

CFLAGS = -mcpu=cortex-m3 -mthumb -O0 -g -ffreestanding -nostdlib
LDFLAGS = -T stm32f103.ld
TEMPS = -save-temps

SRCS = $(wildcard *.s)
TARGET = a.elf

all: $(TARGET)

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^

temps:
	$(CC) $(CFLAGS) $(LDFLAGS) $(TEMPS) $(SRCS)

flash: $(TARGET)
	openocd -f interface/stlink.cfg -f target/stm32f1x.cfg -c "program $(TARGET) verify reset exit"

clean_temps:
	rm -f *.o

clean:
	rm -f *.elf *.bin
