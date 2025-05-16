.data
array: .word 10, 20, 30, 40, 50, 60, 70, 80, 90, 100   # 10-element array
msg: .asciiz "Value at index 5 is: "
newline: .asciiz "\n"

.text
.globl main
main:
    li $v0, 4              # syscall 4 = print string
    la $a0, msg
    syscall

    la $t0, array          # Load base address of array
    li $t1, 5              # Index = 5
    li $t2, 4              # Word size = 4 bytes
    mul $t1, $t1, $t2      # Offset = index * 4

    add $t3, $t0, $t1      # Address of array[5]
    lw $a0, 0($t3)         # Load value at array[5]
    
    li $v0, 1              # syscall 1 = print integer
    syscall

    li $v0, 4              # Print newline
    la $a0, newline
    syscall

    li $v0, 10             # Exit
    syscall
