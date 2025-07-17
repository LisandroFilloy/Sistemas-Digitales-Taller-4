Main:
            li a0, 2
            jal ra, FUNCION
            li a1, 1
            bne a0, a1, noFunciona
            li a0, 5
            jal ra, FUNCION
            li a1, 3
            bne a0, a1, noFunciona
funciona:       
            li a1, 1
            j fin
noFunciona:   
            li a1, 0
fin:             
            j fin
            
FUNCION: 
    addi sp, sp, -4 # sp <- sp-4
    sw ra, (0)sp # guarda ra en la direccion de memoria sp.
    slli a2, a0, 2 # shift logico a izquierda de tamano 2 al valor de a0. a2 = a0 * 4 Almacena en a2.
    srai a1, a1, 1 # shift aritmetico a derecha de tamano 1 al valor de a1. a1 = a1 / 2.
    sub a0, a2, a1 # a0 <- a2 - a1
    lw ra, (0)sp # carga en ra el valor en la posicion de memoria sp.
    addi sp, sp, 4 # sp <- sp + 4 (valor original)
    ret

# Testeado en Ripes: Si