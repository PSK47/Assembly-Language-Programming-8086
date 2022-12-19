.model small
.stack 64
.data
.code
start:mov ax,@data
      mov ds,ax
      mov si,500h
      mov ax,0000h
      mov cx,0000h
      mov cl,[si]
      mov bl,cl
      inc si

rept: add al,[si]
      adc ah,00
      inc si
      dec cl
      jnz rept
      div bl
      mov di,600h
      mov [di],ax
mov ah,4ch
int 21h
end start
.end
