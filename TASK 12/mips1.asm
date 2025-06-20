.data
newline: .asciiz "\n"

.text
.globl main
main:
    li $t0, 5        # num = 10

loop:
    bgtz $t0, body    # while num > 0
    j end_program
    
body:
    move $a0, $t0     # print num
    li $v0, 1
    syscall

    li $v0, 4         # print newline
    la $a0, newline
    syscall

    sub $t0, $t0, 2   # num = num - 2
    j loop

end_program:
    li $v0, 10
    syscall
