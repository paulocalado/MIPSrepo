.data
  prompt: .asciiz "enter your name: "
  userName: .space 20
  helloMessage: .asciiz "\nHello, "
.text
  main:
   li $v0,4
   la $a0, prompt
   syscall
   
   #getting user input string
   li $v0,8
   la $a0, userName
   li $a1, 20
   syscall
   
   li $v0, 4
   la $a0, helloMessage
   syscall
  
   li $v0, 4
   la $a0, userName
   syscall
  
  
  #finish the program
  li $v0,10
  syscall