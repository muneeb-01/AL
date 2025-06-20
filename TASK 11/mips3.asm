.data
prompt_int:    .asciiz "Enter an integer: "
prompt_float:  .asciiz "Enter a floating-point number: "
msg_equal:     .asciiz "The values are equal.\n"
msg_not_equal: .asciiz "The values are NOT equal.\n"

.text
.globl main
main:
    # --- Input Integer ---
    li $v0, 4
    la $a0, prompt_int
    syscall

    li $v0, 5              # read integer
    syscall
    move $t0, $v0          # store integer in $t0

    # --- Input Float ---
    li $v0, 4
    la $a0, prompt_float
    syscall

    li $v0, 6              # read float
    syscall
    mov.s $f2, $f0         # store float input in $f2

    # --- Convert Integer to Float ---
    mtc1 $t0, $f4          # move int to float register (bitwise)
    cvt.s.w $f4, $f4       # convert int to single-precision float

    # --- Compare Float and Converted Integer ---
    c.eq.s $f2, $f4        # compare $f2 (user float) == $f4 (converted int)
    bc1t values_equal      # if equal, branch

    # --- Not Equal ---
    li $v0, 4
    la $a0, msg_not_equal
    syscall
    j end_program

values_equal:
    li $v0, 4
    la $a0, msg_equal
    syscall

end_program:
    li $v0, 10
    syscall
