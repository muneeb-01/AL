.data
prompt1:       .asciiz "Enter the first double-precision number: "
prompt2:       .asciiz "Enter the second double-precision number: "
result_sum:    .asciiz "The sum is: "
result_prod:   .asciiz "The product is: "
newline:       .asciiz "\n"

.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall
	li $v0, 7
	syscall
	mov.d $f2, $f0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	li $v0, 7
	syscall
	
	add.d $f12, $f0, $f2
	
	li $v0, 3
	syscall		
	
	mul.d $f12, $f0, $f2		
   	
   	li $v0, 3
	syscall		
	
   	li $v0, 4
    	la $a0, newline
    	syscall

    	# Exit
    	li $v0, 10
    	syscall
