.MODEL SMALL
.CODE
START: MOV AH,1    
INT 21H                       
MOV DL,AL                
MOV AH,2                   
INT 21H
END START
END
