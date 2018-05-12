.data

.text
  addi $s0, $zero, 3500
  addi $s1, $zero, 12
  
  mult $s0, $s1
  
  mflo $t0
  
  li $v0, 1
  add $a0, $zero, $t0
  syscall