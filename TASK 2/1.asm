bits 16
org 100h

section .data
    num1 db 10      ; num1 = 10
    num2 db 5       ; num2 = 5
    result_add db 0 ; Storage for result of addition
    result_sub db 0 ; Storage for result of subtraction

section .text
    main:
        ; Addition of num1 and num2
        mov al, [num1]      ; Load num1 into AL register
        add al, [num2]      ; Add num2 to AL
        mov [result_add], al ; Store the result of addition in result_add

        ; Subtraction of num1 and num2
        mov al, [num1]      ; Load num1 into AL register again
        sub al, [num2]      ; Subtract num2 from AL
        mov [result_sub], al ; Store the result of subtraction in result_sub

        ; Terminate the program
        mov ah, 4Ch         ; DOS function: terminate program
        int 21h             ; Call DOS interrupt
