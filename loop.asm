.data 
  bigNumber: .word 200
  smallNumber: .word 0
  lineBreak: .asciiz "\n"
  endProgram: .asciiz "end of loop"
.text

  main:
   lw $s1, bigNumber($zero)
   lw $s2, smallNumber($zero)
   jal loop
   
   loop: 
    
    #verifica se são iguais, senão, incrementa em 1, printa o número e volta para o loop, caso sejam iguais, vai para função exit
     jal printNumbers
     beq $s2, $s1, exit
     addi $s2, $s2, 1
     
     j loop
   
   exit:
   #apenas informa o fim do loop e finaliza o programa
    li $v0,4
    la $a0, endProgram
    syscall
   
   #finaliza o programa
     li $v0,10
     syscall
 
   printNumbers:
   #armazena o valor de ra, já que ele é chamado dentro de um outro método e depois printa os valores necessários
    addi $sp, $sp, -4
    sw $ra, 0($sp)
   
     li $v0, 1
     move $a0, $s2
     syscall
     
     li $v0, 4
     la $a0, lineBreak
     syscall
   lw $ra, 0($sp)
   addi $sp, $sp, 4  
   
   jr $ra