.data
prompt_float1: .asciiz "Enter the first floating-point number: "
prompt_float2: .asciiz "Enter the second floating-point number: "
prompt_float3: .asciiz "Enter the third floating-point number: "
result_add:    .asciiz "The result of addition is: "
newline:       .asciiz "\n"

.text
.globl main
main:
    # Prompt and read first float
    li $v0, 4
    la $a0, prompt_float1
    syscall

    li $v0, 6
    syscall
    mov.s $f2, $f0     # Save first float in $f2

    # Prompt and read second float
    li $v0, 4
    la $a0, prompt_float2
    syscall

    li $v0, 6
    syscall
    mov.s $f4, $f0     # Save second float in $f4

    # Prompt and read third float
    li $v0, 4
    la $a0, prompt_float3
    syscall

    li $v0, 6
    syscall
    mov.s $f6, $f0     # Save third float in $f6

    # Add three floats: $f2 + $f4 + $f6
    add.s $f8, $f2, $f4
    add.s $f8, $f8, $f6    # f8 now holds the total

    # Print result label
    li $v0, 4
    la $a0, result_add
    syscall

    # Print the result
    mov.s $f12, $f8
    li $v0, 2
    syscall

    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit
    li $v0, 10
    syscall
