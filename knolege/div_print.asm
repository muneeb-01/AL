BITS 16
ORG 100h           ; Set the starting address for the program

MOV DX, 0
MOV AX, 4          ; Dividend
MOV BX, 2          ; Divisor

DIV BX             ; AX / BX -> Quotient in AL, remainder in AH

ADD AL, '0'        ; Convert quotient to ASCII

MOV DL, AL         ; Store ASCII result in DL
MOV AH, 02H        ; DOS function to print character
INT 21h            ; Print character

MOV AX, 4C00H      ; DOS terminate program function
INT 21H
