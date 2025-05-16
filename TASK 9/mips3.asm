.data
prompt1:     .asciiz "Enter the first floating-point number: "
prompt2:     .asciiz "Enter the second floating-point number: "
result_text: .asciiz "The result of division is: "
error_text:  .asciiz "Error: Division by zero is not allowed."
newline:     .asciiz "\n"
zero_float:  .float 0.0

.text
.globl main
main:
    # Prompt for first number
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read first float
    li $v0, 6
    syscall
    mov.s $f2, $f0     # Store first input in $f2

    # Prompt for second number
    li $v0, 4
    la $a0, prompt2
    syscall

    # Read second float
    li $v0, 6
    syscall
    mov.s $f4, $f0     # Store second input in $f4

    # Load 0.0 into $f6 for comparison
    l.s $f6, zero_float

    # Compare: if $f4 == 0.0, branch
    c.eq.s $f4, $f6
    bc1t division_by_zero

    # Perform division: $f2 / $f4
    div.s $f8, $f2, $f4

    # Print result message
    li $v0, 4
    la $a0, result_text
    syscall

    # Print result value
    mov.s $f12, $f8
    li $v0, 2
    syscall

    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall

division_by_zero:
    # Print error message
    li $v0, 4
    la $a0, error_text
    syscall

    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
