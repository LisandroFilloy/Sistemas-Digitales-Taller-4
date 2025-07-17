Main: 
            li a0, 4
            li a1, 3
            li a2, 2
            li a3, 1 
            jal ra, FUNCION
            li a4, 1
            bne a0, a4, NoFunciona
            li a0, 1
            li a1, 1
            li a2, 1
            li a3, 1 
            jal ra, FUNCION
            li a4, 0
            bne a0, a4, NoFunciona
            li a0, 1
            li a1, 2
            li a2, 3
            li a3, 4 
            jal ra, FUNCION
            li a4, -1
            bne a0, a4, NoFunciona
            li a1, 1
            j Fin
NoFunciona:     
            li a1, 0
Fin:            
            j Fin


FUNCION:            
            beq a0, a2, Return_0
            beq a1, a3, Return_0
            bge a0, a2, y1_mayor_y2
            blt a0, a2, y1_menor_y2
y1_mayor_y2:        
            bge a1, a3, Return_1
            j Return_0
y1_menor_y2:        
            blt a1, a3, Return_neg_1
            j Return_0
Return_0:            
            li a0, 0
            j fin
Return_1:            
            li, a0, 1
            j fin
Return_neg_1:            
            li, a0, -1
            j fin
fin:                
            ret

# Testeado en Ripes: Si