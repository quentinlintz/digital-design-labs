TARGET ?= hello

default:
	rm -rf $(TARGET)
	riscv64-linux-gnu-as $(TARGET).s -o $(TARGET).o
	riscv64-linux-gnu-gcc -o bin/$(TARGET) $(TARGET).o -nostdlib -static

clean:
	rm -f $(TARGET) $(TARGET).o
