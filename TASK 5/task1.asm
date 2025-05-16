ORG 100H

MOV AL, 10   
MOV BL, 5    

SUB AL, BL   

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
