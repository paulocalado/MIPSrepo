.data
  myCharacter: .byte  'p'

.text
  li $v0, 4
  la $a0, myCharacter
  syscall