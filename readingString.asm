.data
 message: .asciiz "Paul\no Henrique"
 key: .word 1
 file:    .asciiz "string.in"
    buffer:  .space 1024
    error:   .ascii "Arquivo não encontrado"
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
    la $s0, message     #s0 will hold message that will be iterated through
    lw $t1, key     #s1 will hold the key to shift by
    li $t0, 0       #t0 will be iterator, starting at 0
 
encryptionLoop:
    add $s1, $s0, $t0   #$s1 = message[i]
    lb $s2, 0($s1)      #Loading char to shift into $s2
    
    beq $s2, $zero, exit    #Breaking the loop if we've reached the end: http://stackoverflow.com/questions/12739463/how-to-iterate-a-string-in-mips-assembly
    beq $s2, '\n', exit
    add $s2, $s2, $t1   #Shifting the character by the key amount
    #la $s1, ($s2)       #Changing the character in message to the shifted character
    addi $t0, $t0, 1    #i++
    j encryptionLoop    #Going back to the beginning of the loop
    
  exit:
  li $v0, 1
  move $a0, $t0
  syscall  
  
  li $v0, 4
  move $a0, $s1
  syscall