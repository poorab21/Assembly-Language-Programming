.data
	num:.asciiz"Enter Number:"
	factorial:.asciiz"Factorial = "
	number:.word 0
.text
.globl main
main:
	li $v0 , 4
	la $a0 , num
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , number
	lw $t0 , number
	
	li $t1 , 1
	li $t2 , 1
loop:
	bgt $t2 , $t0 , exit
	mul $t1 , $t1 , $t2
	addi $t2 , $t2 , 1
	b loop
exit:
	li $v0 , 4
	la $a0 , factorial
	syscall
	li $v0 , 1
	move $a0 , $t1
	syscall
	li $v0 , 10
	syscall