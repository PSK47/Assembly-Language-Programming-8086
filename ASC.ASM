.model small
.stack 64 
.data
LIST DW 0053H, 0025H, 0019H, 0002H
COUNT EQU 04H
.code
START:  mov ax, @data
        mov DS, AX
        mov DX, COUNT-1
AGAIN0: MOV CX, DX
        LEA SI, LIST
AGAIN1: MOV AX, [SI]
        CMP AX, [SI+2]
        JL PR1
        XCHG [SI+2], AX
        XCHG [SI], AX
PR1:    ADD SI, 02H
        LOOP AGAIN1
        DEC DX
        JNZ AGAIN0
mov ah,4ch
int 21h
END START
.END