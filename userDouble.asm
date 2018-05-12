.data
  prompt: .asciiz "Enter a dobule value: "
  zeroAsDouble: .double 0.0
.text
 lwc1 $f2, zeroAsDouble
 
 li $v0,4
 la $a0, prompt
 syscall
 
 #The value entered by the user will be stored in $f0 and $f1
 li $v0, 7
 syscall
 
 li $v0, 3
 add.d $f12, $f0, $f2
 syscall