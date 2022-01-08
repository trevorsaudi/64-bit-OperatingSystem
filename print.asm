PrintString:
    mov ah, 0x0e ; scrolling teletype bios routine
    .Loop:
        cmp [bx], byte 0; end of string
        je .Exit
        mov al, [bx] ; get next char
        int 0x10
        inc bx ; increment pointer
        jmp .Loop


    .Exit: 
        ret

    mov al , 'H'
    int 0x10
    ret

Teststring: db "Hello World test", 0 