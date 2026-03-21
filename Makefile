CC = arm-none-eabi-gcc

INTERFACE = openocd -f interface/stlink.cfg -f target/stm32f1x.cfg

CFLAGS = -mcpu=cortex-m3 -mthumb -O0 -g -ffreestanding -nostdlib
LDFLAGS = -T stm32f103.ld
TEMPS = -save-temps

SRCS = *.s
TARGET = a.elf

$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) $(LDFLAGS) $^

temps:
	$(CC) $(CFLAGS) $(LDFLAGS) $(TEMPS) $(SRCS)

flash: $(TARGET)
	$(INTERFACE) -c "program $(TARGET) verify reset exit"

debug:
	$(INTERFACE)

clean_temps:
	rm -f *.o

clean:
	rm -f *.elf *.bin
