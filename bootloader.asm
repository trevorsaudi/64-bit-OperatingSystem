mov ah, 0x0a
mov al,

jmp $

times 510-($-$$) db 0 ; fill from current position to 510 bytes with 0

dw 0xaa55 ; signature, write 55 at the 511th byte and AA at the 512th byte
