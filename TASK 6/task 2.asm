.data
	promt1: .asciiz "Enter First Number : "
	promt2: .asciiz "Enter Second Number : "
	promt3: .asciiz "Enter Third Number : "
	Result: .asciiz "Division of the numbers is : "
	new_line: .asciiz "\n"

.text
	main:
		li $v0, 4
		la $a0, promt1
		syscall
		
		li $v0, 5
		syscall
		move $t0, $v0
		
		li $v0, 4
		la $a0, promt2
		syscall
		
		li $v0, 5
		syscall
		move $t1, $v0

		li $v0, 4
		la $a0, promt3
		syscall
		
		li $v0, 5
		syscall
		move $t2, $v0
		
		li $v0, 4
		la $a0, Result
		syscall

		mul $t3, $t1, $t0
		mul $t4, $t2, $t3
		li $v0, 1		
		move $a0, $t4
		syscall
		
