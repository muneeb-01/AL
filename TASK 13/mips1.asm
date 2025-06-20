.data
prompt: .asciiz "Enter a number: "
result: .asciiz "Factorial: "

.text
main:
li $v0, 4
la $a0, prompt
syscall

li $v0, 5
syscall
move $t0, $v0

li $t1, 1
factorial:
ble $t0, $zero, end_factorial
mul $t1, $t1, $t0
sub $t0, $t0, 1
j factorial

end_factorial:
li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall
