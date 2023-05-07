.data
	int_array:.space 40
	size:.word 10
	input:.asciiz"Enter Integer:"
	newline:.asciiz"\n"
.text
.globl main
main:
	li $t0 , 0
	li $t1 , 0
	li $t3 , 0
	li $t4 , 0
	lw $t2 , size
loop:
	beq $t1 , $t2 , print
	li $v0 , 4
	la $a0 , input
	syscall
	li $v0 , 5
	syscall
	sw $v0 , int_array($t0)
	addi $t0 , $t0 , 4
	addi $t1 , $t1 , 1
	b loop
print:
	beq $t3 , $t2 , exit
	lw $t5 , int_array($t4)
	li $v0 , 1
	move $a0 , $t5
	syscall
	addi $t3 , $t3 , 1
	addi $t4 , $t4 , 4
	li $v0 , 4
	la $a0 , newline
	syscall
	b print
exit:
	li $v0 , 10
	syscall
	
	
	