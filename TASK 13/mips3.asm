.data
prompt:      .asciiz "Enter a number: "
result:      .asciiz "Factorial: "
error_msg:   .asciiz "Error: Factorial of a negative number is undefined.\n"

.text
.globl main
main:
    # Prompt the user
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t0, $v0        # $t0 = input number

    # Check for negative input
    bltz $t0, handle_negative

    # Check if input is zero
    beqz $t0, handle_zero

    # Initialize result = 1 in $t1
    li $t1, 1

# --- Loop to calculate factorial ---
factorial:
    ble $t0, $zero, end_factorial  # if num <= 0, end loop
    mul $t1, $t1, $t0              # t1 = t1 * t0
    sub $t0, $t0, 1                # t0 = t0 - 1
    j factorial

# --- End and print result ---
end_factorial:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall

# --- Handle input = 0 (0! = 1) ---
handle_zero:
    li $t1, 1
    j end_factorial

# --- Handle negative input ---
handle_negative:
    li $v0, 4
    la $a0, error_msg
    syscall

    li $v0, 10
    syscall
