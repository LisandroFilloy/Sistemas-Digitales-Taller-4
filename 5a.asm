main:
            li a0, 0
            li t0, 1
            jal ra, factorial
            bne a0, t0, noFunciona
            li a0, 5
            li t0, 120
            jal ra, factorial
            bne a0, t0, noFunciona
funciona: 
            li a1, 1          
            j fin  
noFunciona: 
            li a1, 0
fin: 
            j fin


factorial:
            addi sp, sp, -8
            sw ra, 0(sp)
            sw a0, 4(sp)            
            beq a0, zero, caso_base
            addi a0, a0, -1
            jal ra, factorial
            lw a1, 4(sp)
            mul a0, a1, a0
            j terminar
caso_base:
            li a0, 1
terminar:
            lw ra, 0(sp)
            addi sp, sp, 8
            ret


# Testeado en Ripes: Si