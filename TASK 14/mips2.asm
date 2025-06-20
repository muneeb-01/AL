.data
prompt:       .asciiz "Enter a number (0 to finish): "
output_msg:   .asciiz "Total Sum: "
avg_msg:      .asciiz ", Average: "
newline:      .asciiz "\n"

.text
.globl main
main:
    li $t0, 0          # sum
    li $t1, 0          # count

loop:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5          # read int
    syscall
    move $t3, $v0      # input -> $t3

    beq $t3, $zero, end_loop

    add $t0, $t0, $t3  # sum += input
    addi $t1, $t1, 1   # count += 1
    j loop

end_loop:
    beqz $t1, no_input  # if count == 0, avoid division by 0

    # Compute average
    div $t0, $t1
    mflo $t2            # $t2 = average

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

no_input:
    # Exit silently if no values were entered
    li $v0, 10
    syscall
