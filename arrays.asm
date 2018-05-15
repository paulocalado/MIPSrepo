.data
 
 paulo: .asciiz "Essa"
 henrique: .asciiz "Frase"
 calado: .asciiz "Muito Grande"
 aoun: .asciiz "quase"
 testando: .asciiz "mn"
 names: .word paulo, henrique, calado, aoun, testando
 end: .asciiz "\nend of loop"
 
 iterator: .word 0
 size: .word 4
 
  file:    .asciiz "string.in"
    buffer:  .space 1024
    error:   .ascii "Arquivo não encontrado"
    
   outfile: .asciiz "out.txt"  
.text
main:
 # open a file
        li $v0, 13    #open file
        la $a0, file  
        li $a1, 0     # flag for read only 0 = read; 1 write/create; 9 write/create/append
        li $a2, 0     # flag for ignore
        syscall       # open a file (file descriptor returned in $v0) 
    
    
        move $s0, $v0   # file descriptor saved in $s0
        

        # read file
        li   $v0, 14        #code to read file
        add  $a0, $s0, $0	
        la   $a1, buffer    # address of buffer from which to read
        li   $a2,  1024     # hardcoded buffer length
        syscall             # read from file

  la $t0, names
  lw $t1, iterator
  lw $t2, size
  li $t5, 0
  li $t6,0
  
  
  
  #looping through the array
 loop: 
  bgt $t1, $t2, exit #check if the iterator is bigger than the size
  sll $t3, $t1, 2
  
  addu $t3, $t3, $t0 #pointing to the ith element of the array
  lw $t4, 0($t3) #loading the element in the t4 register cause this way I can check the size of it
  
  jal countElements
  
  printElement:
  li $t5,0
 # li $v0, 4
  #lw $a0,0($t3)
  #syscall
  
  addi $t1, $t1, 1
  
  j loop
  
  countElements:
    lb   $a0,0($t4) #looping through the element of the array
    beqz $a0,printSize
    addi $t4,$t4,1 #incrementing the element iterator
    addi $t5,$t5,1 #size
    j     countElements
  
  printSize:
    bgt $t5,$t6, biggestElement
    blt $t5,$t6, smallestElement
    # add $t6, $zero, $t5 #using an temporary register to check which one is bigger
    #li   $v0,1
    #add  $a0, $0,$t6
    #syscall
    
    j printElement
    
    biggestElement:
     lw $t7, 0($t3)
     j updateRegister
     
    smallestElement:
     lw  $t8, 0($t3)
     j updateRegister
     
   updateRegister:
     add $t6, $zero, $t5
     j countElements  
  
  exit:
  
   
   li $v0, 4
   move $a0, $t7
   syscall
   
   li $v0, 4
   move $a0, $t8
   syscall
   
 
   
   li $v0, 4
   la $a0, end
   syscall
   
  
