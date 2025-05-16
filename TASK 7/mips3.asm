.data 
array : .space 40              # Reserve space for 10 integers (10 * 4 bytes)
newline : .asciiz "\n"         # Corrected spelling of "newlinw"
prompt1 : .asciiz "Enter number here: "

.text
.globl main
main:
    la $t0, array              # $t0 = base address of array

    # Prompt for input
    li $v0, 4
    la $a0, prompt1
    syscall

    # Read integer
    li $v0, 5
    syscall
    move $t1, $v0              # Corrected: get user input from $v0, not $a0

    # Store input at index 3
    li $t2, 4
    li $t3, 3
    mul $t3, $t3, $t2          # Offset = 3 * 4 = 12

    add $t4, $t0, $t3          # $t4 = address of array[3]
    sw $t1, 0($t4)             # Store user input at array[3]

    # Print all 10 array elements
    la $t0, array              # Reset $t0 to start of array
    li $t2, 0                  # Loop counter
    li $t3, 10                 # Loop limit

print_loop:
    lw $a0, 0($t0)             # Load array[i]
    li $v0, 1
    syscall                    # Print integer

    li $v0, 4
    la $a0, newline
    syscall                    # Print newline

    addi $t2, $t2, 1
    addi $t0, $t0, 4           # Move to next element
    blt $t2, $t3, print_loop   # Loop if i < 10

    li $v0, 10
    syscall                    # Exit
