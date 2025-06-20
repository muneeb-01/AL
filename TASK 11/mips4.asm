.data
prompt_int:       .asciiz "Enter an integer: "
prompt_float:     .asciiz "Enter a floating-point number: "
msg_equal:        .asciiz "The values are equal.\n"
msg_int_greater:  .asciiz "The integer is greater.\n"
msg_float_greater:.asciiz "The floating-point number is greater.\n"

.text
.globl main
main:
    # --- Input Integer ---
    li $v0, 4
    la $a0, prompt_int
    syscall

    li $v0, 5              # syscall to read integer
    syscall
    move $t0, $v0          # store integer in $t0

    # --- Input Float ---
    li $v0, 4
    la $a0, prompt_float
    syscall

    li $v0, 6              # syscall to read float
    syscall
    mov.s $f2, $f0         # store user float in $f2

    # --- Convert Integer to Float ---
    mtc1 $t0, $f4          # move int to float register (raw bits)
    cvt.s.w $f4, $f4       # convert int to single-precision float

    # --- Compare for Equality ---
    c.eq.s $f2, $f4        # compare float == converted int
    bc1t is_equal          # branch if equal

    # --- Compare Integer > Float ---
    c.lt.s $f2, $f4        # if float < int ? int is greater
    bc1t int_greater

    # --- If not equal and int is not greater, float must be greater ---
    li $v0, 4
    la $a0, msg_float_greater
    syscall
    j end_program

is_equal:
    li $v0, 4
    la $a0, msg_equal
    syscall
    j end_program

int_greater:
    li $v0, 4
    la $a0, msg_int_greater
    syscall

end_program:
    li $v0, 10
    syscall
