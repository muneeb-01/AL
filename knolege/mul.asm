bits 16
org 100h           ; Set the starting address for the program

MOV AX, 3
MOV BX, 2

MUL BX

MOV AX, 4C00h
INT 20H
