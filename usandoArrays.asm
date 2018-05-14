.data
 
 paulo: .asciiz "Paulo"
 henrique: .asciiz "Henrique"
 calado: .asciiz "Calado"
 aoun: .asciiz "Aoun"
 names: .word paulo, henrique, calado, aoun
 end: .asciiz "\nend of loop"
 iterator: .word 0
 size: .word 3
 
 .text
 main:
  la $t0, names
  lw $t1, iterator
  lw $t2, size
 
 loop: 
  bgt $t1, $t2, exit
  sll $t3, $t1, 2
  
  addu $t3, $t3, $t0
  
  li $v0, 4
  lw $a0,0($t3)
  syscall
  
  addi $t1, $t1, 1
  
  j loop
  
  exit:
   li $v0, 4
   la $a0, end
   syscall
   
  