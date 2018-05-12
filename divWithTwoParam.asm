.data
  quociente: .asciiz "quociente:\n"
  resto: .asciiz "\nresto:\n"
  
  
.text
 addi $s0, $zero, 34
 addi $s1, $zero, 12
 
 div $s0, $s1
 
 mflo $t0
 mfhi $t1
 
 li $v0,4
 la $a0, quociente
 syscall
 
 li $v0,1
 add $a0, $zero, $t0
 syscall
 
 li $v0,4
 la $a0, resto
 syscall
 
 li $v0,1
 add $a0,$zero,$t1
 syscall

 
