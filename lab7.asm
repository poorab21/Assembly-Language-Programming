.data
	int_array:.word 1,2,3,4,5,6,7,8,9,10
	size:.word 10
	newline:.asciiz"\n"
.text
.globl main
main:
	li $t0 , 0
	lw $t1 , size
	li $t2 , 0
loop:
	beq $t2 , $t1 , exit
	lw $a0 , int_array($t0)
	li $v0 , 1
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t0 , $t0 , 4
	addi $t2 , $t2 , 1
	b loop
exit:
	li $v0 , 10
	syscall 