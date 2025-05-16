.data
	promt1: .asciiz "Enter First Number : "
	promt2: .asciiz "Enter Second Number : "
	Result_div: .asciiz "Division of the numbers is : "
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
		la $a0, Result_div
		syscall

		div $t2, $t0, $t1
		li $v0, 1		
		move $a0, $t2
		syscall
		