PROGRAM_SPACE equ 0x7e00 ; create a constant 
ReadDisk:
    mov bx, PROGRAM_SPACE
    mov al, 4 ; size of the sector to read
    mov dl, [BOOT_DISK]
    mov ch, 00
    mov dh, 00
    mov cl, 0x02 ; read the second sector
    int 0x13

    jc DiskReadFailed
    ret

BOOT_DISK: db 0
DISKREADERRORSTRING: db "Disk read error", 0
DiskReadFailed:
    mov bx, DISKREADERRORSTRING
    call PrintString
    jmp $