.data
	msg:.asciiz"Enter Positive Integer:"
	num:.word 0
	msg2:.asciiz"Sum = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , num
	lw $t0 , num
	
	li $t1 , 1
	li $t2 , 0
loop:
	ble $t1 , $t0 , function
function:
	bgt $t1 , $t0 , exit 
	add $t2 , $t2 , $t1
	addi $t1 , $t1 , 1
	b function
exit:
	li $v0 , 4
	la $a0 , msg2
	syscall
	move $a0 , $t2
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall