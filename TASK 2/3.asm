bits 16
org 100h

section .data
    num1 db -10      ; num1 = 10
    num2 db 5       ; num2 = 5
    error_msg db 'Error: Negative number detected!', 0ah, 0dh, '$'  ; Error message

section .text
    main:
        ; Check if num1 is negative
        mov al, [num1]          ; Load num1 into AL register
        test al, al             ; Test if AL (num1) is negative (if MSB is set)
        js  error_handler       ; Jump to error handler if num1 is negative

        ; Check if num2 is negative
        mov al, [num2]          ; Load num2 into AL register
        test al, al             ; Test if AL (num2) is negative (if MSB is set)
        js  error_handler       ; Jump to error handler if num2 is negative

        ; Perform addition of num1 and num2
        mov al, [num1]          ; Load num1 into AL register
        add al, [num2]          ; Add num2 to AL. AL = num1 + num2

        ; Store the result in BX register
        mov bx, ax              ; Store the result in BX

        ; Terminate the program
        mov ah, 4Ch             ; DOS function: terminate program
        int 21h                 ; Call DOS interrupt

    error_handler:
        ; Print error message
        mov dx, error_msg       ; Load address of error message into DX
        mov ah, 09h             ; DOS function: print string
        int 21h                 ; Call DOS interrupt
        
        ; Terminate the program after error message
        mov ah, 4Ch             ; DOS function: terminate program
        int 21h                 ; Call DOS interrupt
