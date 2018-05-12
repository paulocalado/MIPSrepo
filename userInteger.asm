.data
   prompt: .asciiz "Enter your age: "
   message: .asciiz "\nYour age is: "
.text
  li $v0, 4
  la $a0, prompt
  syscall
  
  #get the integer from the user
  li $v0,5
  syscall
  
  #move to a temporary register
  move $t0, $v0
  
  li $v0, 4
  la $a0, message
  syscall
  
  li $v0,1
  add $a0, $zero,$t0
  syscall
  
  