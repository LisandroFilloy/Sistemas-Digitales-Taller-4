#
main:
            li a0, 3 # a0 <- 3
            li a1, 10 # a1 <- 10
            li a2, -5 # a2 <- -5
            li a3, 2 # a3 <- 2
            li a4, 5 # a4 <- 5
            li a5, -1 # a5 <- -1
            jal ra, FUNCION # salta a FUNCION y guarda dirección de retorno en ra
            li a2, 1 # a2 <- 1
            bne a0, a2, noFunciona # si a0 != a2, salta a noFunciona
funciona:
            li a1, 1 # a1 <- 1
            j fin # salta a fin
noFunciona:
            li a1, 0 # a1 <- 0
fin:
            j fin # bucle infinito (fin del programa)

# funcionalidad: testear f(3, 10, -5, 2, 5, -1) = 1

FUNCION:
            addi sp, sp, -12 # reserva espacio en stack (3 palabras)
            sw a2, (0)sp # guarda a2 en stack
            sw s0, (4)sp # guarda s0 en stack
            sw ra, (8)sp # guarda ra en stack
            li s0, 1 # s0 <- 1
            mv a2, a4 # a2 <- a4
            jal ra, FUNCIO_AUX # salta a FUNCION AUX y guarda dirección de retorno en ra
            bne a0, s0, return # si a0 != s0 salta a return
            lw a0, (0)sp # a0 <- valor original de a2
            mv a1, a3 # a1 <- a3
            mv a2, a5 # a2 <- a5
            jal ra, FUNCION_AUX # salta a FUNCION AUX
            bne a0, s0, return # si a0 != s0, salta a return
            lw s0, (4)sp # recupera s0 desde stack
            lw ra, (8)sp # recupera ra
            addi sp, sp, 12 # libera el stack
return:
            ret # vuelve a quien llamó FUNCION

# Funcionalidad: verifica si a1 >= a4 >= a0 y a3 >= a5 >= a2
# Nombre sugerido: Validador de condiciones.
# Prólogo: líneas 1–4
# Epílogo: líneas 12–15

FUNCION_AUX:
            addi sp, sp, -4 # se guarda una palabra en el stack
            sw ra, (0)sp # se escribe en el stack el valor de ra
            sub a3, a2, a0 # a3 <- a2 - a0
            blt a3, zero, afuera # si a3 es menor cero que entonces se salta a afuera 
            sub a5, a2, a1 # a5 = a2-a1
            bgt a5, zero, afuera # si a5 es mayor a cero se salta a afuera
adentro: 
            li a0, 1 # se inicializa el valor de retorno a 1
            j terminar
afuera: 
            li a0, 0 # se inicializa el valor de retorno a 0
terminar: 
            lw ra, (0)sp # se carga a ra el valor de stack
            addi sp, sp, 4 # se libera el stack
            ret # se a la funcion caller

# Funcionalidad: Devuelve 1 si a1 >= a2 >= a0 y 0 si no.

Errores: 
1. el programador A asume que a3 y a5 preservan valores luego de un llamado a funcion.

# Correccion

# Arreglos: Guardar a3 y a5 en el stack antes de la llamada a funcion (s2, s3) para luego utilizarlos.

main:
            li a0, 3 # a0 <- 3
            li a1, 10 # a1 <- 10
            li a2, -5 # a2 <- -5
            li a3, 2 # a3 <- 2
            li a4, 5 # a4 <- 5
            li a5, -1 # a5 <- -1
            jal ra, FUNCION # salta a FUNCION y guarda dirección de retorno en ra
            li a2, 1 # a2 <- 1
            bne a0, a2, noFunciona # si a0 != a2, salta a noFunciona
funciona:
            li a1, 1 # a1 <- 1
            j fin # salta a fin
noFunciona:
            li a1, 0 # a1 <- 0
fin:
            j fin # bucle infinito (fin del programa)

# funcionalidad: testear f(3, 10, -5, 2, 5, -1) = 1

FUNCION:
            addi sp, sp, -20 # reserva espacio en stack (3 palabras)
            sw a2, (0)sp # guarda a2 en stack
            sw s0, (4)sp # guarda s0 en stack
            sw ra, (8)sp # guarda ra en stack
            sw a3, (12)sp # guarda a3 en el stack
            sw a5, (16)sp # guarda a5 en el stack
            li s0, 1 # s0 <- 1
            mv a2, a4 # a2 <- a4
            jal ra, FUNCION_AUX # salta a FUNCION AUX y guarda dirección de retorno en ra
            bne a0, s0, return # si a0 != s0 salta a return
            lw a0, (0)sp # a0 <- valor original de a2
            lw a1, (12)sp # a1 <- valor original de a3
            lw a2, (16)sp # a2 <- valor original de a5
            jal ra, FUNCION_AUX # salta a FUNCION AUX
            bne a0, s0, return # si a0 != s0, salta a return
            lw s0, (4)sp # recupera s0 desde stack
            lw ra, (8)sp # recupera ra
            addi sp, sp, 20 # libera el stack
return:
            ret # vuelve a quien llamó FUNCION

FUNCION_AUX:
            addi sp, sp, -4 # se guarda una palabra en el stack
            sw ra, (0)sp # se escribe en el stack el valor de ra
            sub a3, a2, a0 # a3 <- a2 - a0
            blt a3, zero, afuera # si a3 es menor cero que entonces se salta a afuera 
            sub a5, a2, a1 # a5 = a2-a1
            bgt a5, zero, afuera # si a5 es mayor a cero se salta a afuera
adentro: 
            li a0, 1 # se inicializa el valor de retorno a 1
            j terminar
afuera: 
            li a0, 0 # se inicializa el valor de retorno a 0
terminar: 
            lw ra, (0)sp # se carga a ra el valor de stack
            addi sp, sp, 4 # se libera el stack
            ret # se a la funcion caller         


# Testeado en Ripes: Si