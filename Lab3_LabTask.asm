.data
	testInteger:.word 0
	msg:.asciiz"Enter an Integer:\n"
	msg2:.asciiz"Number = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , testInteger
	lw $s0 , testInteger
	
	mul $s0 , $s0 , $s0
	
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	move $a0 , $s0
	li $v0 , 1
	syscall
	