bits 16
org 100h

section .data
    num1 db 10      ; num1 = 10
    num2 db 5       ; num2 = 5
    num3 db 3       ; num3 = 3
    num4 db 2       ; num4 = 2 (the number to subtract)

section .text
    main:
        ; Add num1, num2, and num3
        mov al, [num1]      ; Load num1 (10) into AL register
        add al, [num2]      ; Add num2 (5) to AL. AL = 10 + 5 = 15
        add al, [num3]      ; Add num3 (3) to AL. AL = 15 + 3 = 18

        ; Subtract num4 from the sum
        sub al, [num4]      ; Subtract num4 (2) from AL. AL = 18 - 2 = 16

        ; Store the result in BX register
        mov bx, ax          ; Store the result from AL (16) into BX

        ; Terminate the program
        mov ah, 4Ch         ; DOS function: terminate program
        int 21h             ; Call DOS interrupt
