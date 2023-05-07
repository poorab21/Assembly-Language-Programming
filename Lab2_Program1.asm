.data 
	maths:.word 50
	english:.word 60
	chemistry:.word 76
	physics:.word 88
	msg:.ascii "Total Sum(out of 400) = "
.text
.globl main
main:
	lw $t0 , maths
	lw $t1 , english
	lw $t2 , chemistry
	lw $t3 , physics
	move $s0 , $t0
	add $s0 , $s0 , $t1
	add $s0 , $s0 , $t2
	add $s0 , $s0 , $t3
	
	li $v0 , 4
	la $a0 , msg
	syscall
	
	move $a0 , $s0
	li $v0 , 1
	syscall