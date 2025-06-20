.data
prompt1:       .asciiz "Enter the first floating-point number: "
prompt2:       .asciiz "Enter the second floating-point number (divisor): "
result_msg:    .asciiz "Result of division is: "
error_msg:     .asciiz "Math Error. dividing by zero.\n"
newline:       .asciiz "\n"
zero_float:    .float 0.0     # store 0.0 in memory

.text
.globl main
main:
    # Prompt and read first float
    li $v0, 4
    la $a0, prompt1
    syscall
	
	li $v0, 6
	syscall
	mov.s $f2, $f0   
  
    # Prompt and read second float
    li $v0, 4
    la $a0, prompt2
    syscall

	li $v0, 6
	syscall

  	l.s $f6, zero_float   
   	c.eq.s $f6, $f2
   	
   	 bc1t handle_error

      div.s $f12, $f0, $f2

    # Print result message
    li $v0, 4
    la $a0, result_msg
    syscall
	
	li $v0, 2
	syscall
  
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

 handle_error: 
 li $v0, 4
 la $a0, error_msg
 syscall
 
 exit:
 li $v0, 10
 syscall