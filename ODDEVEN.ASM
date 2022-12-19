.model small
.stack 64
.data
.code
start:mov ax,@data
      mov ds,ax
      mov si,3000h
      mov bx,0000h
      mov cx,0000h
      mov cl,[si]
      inc si

rept:mov al,[si]
     ror al,01h
     jnc even
     inc bh
     jmp next

even:inc bl
     jmp next

next:inc si
     dec cl
     jnz rept

mov di,4000h
mov [di],bx
mov ah,4ch
int 21h
end start
.end
