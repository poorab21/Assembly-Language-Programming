.data
	array:.space 28
	d:.byte'D'
.text
.globl main
main:
	la $t1 , array
	la $t0 , 'D'
	sw $t0 , ($t1)
	addi $t1 , $t1 , 4
	la $t0 , 'H'
	sw $t0 , ($t1)
	addi $t1 , $t1 , 4
	la $t0 , 'A'
	sw $t0 , ($t1)
	 
	la $t2 , array
	li $v0 , 4
	la $a0 , ($t2)
	syscall
	addi $t2 , $t2 , 4
	li $v0 , 4
	la $a0 , ($t2)
	syscall
	addi $t2 , $t2 , 4
	li $v0 , 4
	la $a0 , ($t2)
	syscall
	