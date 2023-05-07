.data
	array:.space 256
	msg:.asciiz"Enter Number:"
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t0 , $v0
	move $t2 , $t0
	li $t3 , 10
	la $t1 , array
	la $t1 , 0($t1)
	la $t4 , array
	la $t4 , 0($t4)
	li $s1 , 0
loop:
	blez $t2 , next
	div $t2 , $t3
	mfhi $s0
	mflo $t2
	sw $s0 , ($t1)
	addi $t1 , $t1 , 4
	b loop
next:
	lw $s0 , ($t4)
	beqz $s0 , exit
	add $s1 , $s1 , $s0
	addi $t4 , $t4 , 4
	b next
exit:
	li $v0 , 1
	move $a0 , $s1
	syscall
	li $v0 , 10
	syscall