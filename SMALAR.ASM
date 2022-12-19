.MODEL SMALL
.STACK 64
.DATA
.CODE
START:  MOV AX, @DATA
        MOV DS, AX
        MOV SI, 2000H
        MOV DI, 3001H
        MOV BL, DI
        DEC DI
        MOV CL, [SI]
        MOV CH, 00H
        INC SI
        MOV AL, [SI]
        MOV BL, [SI]
        DEC CL
        INC SI
L1:     CMP [SI], AL 
        JNC L2
        MOV AL, [SI]
L2:     CMP BL, [SI]
        JC L3
        JMP L4
L3:     MOV BL, [SI] 
        JMP L4
L4:     INC SI
        LOOP L1
        MOV [DI], AL
        INC DI
        MOV [DI], BL
        MOV AH,4CH
        INT 21H
        END START
        .END

