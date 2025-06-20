.data
array: .space 40
newline: .asciiz "\n"

.text 	
main:

li $v0, 5
syscall
move $t5, $v0


li $t0, 0
la $t1, array
li $t2, 10
move $t3, $t5

init_loop:
	sw $t3, 0($t1)
	addi $t0, $t0, 1
	addi $t1, $t1, 4
	add $t3, $t3, $t5
	blt $t0, $t2 , init_loop
	
li $t0, 0
la $t1, array
li $t2, 10

print_loop:
	li $v0, 1
	lw $a0, 0($t1)
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	addi $t1, $t1 , 4
	addi $t0, $t0 , 1
	blt  $t0, $t2 , print_loop
	   
    li $v0, 10       
    syscall          

	
