; boot.asm

[org 0x7c00]  ; Set origin to 0x7c00

start:
    mov ax, cs
    mov ds, ax
    mov es, ax

    ; Load kernel
    mov ah, 0x02    ; BIOS disk read
    mov al, 1       ; Number of sectors to read
    mov ch, 0       ; Cylinder number
    mov dh, 0       ; Head number
    mov cl, 2       ; Sector number
    mov bx, 0x8000  ; Destination address (where kernel will be loaded)
    int 0x13        ; BIOS disk interrupt

    ; Jump to kernel
    jmp 0x8000:0    ; CS:IP = 0x8000:0

    times 510-($-$$) db 0  ; Fill rest of sector with zeros
    dw 0xaa55               ; Boot signature
