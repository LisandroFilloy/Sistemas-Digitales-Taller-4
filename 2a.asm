FUNCION:        
            li a1, 0
            jeq a0, a1, Return_0
            li a1, 1
            jeq a0, a1, Return_1
            li a2, 0
            li a3, 1
Bucle           
            mv t0, a3
            addi a3, a3, a2
            mv a2, t0
            addi a1, 1
            jneq a0, a1, Bucle
            j fin
Return_0        
            li a3, 0
            j Fin
Return_1        
            li a3, 1
            j Fin
Fin             
            mv a0, a3
            Ret


# Casos de test: 

Main:
            li a0, 2
            jal ra, FUNCION
            li a1, 1
            bneq a0, a1, noFunciona
            li a0, 5
            jal ra, FUNCION
            li a1, 3
            bneq a0, a1, noFunciona
funciona        
            li a1, 1
            j fin
noFunciona      
            li a0, 0
fin             
            j fin

# Testeado en Ripes: