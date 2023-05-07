.data
	array:.space 256
	string:.space 256
	string2:.space 256
	msg:.asciiz"Enter String:"
	msg2:.asciiz"Enter String to Search:"
	result1:.asciiz"Not Found"
	result2:.asciiz"Found at Index "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 8
	la $a0 , string
	li $a1 , 256
	syscall
	
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 8
	la $a0 , string2
	li $a1 , 256
	syscall
	
	la $t0 , string
	la $t0 , 0($t0)
	la $t3 , string
	la $t3 , 0($t3)
	la $t1 , string2
	la $t1 , 0($t1)
	lb $t2 , ($t1)
	la $t4 , string2
	la $t4 , 0($t4)
	li $t9 , 0
	li $t7 , 0
	la $t6 , string2
	la $t6 , 0($t6)
	li $t8 , 0
length:
	lb $v1 , ($t6)
	beqz $v1 , before_loop
	addi $t7 , $t7 , 1
	addi $t6 , $t6 , 1
	b length
before_loop:
	subi $t7 , $t7 , 1
	b loop
loop:
	lb $a0 , ($t0)
	beqz $a0 , exit
	beq $a0 , $t2 , before_compare
	addi $t0 , $t0 , 1
	addi $t8 , $t8 , 1
	b loop
before_compare:
	la $t3 , ($t0)
	la $t1 , ($t4)
	b compare
compare:
	lb $s0 , ($t3)
	lb $s1 , ($t1)
	bne $s0 , $s1 , back
	addi $t3 , $t3 , 1
	addi $t1 , $t1 , 1
	addi $t9 , $t9 , 1
	beq $t9 , $t7 , exit2
	b compare
back:
	addi $t8 , $t8 , 1
	addi $t0 , $t0 , 1
	li $t9 , 0
	b loop
exit:
	beq $s2 , 1 , exit3
	li $v0 , 4
	la $a0 , result1
	syscall
	li $v0 , 10
	syscall
exit2:
	li $s2 , 1
	li $v0 , 4
	la $a0 , result2
	syscall
	li $v0 , 1
	move $a0 , $t8
	syscall
	b loop
exit3:
	li $v0 , 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	