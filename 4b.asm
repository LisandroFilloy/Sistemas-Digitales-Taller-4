.data
arreglo1: .byte 1, 2, 3, 4, 5
arreglo2: .byte 3, 3, 3

.text
main: 
            li a0, 8 # Arrancan tests para esPotenciaDeDos
            jal esPotenciaDeDos
            beq a0, zero, noFunciona
            li a0, 7
            jal esPotenciaDeDos
            bne a0, zero, noFunciona
            la a0, arreglo1 # Arrancan tests para potenciasEnArreglo
            li a1, 2
            jal potenciasEnArreglo
            li t0, 2
            bne a0, t0, noFunciona
            la a0, arreglo2
            jal potenciasEnArreglo
            beq a0, zero, noFunciona
funciona:
            li a0, 1
            j fin
noFunciona:
            li a0, 0
fin:
            j fin


esPotenciaDeDos:
            addi t0, a0, -1     # asigno a0 - 1 a t0
            and t1, t0, a0      # si a0 es potencia de 2, a0 and a1 deberian ser 0. Es un si y solo si.
            bne t1, zero, falso
verdadero:
            li a0, 1
            j terminar
falso:
            li a0, 0
            j terminar
terminar:
            ret


potenciasEnArreglo:
            addi sp, sp, -12            # Reservamos 2 lugares en el stack
            sw ra, 8(sp)
            sw a1, 4(sp)
            sw a0, 0(sp)
            li s1, 0                    # Contador
revisarPosicion:
            mv t0, a0
            addi a0, a0, 1
            sw a0, 0(sp)
            addi a1, a1, -1
            sw a1, 4(sp)
            jal esPotenciaDeDos
            add s1, s1, a0              # a0 = 1 si es potencia de dos, 0 si no.
            lw a1, 4(sp)
            beq a1, zero, finalizar
            lw a0, 0(sp)
            j revisarPosicion
finalizar: 
            mv a0, s1
            lw ra 8(sp)
            addi sp, sp, 12
            ret


# Testeado en Ripes: Si