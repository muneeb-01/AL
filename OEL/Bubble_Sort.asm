.data
array:       .word 8,9,1,2,3,4,5,6       # Array of integers to be sorted
array_size:  .word 8                       # Number of elements in the array
newline:     .asciiz " "                   # Space character used to separate printed numbers
empty_msg:   .asciiz "Array is empty\n"   # Message to print if array size is zero

.text
.globl main

main:
    la $t0, array           # Load base address of array into $t0
    lw $t1, array_size      # Load size of array into $t1
    beqz $t1, print_empty   # If size == 0, jump to print_empty label

    addi $t2, $zero, 0      # Initialize outer loop counter i = 0

outer_loop:
    addi $t9, $zero, 0      # Initialize swapped flag = 0 (no swaps yet)
    addi $t3, $zero, 0      # Initialize inner loop counter j = 0
    sub $t4, $t1, $t2       # Calculate remaining unsorted elements (size - i)
    addi $t4, $t4, -1       # Inner loop limit = size - i - 1

inner_loop:
    bge $t3, $t4, check_swapped  # If j >= size_of_an_array, exit inner loop

    mul $t7, $t3, 4         # $t7 = j * 4
    add $t8, $t0, $t7       # Calculate address of array[j]
    lw $t5, 0($t8)          # Load array[j] into $t5
    lw $t6, 4($t8)          # Load array[j+1] into $t6

    ble $t5, $t6, skip_swap # If array[j] <= array[j+1], no swap needed

    sw $t6, 0($t8)          # Swap: store array[j+1] at array[j]
    sw $t5, 4($t8)          # Swap: store array[j] at array[j+1]
    li $t9, 1               # Set swapped flag = 1 (swap happened)

skip_swap:
    addi $t3, $t3, 1        # Increment inner loop counter j++
    j inner_loop            # Repeat inner loop

check_swapped:
    beqz $t9, done          # If swapped == 0, array is sorted, exit outer loop
    addi $t2, $t2, 1        # Increment outer loop counter i++
    j outer_loop            # Repeat outer loop

done:
    li $t2, 0               # Initialize print loop counter i = 0

print_loop:
    beq $t2, $t1, exit      # If i == size, done printing

    mul $t7, $t2, 4         # Calculate byte offset i * 4
    add $t8, $t0, $t7       # Address of array[i]
    lw $a0, 0($t8)          # Load array[i] to $a0 for printing

    li $v0, 1               # Syscall code for print integer
    syscall                 # Print integer

    li $v0, 4               # Syscall code for print string
    la $a0, newline         # Load address of newline (space) character
    syscall                 # Print space after integer

    addi $t2, $t2, 1        # i++
    j print_loop            # Loop to print next element

print_empty:
    li $v0, 4               # Syscall code for print string
    la $a0, empty_msg       # Load address of empty message string
    syscall                 # Print empty message

exit:
    li $v0, 10              # Syscall code for program exit
    syscall                 # Exit program
