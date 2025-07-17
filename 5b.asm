main:
            li a0, 2
            jal fibonacci_3
            li t0, 2
            bne a0, t0, noFunciona
            li a0, 4
            jal fibonacci_3
            li t0, 6
            bne a0, t0, noFunciona
funciona:
            li a1, 1
            j fin
noFunciona:
            li a1, 0
fin:
            j fin


fibonacci_3:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw a0, 8(sp)

    beq a0, zero, return_0
    li t0, 1
    beq a0, t0, return_1
    li t0, 2
    beq a0, t0, return_2

    addi a0, a0, -1 # fib (n-1)
    jal ra, fibonacci_3
    sw a0, 4(sp)

    lw a0, 8(sp) # fib(n-2)
    addi a0, a0, -2
    jal ra, fibonacci_3
    sw a0, 0(sp)

    lw a0, 8(sp) # fib(n-3)
    addi a0, a0, -3
    jal ra, fibonacci_3

    lw t0, 4(sp)
    lw t1, 0(sp)
    add a0, a0, t0
    add a0, a0, t1
    j terminar

return_0:
    li a0, 0
    j terminar
return_1:
    li a0, 1
    j terminar
return_2:
    li a0, 2
    j terminar

terminar:
    lw ra, 12(sp)
    addi sp, sp, 16
    ret


# Testeado en Ripes: Si