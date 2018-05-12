.data 
  prompt: .asciiz "Enter your height: "
  message: .asciiz "\nYou have: "
  zeroAsFloat: .float 0.0
.text
  #There's no $zero register for coprocessor1(float points) so doing this will create a register with 0.0 in it
  lwc1 $f1, zeroAsFloat
  
  li $v0, 4
  la $a0, prompt
  syscall
  
  #Different from the integers, the float value from the user will be stored in $f0
  li $v0, 6
  syscall
  
  li $v0,4
  la $a0, message
  syscall
  
  li $v0, 2
  add.s $f12, $f0, $f4
  syscall