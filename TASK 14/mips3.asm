.data
prompt:         .asciiz "Enter a number (0 to finish): "
invalid_msg:    .asciiz "Invalid input! Please enter a non-negative number.\n"
output_msg:     .asciiz "Total Sum: "
avg_msg:        .asciiz ", Average: "
newline:        .asciiz "\n"

.text
.globl main
main:
    li $t0, 0          # sum = 0
    li $t1, 0          # count = 0

loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5          # read integer input
    syscall
    move $t3, $v0      # $t3 = input number

    # Check for negative input
    bltz $t3, invalid_input

    # If input is zero, finish
    beq $t3, $zero, end_loop

    # Valid input: add to sum and count
    add $t0, $t0, $t3   # sum += input
    addi $t1, $t1, 1    # count += 1
    j loop

# Handle invalid input
invalid_input:
    li $v0, 4
    la $a0, invalid_msg
    syscall
    j loop

# End of input
end_loop:
    beqz $t1, no_input  # prevent division by zero

    div $t0, $t1        # average = sum / count
    mflo $t2

    # Print "Total Sum: "
    li $v0, 4
    la $a0, output_msg
    syscall

    # Print sum
    li $v0, 1
    move $a0, $t0
    syscall

    # Print ", Average: "
    li $v0, 4
    la $a0, avg_msg
    syscall

    # Print average
    li $v0, 1
    move $a0, $t2
    syscall

    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall

# Handle no valid input case
no_input:
    li $v0, 4
    la $a0, newline
    syscall
    li $v0, 10
    syscall
