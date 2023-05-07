.data
	input:.asciiz"Enter Number:"
	factorial:.asciiz"Factorial = "
.text
.globl main
main:
	li $v1 , 1
	li $v0 , 4
	la $a0 , input
	syscall
	
	li $v0 , 5
	syscall
	
	move $t0 , $v0
	move $t1 , $v0
	li $t2 , 1
	li $t3 , 1
	jal fact
	li $v0 , 4
	la $a0 , factorial
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	li $v0 , 10
	syscall
fact:
	subi $sp , $sp , 4
	sw $ra , ($sp)
	subi $t1 , $t1 , 1
	beq $t1 , -1 , baseCase
	jal fact
	mul $t2 , $t2 , $t3
	addi $t3 , $t3 , 1
	move $v1 , $t2
baseCase:
	lw $ra , ($sp)
	addi $sp , $sp , 4
	jr $ra
	
	
	
	
	
	
	
	
	
	
	
	
	