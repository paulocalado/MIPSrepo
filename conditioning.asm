.data
  message: .asciiz "\nequal numbers"
  message2: .asciiz "\nnumbers are different"
  message3: .asciiz "\nJust testing"
.text
 
 main:
   addi $t0, $zero, 5
   addi $t1, $zero, 5
  
  beq $t0, $t1, printEqualNumbers
  li $v0,4
  la $a0, message2
  syscall
  
  restOfProgram:
   li $v0,4
   la $a0, message3
   syscall
   
   li $v0,10
   syscall
  
 
 printEqualNumbers:
   li $v0,4
   la $a0, message
   syscall
  j restOfProgram
