.data
 	message: .asciiz "Paulo H\nenrique"
 	key: .word 1
 	file:    .asciiz "string.in"
   	buffer:  .space 1024
    	error:   .ascii "Arquivo não encontrado"
    	smallWord: .space 1024
	bigWord: .space 1024
	auxWord: .space 1024
	aux2Word: .space 1024
	breakLine: .asciiz "\n"
	auxT: .word 0
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
       	
messageProperties:
    	la $s0, buffer     #s0 will hold message that will be iterated through
    	lw $t1, key     #s1 will hold the key to shift by
    	li $t0, 0       #t0 will be iterator, starting at 0
    	la $s4, auxWord
    	la $s3, bigWord
    	la $s2, smallWord
    	li $t8, 0
    	li $t9, 0
    	la $s5,($s4)
    	la $k0, breakLine
    	li $t4, 0
    	
    	
     
stringLoop:
    	#add $s1, $s0, $t0   #$s1 = message[i]
   	#add $s4, $s0, $t8
   	
   	lb $t5, ($s0)      #Loading char to shift into $s2 
    	sb $t5, ($s4)
    	
    	beq $t5, '\n', ifFirstWord
    	beq $t5, $zero, exit    #Breaking the loop if we've reached the end: http://stackoverflow.com/questions/12739463/how-to-iterate-a-string-in-mips-assembly
    
    
addIterator:   
	addi $s4, $s4, 1
    	addi $s0, $s0, 1
    	
    	addi $t0, $t0, 1    #i++
    	
    	j stringLoop    #Going back to the beginning of the loop
    
ifFirstWord:
   	sub $t7, $t0, $t6 #posistion where \n was found minus the last \n
   	#move $s4, $zero
   	
   	
   	bne $t6, $zero, printSize
 	
    	#sw $s4, 0($zero)
    	#la $s4, ($s5)
      	li $v0, 1
    	move $a0, $t7
    	syscall  
    	
     	li $v0, 4
     	la $a0, auxWord
     	syscall
     
     	add  $t6, $zero, $t0
     	add  $t5, $zero, $t0
     	la $s4, ($s5)
     	j addZero
   	#j addIterator
   
addZero:
   	sb $zero, ($s4)
   	addi $s4, $s4, 1
   	addi $t4, $t4, 1
   	bgt $t4,$t6, pointInit
        j addZero    

pointInit:
	la $s4, ($s5)
	
	j addIterator
         
printSize:
	addi $t7, $t7, -1
	#la $s4, ($s5)
    	li $v0, 1
    	move $a0, $t7
    
    	
    	syscall  
    	
     	li $v0, 4
     	la $a0, ($s4)
     	syscall

	#la $s4, ($s5)
     	add  $t6, $zero, $t0
    	j addZero
    
exit:
  	sub $t7, $t0, $t6 #need to do this here otherwise is going to ignore the last element
  	addi $t7, $t7, -1
  
   	li $v0, 1
    	move $a0, $t7
    	syscall  
    
  	#li $v0, 4
  	#move $a0, $s1
  	#syscall
  
  
