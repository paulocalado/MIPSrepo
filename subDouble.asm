.data 
  number1: .double 23.57
  number2: .double 18.75

.text
  ldc1 $f0, number1
  ldc1 $f2, number2
  
  sub.d $f4, $f0, $f2
  
  li $v0, 3
  mov.d $f12, $f4
  syscall