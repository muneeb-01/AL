.data
prompt_int1: .asciiz "Enter the first integer: "
prompt_int2: .asciiz "Enter the second integer: "
prompt_float1: .asciiz "Enter the first floating-point number: "
prompt_float2: .asciiz "Enter the second floating-point number: "
int_equal: .asciiz "The integers are equal.\n"
int_not_equal: .asciiz "The integers are not equal.\n"
float_equal: .asciiz "The floating-point numbers are equal.\n"
float_not_equal: .asciiz "The floating-point numbers are not equal.\n"

.text
main:
   
    li $v0, 4               
    la $a0, prompt_int1     
    syscall                 
    li $v0, 5                
    syscall                

    li $v0, 4                
    la $a0, prompt_int2      
    syscall                  
    li $v0, 5              
    syscall                  
    beq $t0, $t1, integers_equal
    li $v0, 4
    la $a0, int_not_equal
    syscall
    j compare_floats

integers_equal:
    li $v0, 4
    la $a0, int_equal
    syscall

compare_floats:

    li $v0, 4             
    la $a0, prompt_float1   
    syscall                  
    li $v0, 6
    syscall                 
    li $v0, 4               
    la $a0, prompt_float2   
    syscall                  
li $v0, 6                
    syscall                  
    c.eq.s $f0, $f2          
    bc1t floats_equal        
    li $v0, 4
    la $a0, float_not_equal
    syscall
    j end
floats_equal:
    li $v0, 4
    la $a0, float_equal
    syscall
end:
    li $v0, 10               
    syscall                  

