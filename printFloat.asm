.data
 pi: .float 3.146345

.text
  li   $v0, 2
  lwc1 $f12, pi
  syscall