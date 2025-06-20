.data
prompt_float1: .asciiz "Enter the first floating-point number: "
prompt_float2: .asciiz "Enter the second floating-point number: "
result_add:    .asciiz "The result of addition is: "
result_mult:   .asciiz "The result of multiplication is: "
newline:       .asciiz "\n"

.text
.globl main
main:
    # Prompt for first float
    li $v0, 4                  # syscall code for print_string
    la $a0, prompt_float1      # load address of prompt1 into $a0
    syscall                    # print prompt

	li $v0, 6
	syscall
	mov.s $f2, $f0
	
    # Prompt for second float
    li $v0, 4
    la $a0, prompt_float2
    syscall
	
	li $v0, 6
	syscall

    li $v0, 4
    la $a0, result_add         # print "The result of addition is: "
    syscall
	
	add.s $f12, $f0, $f2
	
	li $v0, 2
	syscall 
	
    li $v0, 4
    la $a0, newline            # print newline
    syscall

    li $v0, 4
    la $a0, result_mult
    syscall
	
	mul.s $f12, $f0, $f2
	
	li $v0, 2
	syscall 
	

    li $v0, 4
    la $a0, newline
    syscall

    # Exit
    li $v0, 10                 # syscall code for exit
    syscall
