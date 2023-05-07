.data
	array:.space 16
	msg:.asciiz"Enter Number:"
	size:.word 5
	newline:.asciiz"\n"
.text
.globl main
main:
	la $t0 , array
	li $t1 , 5
	sw $t1 , 0($t0)
	li $t1 , 10
	sw $t1 , 4($t0)
	li $t1 , 15
	sw $t1 , 8($t0)
	li $t1 , 20
	sw $t1 , 12($t0)
	li $t1 , 25
	sw $t1 , 16($t0)
	
	lw $t2 , size
	li $t3 , 0 
	blt $t3 , $t2 , loop
loop:
	bge $t3 , $t2 , exit
	li $v0 , 1
	lw $t4 , ($t0)
	move $a0 ,  $t4
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t0 , $t0 , 4
	addi $t3 , $t3 , 1
	b loop
exit:
	li $v0 , 10
	syscall
	
