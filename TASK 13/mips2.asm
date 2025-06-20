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

    # Check if negative
    bltz $t0, handle_negative

    # Initialize factorial result to 1
    li $t1, 1

factorial:
    ble $t0, $zero, end_factorial  # if t0 <= 0, end loop
    mul $t1, $t1, $t0              # t1 *= t0
    sub $t0, $t0, 1                # t0 -= 1
    j factorial

end_factorial:
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall

# --- Handle negative input ---
handle_negative:
    li $v0, 4
    la $a0, error_msg
    syscall

    li $v0, 10
    syscall
