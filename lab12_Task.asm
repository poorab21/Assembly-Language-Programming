.data
	class_marks:.word 10,18,12,13
		    .word 20,21,28,23
		    .word 32,31,34,33
		    .word 40,41,42,48
		    .word 50,51,52,55
		    .word 60,61,66,63
		    .word 70,71,76,73
		    .word 80,88,82,83
		    .word 90,94,92,93
		    .word 99,96,97,98
	array:.space 256
	newline:.asciiz"\n"
	msg:.asciiz"Largest from each row:"
.text
.globl main
main:
	li $s0 , 4
	li $s1 , 0
	li $t0 , 10
	li $t1 , 4
	la $t2 , class_marks
	la $t2 , 0($t2)
	la $s3 , class_marks
	la $s3 , 0($s3)
	li $t3 , 0
	li $t4 , 0
	la $t6 , array
	la $t6 , 0($t6)
loop:
	beq $t4 , 4 , increment
	mul $t5 , $s0 , $t3
	add $t5 , $t5 , $t4
	mul $t5 , $t5 , $s0
	add $t2 , $t2 , $t5
	lw $s2 , ($t2)
	bgt $s2 , $s1 , swap
	addi $t4 , $t4 , 1
	la $t2 , 0($s3)
	b loop
swap:
	move $s1 , $s2
	addi $t4 , $t4 , 1
	la $t2 , 0($s3)
	b loop
increment:
	sw $s1 , ($t6)
	li $s1 , 0
	addi $t6 , $t6 , 4
	addi $t3 , $t3 , 1
	li $t4 , 0
	la $t2 , 0($s3)
	beq $t3 , 10 , Before_Display
	b loop
Before_Display:
	li $t0 , 0
	li $t1 , 10
	la $t2 , array
	la $t2 , 0($t2)
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	b display
display:
	lw $a0 , ($t2)
	beqz $a0 , exit
	li $v0 , 1
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t2 , $t2 , 4
	b display
exit:
	li $v0 , 10
	syscall
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	