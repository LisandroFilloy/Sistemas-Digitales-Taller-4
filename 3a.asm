#
main:
            li a0, 4 # a0 <- 4
            li a1, 87 # a1 <- 87
            li a2, -124 # a2 <- -124
            li a3, -14 # a3 <- -14
            jal ra, FUNCION # salta a FUNCION y guarda direccion de retorno
            li a2, -124 # as <- -124
            bne a0, a2, noFunciona # salto a noFunciona si ao != a2
funciona:
            li a1, 1 # a1 <- 1
            j fin # salto a fin
noFunciona:
            li a1, 0 # a1 <- 0
fin:
            j fin

# Funcionalidad: testea f(4,87,-124,-14) = -12

#
FUNCION: 
            addi sp, sp, -12 # sp <- sp - 12
            sw a2, (0)sp # Carga en la direccion de memoria sp, el valor de a2.
            sw a3, (4)sp # Carga en la direccion de memoria sp + 4 el valor de a3.
            sw ra, (8)sp # Carga en ra la direccion de memoria sp + 8
            jal ra, FUNCION_AUX # Salto a FUNCIONAUX + carga en ra de pos. mem. prox. instruccion
            mv s1, a0 # s1 <- a0 
            lw a0, (0)sp # a0 <- valor de sp -> a2
            lw a1, (4)sp # a1 <- valor de sp+4 -> a3
            jal ra, FUNCION_AUX # Salto a FUNCIONAUX + carga en ra de pos. mem. prox. instruccion
            mv a1, s1 # a1 <- s1 -> a0
            jal ra, FUNCION_AUX #  Salto a FUNCIONAUX + carga en ra de pos. mem. prox. instruccion
            lw ra, (8)sp # ra <- valor de sp+8
            addi sp, sp, 12 # sp <- sp + 12, la direccion original.
            ret #

# Funcionalidad: asigna a a0 el menor entre a0, a1, a2, a3.
# Nombre: Minimo
# Prologo: 1-4
# epilogo: 12-15

FUNCION_AUX: 
            addi sp, sp, -4 # sp <- sp - 4
            sw ra, (0)sp # carga en la posicion de memoria sp el valor de ra
            bgt a1, a0, terminar # salta a terminar si a1 > a0
            mv a0, a1 # a0 <- a1
terminar: 
            ret

# Funcionalidad: asigna a a0 el menor entre a0 y a1.
# Prologo: 1-2
# epilogo: No tiene.


Errores: 
1. El programador A no preserva el valor de s1. No tiene impacto porque no es utilizado despues pero es un error de contrato.
3. El programador B no escribe el eplilogo. SP queda en una posicion incorrecta.


# Correccion

# Arreglo: remover el epilogo y prologo de FUNCION_AUX - no son necesarios. / Reemplazar s1 por t0 en FUNCION.

main:
            li a0, 4 # a0 <- 4
            li a1, 87 # a1 <- 87
            li a2, -124 # a2 <- -124
            li a3, -14 # a3 <- -14
            jal ra, FUNCION # salta a FUNCION y guarda direccion de retorno
            li a2, -124 # as <- -124
            bne a0, a2, noFunciona # salto a noFunciona si ao != a2
funciona:
            li a1, 1 # a1 <- 1
            j fin # salto a fin
noFunciona:
            li a1, 0 # a1 <- 0
fin:
            j fin

FUNCION: 
            addi sp, sp, -12 # sp <- sp - 12
            sw a2, (0)sp # Carga en la direccion de memoria sp, el valor de a2.
            sw a3, (4)sp # Carga en la direccion de memoria sp + 4 el valor de a3.
            sw ra, (8)sp # Carga en ra la direccion de memoria sp + 8
            jal ra, FUNCION_AUX # Salto a FUNCIONAUX + carga en ra de pos. mem. prox. instruccion
            mv t0, a0 # s1 <- a0 
            lw a0, (0)sp # a0 <- valor de sp -> a2
            lw a1, (4)sp # a1 <- valor de sp+4 -> a3
            jal ra, FUNCION_AUX # Salto a FUNCIONAUX + carga en ra de pos. mem. prox. instruccion
            mv a1, t0 # a1 <- s1 -> a0
            jal ra, FUNCION_AUX #  Salto a FUNCIONAUX + carga en ra de pos. mem. prox. instruccion
            lw ra, (8)sp # ra <- valor de sp+8
            addi sp, sp, 12 # sp <- sp + 12, la direccion original.
            ret

FUNCION_AUX: 
            bgt a1, a0, terminar # salta a terminar si a1 > a0
            mv a0, a1 # a0 <- a1
terminar: 
            ret


# Testeado en Ripes: Si