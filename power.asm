.data
	num:.asciiz"Enter Number:"
	power:.asciiz"Enter Power:"
	display:.asciiz"Answer = "
	number:.word 0
	pow:.word 0
.text
.globl main
main:
	li $v0 , 4
	la $a0 , num
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , number
	lw $t0 , number
	
	li $v0 , 4
	la $a0 , power
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , pow
	lw $t1 , pow
	li $t2 , 1
	move $t3 , $t0
loop:
	beq $t2 , $t1 , exit
	mul $t3 , $t3 , $t0
	addi $t2 , $t2 , 1
	b loop
exit:
	li $v0 , 4
	la $a0 , display
	syscall
	li $v0 , 1
	move $a0 , $t3
	syscall
	li $v0 , 10
	syscall