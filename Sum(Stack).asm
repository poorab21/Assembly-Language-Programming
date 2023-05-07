.data
	newline:.asciiz"\n"
	Sum:.asciiz"Sum = "
	input:.asciiz"Enter Number:"
	size:.asciiz"Enter Size:"
	array:.word 0,0,0,0,0
.text
.globl main
main:
	li $v0 , 4
	la $a0 , size
	syscall
	li $v0 , 5
	syscall
	move $t0 , $v0
	la $t1 , array
	la $t1 , 0($t1)
	la $s0 , array
	la $s0 , 0($s0)
	li $t2 , 0
	li $t3 , 0
input_loop:
	bge $t2 , $t0 , next
	li $v0 , 4
	la $a0 , input
	syscall
	li $v0 , 5
	syscall
	sw $v0 , ($t1)
	add $t1 , $t1 , 4
	addi $t2 , $t2 , 1
	b input_loop
next:
	li $t5 , 0
	jal sum
	li $v0 , 4
	la $a0 , Sum
	syscall
	li $v0 , 1
	move $a0 , $t5
	syscall
	li $v0 , 10
	syscall
sum:
	subi $sp , $sp , 4
	sw $ra , ($sp)
	subi $t0 , $t0 , 1
	beq $t0 , -1 , baseCase
	jal sum
	lw $t2 , ($s0)
	add $t5 , $t5 , $t2
	addi $s0 , $s0 , 4
baseCase:
	lw $ra , ($sp)
	addi $sp , $sp , 4
	jr $ra
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
