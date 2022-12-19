.model small
.stack 64
.data
.code
start:mov ax, @data
      mov ds,ax
      mov si,3000h
      mov al,[si]
      inc si
      sub al,[si]
      mov cl,al
      add cl,01h
      add al,01h
      mov bl,al
      mov al,01h

l1:mul bl
   add bl,01
   LOOP l1

mov si,3100h
mov [si],ax

mov ah,4ch
int 21h
end start
.end
