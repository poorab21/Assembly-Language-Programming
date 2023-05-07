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
loop:
	blez $t2 , before_next
	div $t2 , $t3
	mfhi $s0
	mflo $t2
	sw $s0 , ($t1)
	addi $t1 , $t1 , 4
	b loop
before_next:
	lw $t5 , ($t4)
	b next
next:
	addi $t4 , $t4 , 4
	lw $a0 , ($t4)
	beqz $a0 , exit
	mul $t5 , $t5 , 10
	add $t5 , $t5 , $a0
	b next
exit:
	li $v0 , 1
	move $a0 , $t5
	syscall
	li $v0 , 10
	syscall