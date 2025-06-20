.data
prompt: .asciiz "Enter a number (0 to finish): "
result: .asciiz "Average: "

.text
main:
li $t0, 0
li $t1, 0
li $t2, 0

loop:
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t3, $v0

beq $t3, $zero, end_loop

add $t0, $t0, $t3
add $t1, $t1, 1

j loop

end_loop:
div $t2, $t0, $t1

li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall
