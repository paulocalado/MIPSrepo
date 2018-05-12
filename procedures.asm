.data
  message: .asciiz "Hi guys\n FUck u"

.text
  main:
  
  jal displayMessage
  
  #Finish the program
  li $v0,10
  syscall
  
  displayMessage:
    li $v0, 4
    la $a0, message
    syscall
    
    jr $ra