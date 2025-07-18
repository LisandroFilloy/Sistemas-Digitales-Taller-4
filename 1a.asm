#
main:       
            li s1, 2024 # guarda en el registro s1 el inmediato 2024
            mv a0, s1 # guarda en el registro a0 el valor del registro s1, a0 <- 2024
            jal, ra FUNCION # salta a la instruccion de la etiqueta FUNCION y guarda la posicion de memoria actual en el registro ra
            add a0, s1, a0 # a0 <- s1 + a0
            bnez a0, noFunciona # salta si a0 != 0
funciona:   
            li a1, 1 # a1 <- 1
            j fin # salta a fin 
noFunciona: 
            li a1, 0 # a1 <- 0
fin:        
            j fin # Termina el programa -> bucle infinito en esta posicion de memoria

# Funcionalidad: Testea que efectivamente la funcion compute el inverso de a0.             

FUNCION:    
            addi sp, sp, -4 # sp <- sp-4
            sw ra (0)sp # almacenar la direccion de retorno en el stack
            not s1, a0 # carga en s1 el valor de a0 invertido
            addi a0, s1, 1 # a0 <- s1 + 1
            lw ra, (0)sp # carga en el valor de sp-4 (memoria)
            addi sp, sp, 4 # vuelve el stack pointer a su valor original (preservacion correcta)
            ret 


# Funcionalidad: Devuelve el inverso aditivo del valor de entrada.
# Nombre: Invertir

#
prologo: 1-2 
epilogo: 5-7

# 
Error: El programador A no preserva el valor de s1.

# 
Arreglo: Usar un registro que no requiera preservacion en vez de s1, como t0.  

# Corregido

main:       
            li s1, 2024 # guarda en el registro s1 el inmediato 2024
            mv a0, s1 # guarda en el registro a0 el valor del registro s1, a0 <- 2024
            jal, ra FUNCION # salta a la instruccion de la etiqueta FUNCION y guarda la posicion de memoria actual en el registro ra
            add a0, s1, a0 # a0 <- s1 + a0
            bnez a0, noFunciona # salta si a0 != 0
funciona:   
            li a1, 1 # a1 <- 1
            j fin # salta a fin 
noFunciona: 
            li a1, 0 # a1 <- 0
fin:        
            j fin # Termina el programa -> bucle infinito en esta posicion de memoria

FUNCION:    
            addi sp, sp, -4 # sp <- sp-4
            sw ra (0)sp # almacenar la direccion de retorno en el stack
            not t0, a0 # carga en s1 el valor de a0 invertido
            addi a0, t0, 1 # a0 <- s1 + 1
            lw ra, (0)sp # carga en el valor de sp-4 (memoria)
            addi sp, sp, 4 # vuelve el stack pointer a su valor original (preservacion correcta)
            ret

Testeado en Ripes: Si
