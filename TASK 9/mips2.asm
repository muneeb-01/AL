.data
prompt1:      .asciiz "Enter the first double-precision number: "
prompt2:      .asciiz "Enter the second double-precision number: "
result_add:   .asciiz "The result of addition is: "
result_mult:  .asciiz "The result of multiplication is: "
newline:      .asciiz "\n"

.text
.globl main
main:
    # Prompt for first number
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read first double (64-bit float)
    li $v0, 7
    syscall
    mov.d $f2, $f0   # Store first number in $f2/$f3

    # Prompt for second number
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read second double
    li $v0, 7
    syscall
    mov.d $f4, $f0   # Store second number in $f4/$f5

    # Add the two double numbers
    add.d $f6, $f2, $f4

    # Print addition result message
    li $v0, 4
    la $a0, result_add
    syscall

    # Print result of addition
    mov.d $f12, $f6
    li $v0, 3           # 3 = print double
    syscall

    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    # Multiply the two double numbers
    mul.d $f8, $f2, $f4

    # Print multiplication result message
    li $v0, 4
    la $a0, result_mult
    syscall

    # Print result of multiplication
    mov.d $f12, $f8
    li $v0, 3           # 3 = print double
    syscall

    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
