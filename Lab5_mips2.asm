.data 
	array:.space 16
	num:.word 0
	msg2:.asciiz"] is "
	line:.asciiz"Value of arr["
	newline:.asciiz"\n"
.text
.globl main
main:
	la $t0 , array
	li $t1 , 11
	sw $t1 , 0($t0)
	li $t1 , 12
	sw $t1 , 4($t0)
	li $t1 , 13
	sw $t1 , 8($t0)
	li $t1 , 14
	sw $t1 , 12($t0)
	li $t1 , 15
	sw $t1 , 16($t0)
	li $t1 , 0
	li $t2 , 5
	blt $t1 , $t2 , function  
function:	
	beq $t1 , $t2 , exit
	lw $t3 , ($t0)
	mul $t4 , $t3 , 10
	
	li $v0 , 4
	la $a0 , line
	syscall
	
	li $v0 , 1
	move $a0 , $t1
	syscall
	
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	li $v0 , 1
	move $a0 , $t4
	syscall
	
	addi $t0 , $t0 , 4
	addi $t1 , $t1 , 1
	li $v0 , 4
	la $a0 , newline
	syscall 
	b function
exit:
	li $v0 , 10
	syscall