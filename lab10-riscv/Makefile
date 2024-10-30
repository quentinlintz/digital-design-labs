TOOLCHAIN_PREFIX ?= riscv64-unknown-elf-

TARGET ?= div9
OBJCOPY = $(TOOLCHAIN_PREFIX)objcopy
LD = $(TOOLCHAIN_PREFIX)ld
AS = $(TOOLCHAIN_PREFIX)as
GCC = $(TOOLCHAIN_PREFIX)gcc

all: $(TARGET).s
	$(GCC)  -O0 -ggdb -nostdlib -march=rv32i -mabi=ilp32 -Wl,-Tmain.ld $(TARGET).s -o bin/$(TARGET).elf
	$(OBJCOPY) -O binary bin/$(TARGET).elf output/$(TARGET).bin
	xxd -e -c 4 -g 4 output/$(TARGET).bin

debug:
	qemu-system-riscv32 -S -M virt -nographic -bios none -kernel bin/$(TARGET).elf -gdb tcp::1234

gdb:
	gdb bin/$(TARGET).elf -ex "target remote localhost:1234" -ex "break _start" -ex "continue" -q

.PHONY: clean
clean:
	rm -rf bin .gdb_history
