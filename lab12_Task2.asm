.data
	array:.word 10,11,12,13
	      .word 20,21,22,23
	      .word 30,31,32,33
	      .word 40,41,42,43
	diagonal:.asciiz"Left Diagonal Sum ="
	diagonal2:.asciiz"\nRight Diagonal Sum = "
.text
.globl main
main:
	li $t0 , 0
	li $t1 , 0
	li $t2 , 4
	la $t3 , array
	la $t3 , 0($t3)
	la $t5 , array
	la $t5 , 0($t5)
	li $t4 , 0
	li $t6 , 0
loop:
	beq $t0 , 4 , next
	mul $t6 , $t0 , $t2
	add $t6 , $t6 , $t1
	mul $t6 , $t6 , $t2
	add $t3 , $t3 , $t6
	lw $s1 , ($t3)
	add $t4 , $t4 , $s1
	addi $t0 , $t0 , 1
	addi $t1 , $t1 , 1
	la $t3 , 0($t5)
	li $t6 , 0
	b loop
next:
	move $s0 , $t4
	la $t3 , 0($t5)
	li $t0 , 0
	li $t1 , 3
	li $t6 , 0
	li $s1 , 0
	b loop2
loop2:
	beq $t0 , 4 , exit
	mul $t6 , $t2 , $t0
	add $t6 , $t6 , $t1
	mul $t6 , $t6 , $t2
	add $t3 , $t3 , $t6
	lw $t7 , ($t3)
	add $s1 , $s1 , $t7
	la $t3 , 0($t5)
	addi $t0 , $t0 , 1
	subi $t1 , $t1 , 1
	li $t6 , 0
	b loop2
exit:
	li $v0 , 4
	la $a0 , diagonal
	syscall
	li $v0 , 1
	move $a0 , $s0 
	syscall
	li $v0 , 4
	la $a0 , diagonal2
	syscall
	li $v0 , 1
	move $a0 , $s1
	syscall
	li $v0 , 10
	syscall