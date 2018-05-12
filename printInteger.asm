.data
  age: .word 24 #Integer é uma word pois uma word possui 32 bits/8bytes

.text
  # li $v0,1  é o código para imprimir um integer
  li $v0, 1
  lw $a0, age
  syscall