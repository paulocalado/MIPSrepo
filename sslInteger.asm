.data

.text
 addi $s0, $zero, 4
 sll $t0, $s0, 3 #o ultimo parametro é a exponencia de 2, ou seja, vai ser 4*2^3, ou 4*8
 
 li $v0, 1
 add $a0, $zero, $t0
 syscall