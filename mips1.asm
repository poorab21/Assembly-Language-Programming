.data
	msg:.asciiz"Enter String:"
	input:.space 256
	newline:.asciiz"\n"
	answer:.space 256
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 8
	la $a0 , input
	li $a1 , 256
	syscall
	
	la $a1 , input
	la $t6 , input
	la $t6 , 0($t6)
	jal largest
	li $v0 , 4
	la $a0 , answer
	syscall
	li $v0 , 10
	syscall
largest:
	li $t0 , 0
	li $t1 , 0
	li $t2 , 0
loop:	
	lb $a0 , ($a1)
	beqz $a0 , function
	beq $a0 , ' ' , function2
	addi $t0 , $t0 , 1
	addi $t1 , $t1 , 1
	addi $a1 , $a1 , 1
	b loop
function2:
	bgt $t1 , $t2 , swap
	li $t1 , 0
	addi $a1 , $a1 , 1
	addi $t0 , $t0 , 1
	b loop
swap:
	move $t2 , $t1
	li $t1 , 0
	sub $v1 , $t0 , $t2
	addi $a1 , $a1 , 1
	addi $t0 , $t0 , 1
	b loop
function:
	bgt $t1 , $t2 , swap2
	b position
swap2:
	move $t2 , $t1
	sub $v1 , $t0 , $t2
	b position
position:
	beqz $v1 , setting
	subi $v1 , $v1 , 1
	addi $t6 , $t6 , 1
	b position
setting:
	la $v1 , answer
	la $v1 , 0($v1)
	b answer_loop
answer_loop:
	lb $a0 , ($t6)
	sb $a0 , ($v1)
	lb $a0 , ($v1)
	addi $v1 , $v1 , 1
	beq $a0 , ' ' , return
	beqz $a0 , return
	addi $t6 , $t6 , 1
	b answer_loop
return:
	jr $ra