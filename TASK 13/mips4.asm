.data
prompt:        .asciiz "Enter a number: "
result_msg:    .asciiz "Factorial: "
steps_msg:     .asciiz ", Steps: "
error_msg:     .asciiz "Error: Factorial of a negative number is undefined.\n"
newline:       .asciiz "\n"

.text
.globl main
main:
    # Prompt user
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t0, $v0        # $t0 = input number

    # Check for negative input
    bltz $t0, handle_negative

    # Handle zero case (0! = 1, steps = 0)
    beqz $t0, handle_zero

    # Initialize
    li $t1, 1            # result = 1
    li $t2, 0            # step counter = 0

# --- Factorial Loop ---
factorial_loop:
    ble $t0, $zero, end_factorial
    mul $t1, $t1, $t0    # result *= t0
    addi $t2, $t2, 1     # step++
    sub $t0, $t0, 1
    j factorial_loop

# --- Print Result and Steps ---
end_factorial:
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t1        # print factorial
    syscall

    li $v0, 4
    la $a0, steps_msg
    syscall

    li $v0, 1
    move $a0, $t2        # print steps
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

# --- Handle input = 0 ---
handle_zero:
    li $t1, 1            # factorial = 1
    li $t2, 0            # steps = 0
    j end_factorial

# --- Handle negative input ---
handle_negative:
    li $v0, 4
    la $a0, error_msg
    syscall

    li $v0, 10
    syscall
