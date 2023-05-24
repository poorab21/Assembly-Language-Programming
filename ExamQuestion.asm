.data
	array:.space 256
	filename:.asciiz"evensum.txt"
	msg:.asciiz"Enter Number:"
.text
.globl main
main:
	li $t0 , 0
	li $t1 , 5
	li $t3 , 2
	la $t2 , array
	la $t2 , 0($t2)
	
	li $t4 , 0
	la $t5 , array
	la $t5 , 0($t5)
	la $t7 , array
	la $t7 , 0($t7)
loop:
	beq $t0 , $t1 , filing
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	div $v0 , $t3
	mfhi $s0
	beqz $s0 , assign
	addi $t0 , $t0 , 1
	b loop
assign:
	sw $v0 , ($t2)
	addi $t2 , $t2 , 4
	addi $t0 , $t0 , 1
	b loop
filing:
	li $v0 , 13
	la $a0 , filename
	la $a1 , 1
	syscall
	
	move $s0 , $v0
	
	li $v0 , 15
	move $a0 , $s0
	la $a1 , array
	la $a2 , 256
	syscall
	
	li $v0 , 16
	move $a0 , $s0
	syscall
	
	li $v0 , 10
	syscall