.model small
.stack 100h
.data
   NUM1 DW ?
   NUM2 DW ?
   CARRY DB 00h
   BORROW DB 00h
.code
start: mov ax,@data
       mov ds,ax
       mov si,2000h
       mov ah,[si]
       inc si
       mov al,[si]
       mov NUM1,AX
       inc si
       mov bh,[si]
       inc si
       mov bl,[si]
       mov NUM2,BX
       inc si
       mov cl,[si]
       cmp cl,1
       je ADD8
       cmp cl,2
       je SUB8
       cmp cl,3
       je MUL8
       cmp cl,4
       je DIV8
       cmp cl,5
       je ADD16
       cmp cl,6
       je JSUB16
       cmp cl,7
       je JMUL16
       cmp cl,8
       je JDIV16

JSUB16: jmp SUB16
JMUL16: jmp MUL16
JDIV16: jmp DIV16
       
ADD8: mov ah,00h
      mov bh,00h
      mov al,num1
      mov bl,num2
      add al,bl
      jnc L3
      inc carry
L3:   mov si,2100h
      mov [si],al
      jmp exit

SUB8: mov ah,00h
      mov bh,00h
      mov al,NUM1
      sub ax,bx
      jnc l4
      inc borrow
L4:   mov si,2100h
      mov [si],al
      jmp exit

MUL8: mov ah,00h
      mov bh,00h
      mov al,num1
      mov bl,num2
      mul bl
      mov si,2100h
      mov [si],ah
      inc si
      mov [si],al
      jmp exit

DIV8: mov bh,00h
      mov ax,num1
      mov bl,num2
      div bl
      mov si,2100h
      mov [si],al
      inc si
      mov [si],ah
      jmp exit

ADD16: mov ax,num1
      mov bx,num2
      add ax,bx
      jnc l1
      inc carry
L1:   mov si,2100h
      mov [si],ah
      inc si
      mov [si],al
      jmp exit

SUB16: mov ax,NUM1
      sub ax,bx
      jnc l2
      inc borrow
L2:   mov si,2100h
      mov [si],ah
      inc si
      mov [si],al
      jmp exit

MUL16: mov ax,NUM1
      mov dx,000h
      mul bx
      mov si,2100h
      mov [si],ax
      mov [si]+2,dx
      jmp exit

DIV16: mov ax,NUM1
      mov si,3005
      mov dh,[si]
      inc si
      mov dl,[si]
      div bx
      mov si,2100h
      mov [si],ax
      inc si
      mov [si],dx
      jmp exit

exit: mov AH,4CH
      int 21h
      end
.end
