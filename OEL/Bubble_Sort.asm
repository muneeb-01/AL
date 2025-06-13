.data
array:      .word 9, 5, 1, 3, 8, 2, 7, 4, 6     # Array to sort
array_size: .word 9
newline:    .asciiz " "

.text
.globl main

main:
    la $t0, array           # $t0 = base address of array
    lw $t1, array_size      # $t1 = array size

    addi $t2, $zero, 0      # i = 0 (outer loop counter)

outer_loop:
    beq $t2, $t1, done      # if i == array_size, done
    
    li $t9, 0               # swapped = 0

    addi $t3, $zero, 0      # j = 0
    sub $t4, $t1, $t2       # limit = array_size - i
    addi $t4, $t4, -1       # inner loop limit = array_size - i - 1

inner_loop:
    bge $t3, $t4, check_swapped   # j >= limit -> exit inner loop

    # array[j] = $t5, array[j+1] = $t6
    sll $t7, $t3, 2         # offset = j * 4
    add $t8, $t0, $t7       # $t8 = &array[j]
    lw $t5, 0($t8)          # $t5 = array[j]
    lw $t6, 4($t8)          # $t6 = array[j+1]

    ble $t5, $t6, skip_swap

    # swap array[j] and array[j+1]
    sw $t6, 0($t8)
    sw $t5, 4($t8)
    li $t9, 1               # swapped = true

skip_swap:
    addi $t3, $t3, 1
    j inner_loop

check_swapped:
    beqz $t9, done          # if swapped == 0, array is sorted
    addi $t2, $t2, 1        # i++
    j outer_loop

done:
    # Print sorted array
    li $t2, 0               # i = 0

print_loop:
    beq $t2, $t1, exit
    sll $t7, $t2, 2
    add $t8, $t0, $t7
    lw $a0, 0($t8)

    li $v0, 1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    addi $t2, $t2, 1
    j print_loop

exit:
    li $v0, 10
    syscall
