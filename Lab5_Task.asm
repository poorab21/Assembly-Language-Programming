.data
	array:.space 12
	value:.word 4
	newline:.asciiz"\n"
.text
.globl main
main:
	la $t0 , array
	li $t1 , 10
	sw $t1 , 0($t0)
	li $t1 , 15
	sw $t1 , 4($t0)
	li $t1 , -10
	sw $t1 , 8($t0)
	
	lw $t1 , 0($t0)
	li $v0 , 1
	move $a0 , $t1
	syscall
	
	li $v0 , 4
	la $a0 , newline
	syscall
	
	lw $t1 , 4($t0)
	li $v0 , 1
	move $a0 , $t1
	syscall 
	
	li $v0 , 4
	la $a0 , newline
	syscall
	
	lw $t1 , 8($t0)
	li $v0 , 1
	move $a0 , $t1
	syscall
	