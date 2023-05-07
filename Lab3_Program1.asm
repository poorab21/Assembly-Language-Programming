.data 
	x:.word 0
	y:.word 0
	z:.word 0
	a1:.word 0
	b1:.word 0
	c1:.word 0
	msg1:.asciiz"Enter the Value of x:"
	msg2:.asciiz"Enter the Value of y:"
	msg3:.asciiz"Enter the Value of z:"
	msg4:.asciiz"Value of a1 = "
	msg5:.asciiz"\nValue of b1 = "
	msg6:.asciiz"\nValue of c1 = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg1
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , x
	lw $s0 , x
	
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , y
	lw $s1 , y
	
	li $v0 , 4
	la $a0 , msg3
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , z
	lw $s2 , z
	
	mul $s3 , $s0 , $s1
	add $s3 , $s3 , $s2
	
	sw $s3 , a1
	lw $s3 , a1
	
	mul $s4 , $s1 , $s2
	add $s4 , $s4 , $s0
	
	sw $s4 , b1
	lw $s4 , b1
	
	mul $s5 , $s0 , $s1
	sub $s5 , $s5 , $s2
	
	sw $s5 , c1
	lw $s5 , c1
	
	li $v0 , 4
	la $a0 , msg4
	syscall
	
	move $a0 , $s3
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , msg5
	syscall
	
	move $a0 , $s4
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , msg6
	syscall
	
	move $a0 , $s5
	li $v0 , 1
	syscall