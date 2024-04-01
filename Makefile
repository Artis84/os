# Makefile

all: kernel.bin

boot.o: boot.asm
    nasm -f bin boot.asm -o boot.o

kernel_entry.o: kernel_entry.asm
    nasm -f elf32 kernel_entry.asm -o kernel_entry.o

kernel.o: kernel.c
    gcc -m32 -c kernel.c -o kernel.o

kernel.bin: boot.o kernel_entry.o kernel.o
    ld -m elf_i386 -Ttext 0x8000 -o kernel.bin boot.o kernel_entry.o kernel.o

clean:
    rm -f *.o *.bin
