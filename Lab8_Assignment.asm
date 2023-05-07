.data
	msg:.asciiz"Enter String:"
	input:.space 256
	newline:.asciiz"\n"
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
	jal largest
	la $t6 , input
	la $t6 , 0($t6)
position:
	beqz $v1 , answer_loop
	subi $v1 , $v1 , 1
	addi $t6 , $t6 , 1
	b position
answer_loop:
	lb $a0 , ($t6)
	li $v0 , 11
	syscall
	beq $a0 , ' ' , exit
	beqz $a0 , exit2
	addi $t6 , $t6 , 1
	b answer_loop
exit:
	li $v0 , 10
	syscall
exit2:
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
	jr $ra
swap2:
	move $t2 , $t1
	sub $v1 , $t0 , $t2
	jr $ra
