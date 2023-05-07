.data
	input:.asciiz"Enter Number:"
	input2:.asciiz"Enter Power:"
	answer:.asciiz"Answer = "
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
	li $v0 , 4
	la $a0 , input2
	syscall
	li $v0 , 5
	syscall
	move $t1 , $v0
	move $t2 , $t1
	jal power
	li $v0 , 4
	la $a0 , answer
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	li $v0 , 10
	syscall
power:
	subi $sp , $sp , 4
	sw $ra , ($sp)
	subi $t2 , $t2 , 1
	beq $t2 , -1 , baseCase
	jal power
	mul $v1 , $v1 , $t0
baseCase:
	lw $ra , ($sp)
	addi $sp , $sp , 4
	jr $ra