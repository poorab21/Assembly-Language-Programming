.data
	input:.asciiz"Enter Number:"
	gcd:.asciiz"The GCD is "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , input
	syscall
	li $v0 , 5
	syscall
	move $t0 , $v0
	
	li $v0 , 4
	la $a0 , input
	syscall
	li $v0 , 5
	syscall
	move $t1 , $v0
	li $v1 , 1
	li $t2 , 0
	jal GCD
	li $v0 , 4
	la $a0 , gcd
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	li $v0 , 10
	syscall
GCD:
	bgt $t2 , $t1 , exit
	div $t1 , $t2
	mfhi $s0
	beqz $s0 , compare
	addi $t2 , $t2 , 1
	b GCD
compare:
	div $t0 , $t2
	mfhi $s1
	beqz $s1 , value
	addi $t2 , $t2 , 1
	b GCD
value:
	move $v1 , $t2
	addi $t2 , $t2 , 1
	b GCD
exit:
	jr $ra