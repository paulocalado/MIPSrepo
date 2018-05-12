.data
  myMessage: .asciiz "Testando essa merda\n"

.text
 li $v0, 4
 la $a0, myMessage
 syscall