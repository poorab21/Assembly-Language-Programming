.data
	length:.word 0
	width:.word 0
	area:.word 0 
	msg1:.asciiz"Enter Length of Rectangle:"
	msg2:.asciiz"Enter Width of Rectangle:"
	msg3:.asciiz"\nArea of Rectangle = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg1
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , length
	lw $s0 , length
	
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , width
	lw $s1 , width
	
	mul $s2 , $s0 , $s1
	sw $s2 , area
	lw $t0 , area
	
	li $v0 , 4
	la $a0 , msg3
	syscall
	
	move $a0 , $t0
	li $v0 , 1
	syscall