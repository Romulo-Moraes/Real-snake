    org 0x7C00

    %define GAME_SEGMENT 0x100

    BITS 16

    ; set video mode
    mov ah, 0x0
    mov al, 0x3
    int 0x10

    mov bx, GAME_SEGMENT
	mov es, bx
	mov bx, 0
	
    ; load the game from pendrive
	mov ah, 0x02
	mov al, 1
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 0x80
	int 0x13

    ; make the processor execute the game
    jmp GAME_SEGMENT:0x0

times 510 - ($ - $$) db 0x0
dw 0xAA55