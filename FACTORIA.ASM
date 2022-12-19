.model small
.stack 64
.data
.code
start:mov ax, @data
      mov ds, ax
      mov si, 3000h
      mov cx, [si]
      mov dx, 0000h
      mov ax, 0001h
l1:   mul cx
      loop l1
      mov si, 3100h
      mov [si], ax
      inc si
      mov [si], dx
mov ah, 4ch
int 21h
end start
.end

