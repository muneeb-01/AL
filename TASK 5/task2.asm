ORG 100h

MOV AL, 0x0F      ; 00001111
MOV BL, 0x01      ; Adding 1 will cause carry from bit 3 to 4
ADD AL, BL        ; Result = 10h, AF should be set

TEST AL, AL   
JZ ZeroFlagSet 

ADC AL, 0   
JC CarryFlagSet

MOV AL, 0FH  
ADD AL, 01H 

MOV AX, 4C00H 
INT 21H

ZeroFlagSet:
JMP EndProgram

CarryFlagSet:
JMP EndProgram

EndProgram:
MOV AX, 0x4C00 
INT 0x21
