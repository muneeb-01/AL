bits 16
org 100h

section .data
    name        db 'Muneeb Mughal', 0ah, 0dh, '$'         ; Name followed by newline and carriage return
    roll_number db 'Roll No: 27855', 0ah, 0dh, '$'   ; Roll number followed by newline and carriage return
    department  db 'Department: Computer Science', 0ah, 0dh, '$' ; Department followed by newline and carriage return

section .text
    main:
        ; Print Name
        mov dx, name       ; Load address of 'name' string into dx
        mov ah, 09h        ; DOS function: print string
        int 21h            ; Call DOS interrupt

        ; Print Roll Number
        mov dx, roll_number ; Load address of 'roll_number' string into dx
        mov ah, 09h         ; DOS function: print string
        int 21h             ; Call DOS interrupt

        ; Print Department
        mov dx, department  ; Load address of 'department' string into dx
        mov ah, 09h         ; DOS function: print string
        int 21h             ; Call DOS interrupt

        ; Terminate Program
        mov ah, 4Ch         ; DOS function: terminate program
        int 21h             ; Call DOS interrupt
