ORG 100h        ; .COM program starts at offset 100h

START:
    MOV CX, 50          ; Set loop counter from 50 down to 1

PRINT_LOOP:
    MOV AX, CX          ; Copy number to AX
    CALL PRINT_NUM      ; Print the number
    MOV DL, 13          ; Carriage return
    MOV AH, 02h
    INT 21h 
    MOV DL, 10          ; Line feed
    INT 21h

LOOP PRINT_LOOP     ; Decrease CX and loop if not zero

    ; Exit program
    MOV AH, 4Ch
    INT 21h

PRINT_NUM:
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV BX, 10          ; Divisor for decimal

    XOR CX, CX          ; CX will count digits

.REPEAT_DIV:
    XOR DX, DX
    DIV BX              ; AX / 10 -> quotient in AX, remainder in DL
    PUSH DX             ; Save remainder (digit)
    INC CX              ; Count digits
    CMP AX, 0
    JNZ .REPEAT_DIV     ; Repeat if quotient not zero

.PRINT_DIGITS:
    POP DX              ; Get digit
    ADD DL, '0'         ; Convert to ASCII
    MOV AH, 02h
    INT 21h
    LOOP .PRINT_DIGITS

    POP DX
    POP CX
    POP BX
    POP AX
    RET
