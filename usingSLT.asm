.data
  message1: .asciiz "S0 É MENOR QUE S1"
  message2: .asciiz "S0 É MAIOR QUE S1"
  message3: .asciiz "\nTHAT´S FUCk*D"
.text
  main:
   addi $s0, $zero, 50
   addi $s1, $zero, 200
   
    
   slt $t0, $s1, $s0
   beq $t0, $zero, s1Greater
   bne $t0, $zero, s0Greater
   
   exampleMoreCode:
    li $v0, 4
    la $a0, message3
    syscall
    
    li $v0,10
    syscall
  
  s0Greater:
    li $v0, 4
    la $a0, message2
    syscall
  
  j exampleMoreCode
  
  s1Greater:
    li $v0, 4
    la $a0, message1
    syscall
    
    j exampleMoreCode