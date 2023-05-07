.data
	msg:.asciiz"Enter Number:"
	lcm:.asciiz"Lcm = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t0 , $v0
	
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t1 , $v0
	li $t2 , 1
loop:
	mul $t3 , $t2 , $t1
	div $t3 , $t0
	mfhi $s0
	beqz $s0 , exit
	addi $t2 , $t2 , 1
	b loop
exit:
	li $v0 , 4
	la $a0 , lcm
	syscall
	li $v0 , 1
	move $a0 , $t3
	syscall
	li $v0 , 10
	syscall