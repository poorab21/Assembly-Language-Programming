.data 
	msg:.asciiz"Remainder = "
	msg2:.asciiz"\nQuotient = "
.text
.globl main
main:
	li $t0 , 16
	li $t1 , 3
	div $t0 , $t1
	mflo $s0
	mfhi $s1
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 1
	move $a0 , $s1
	syscall
	li $v0 , 4
	la $a0 , msg2
	syscall
	li $v0 , 1
	move $a0 , $s0
	syscall