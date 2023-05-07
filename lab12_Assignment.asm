.data
	array:.word 10,11,12,13
	      .word 20,21,22,23
	      .word 30,31,32,33
	      .word 40,41,42,43
	newline:.asciiz"\n"
	space:.asciiz" "
.text
.globl main
main:
	li $t0 , 4
	li $t1 , 0
	li $t2 , 0
	la $t3 , array
	la $t3 , 0($t3)
	la $t7 , array
	la $t7 , 0($t7)
	la $t6 , array
	la $t6 , 0($t6)
loop:
	beq $t1 , 4 , Before_Display
	beq $t2 , 4 , new
	mul $t4 , $t0 , $t1
	add $t4 , $t4 , $t2
	mul $t4 , $t4 , $t0
	add $t3 , $t3 , $t4
	lw $s0 , ($t3)
	mul $t5 , $t0 , $t2
	add $t5 , $t5 , $t1
	mul $t5 , $t5 , $t0
	add $t6 , $t6 , $t5
	lw $s1 , ($t6)
	sw $s0 , ($t6)
	sw $s1 , ($t3)
	la $t6 , ($t7)
	la $t3 , ($t7)
	addi $t2 , $t2 , 1
	li $t4 , 0
	li $t5 , 0
	b loop
new:
	addi $t1 , $t1 , 1
	move $t2 , $t1
	b loop
Before_Display:
	li $t1 , 0
	li $t2 , 0
	la $t3 , ($t7)
	b display
display:
	beq $t1 , 4 , exit
	beq $t2 , 4 , new2
	mul $t4 , $t1 , $t0
	add $t4 , $t4 , $t2
	mul $t4 , $t4 , $t0
	add $t3 , $t3 , $t4
	lw $a0 , ($t3)
	li $v0 , 1
	syscall
	li $v0 , 4
	la $a0 , space
	syscall
	la $t3 , ($t7)
	li $t4 , 0
	addi $t2 , $t2 , 1
	b display 
new2:
	li $t2 , 0
	addi $t1 , $t1 , 1
	li $v0 , 4
	la $a0 , newline
	syscall
	b display
exit:
	li $v0 , 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	