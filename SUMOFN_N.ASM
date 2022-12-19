.model small
.stack 64
.data
.code
start:mov ax, @data
      mov ds,ax
      mov si,3000h
      mov cl,[si]
      inc si
      dec cl
      mov al,[si]
      inc si

rept:mov bl,[si]
     add al,bl
     inc si
     dec cl
     jnz rept

mov si,4000h
mov [si],al
mov ah,4ch
int 21h
end start
.end
      
     
