.data
	array:.word 1,2,3,4,5,6,7,8,9,10
	newline:.asciiz"\n"
.text
.globl main
main:
	la $t0 , array
	la $t0 , ($t0)
	la $t1 , array
	la $t1 , ($t1)
	li $t2 , 1
	li $t7 , 0
	li $t3 , 5
loop:
	addi $t1 , $t1 , 4
	addi $t2 , $t2 , 1
	beq $t2 , 10 , loop2
	b loop
loop2:
	beqz $t3 , before_display
	lw $s0 , ($t0)
	lw $s1 , ($t1)
	sw $s0 , ($t1)
	sw $s1 , ($t0)  
	addi $t0 , $t0 , 4
	subi $t1 , $t1 , 4
	subi $t3 , $t3 , 1
	b loop2
before_display:
	la $t0 , array
	la $t0 , 0($t0)
	b display
display: 
	lw $a0 , ($t0)
	li $v0 , 1
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t7 , $t7 , 1
	addi $t0 , $t0 , 4
	beq $t7 , 10 , exit
	b display
exit:
	li $v0 , 10
	syscall