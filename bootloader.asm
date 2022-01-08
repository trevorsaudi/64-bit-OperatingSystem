; mov ah, 0x0e ; scrolling teletype bios routine
; mov al, 'H' ; the bios knows to print this bc of above line
; int 0x10

; function prologue
[org 0x7c00] ; where we load the program
mov [BOOT_DISK], dl; 
mov bp, 0x7c00 ; 0x7c00 is the start address where the program gets loaded
mov sp, bp

mov bx, Teststring
;call PrintString
call ReadDisk
jmp $

%include "print.asm"
%include "DiskRead.asm"


times 510-($-$$) db 0 ; fill from current position to 510 bytes with 0

dw 0xaa55 ; signature, write 55 at the 511th byte and AA at the 512th byte



; when our program is loaded into memory by the BIOS it stores the disk number in the dl register, which we store for later use