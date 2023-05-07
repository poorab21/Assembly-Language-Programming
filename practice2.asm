.data 
	count:.word 1
	newline:.asciiz"\n"
.text
.globl main
main:
	lw $t0 , count
	ble $t0 , 6 , function
function:
	move $a0 , $t0
	li $v0 , 1
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t0 , $t0 , 1
	bgt $t0 , 6 , exit
	b function
exit:
	li $v0 , 10
	syscall