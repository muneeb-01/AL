.data
prompt:        .asciiz "Enter a number (0 to finish): "
invalid:       .asciiz "Invalid input! Please enter a non-negative number.\n"
num_msg:       .asciiz "Numbers entered: "
count_msg:     .asciiz "Count of Numbers: "
avg_msg:       .asciiz ", Average: "
space:         .asciiz " "
newline:       .asciiz "\n"
inputs:        .space 400     # store up to 100 numbers (4 bytes each)

.text
.globl main
main:
    li $t0, 0         # sum
    li $t1, 0         # count
    la $s0, inputs    # array pointer

input_loop:
    # Prompt user
    li $v0, 4
    la $a0, prompt
    syscall

    # Read integer input
    li $v0, 5
    syscall
    move $t3, $v0

    bltz $t3, invalid_input   # if < 0 ? show error
    beqz $t3, done_input      # if == 0 ? end

    # Store input
    sw $t3, 0($s0)
    addi $s0, $s0, 4

    add $t0, $t0, $t3         # sum += input
    addi $t1, $t1, 1          # count++

    j input_loop

invalid_input:
    li $v0, 4
    la $a0, invalid
    syscall
    j input_loop

done_input:
    beqz $t1, exit_program    # skip output if nothing valid

    # Print "Numbers entered: "
    li $v0, 4
    la $a0, num_msg
    syscall

    la $s0, inputs            # reset pointer
    li $t4, 0                 # index = 0

print_numbers:
    beq $t4, $t1, after_numbers
    lw $a0, 0($s0)
    li $v0, 1
    syscall

    # Print space
    li $v0, 4
    la $a0, space
    syscall

    addi $s0, $s0, 4
    addi $t4, $t4, 1
    j print_numbers

after_numbers:
    # Newline
    li $v0, 4
    la $a0, newline
    syscall

    # Average = sum / count
    div $t0, $t1
    mflo $t2

    # Print "Count of Numbers: "
    li $v0, 4
    la $a0, count_msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    # Print ", Average: "
    li $v0, 4
    la $a0, avg_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    # Final newline
    li $v0, 4
    la $a0, newline
    syscall

exit_program:
    li $v0, 10
    syscall
