.data
	array:.space 256
	msg:.asciiz"Enter Number:"
	result:.asciiz"Sum = "
	newline:.asciiz"\n"
.text
.globl main
main:
	li $t0 , 0
	li $t1 , 10
	la $t2 , array
	la $t2 , 0($t2)
	la $t5 , array
	la $t5 , 0($t5)
input_loop:
	beq $t0 , $t1 , next
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $a1 , $v0
	jal isEligible
	beq $v1 , 1 , allow
	addi $t0 , $t0 , 1
	b input_loop
allow:
	sw $a1 , ($t2)
	addi $t2 , $t2 , 4
	addi $t0 , $t0 , 1
	b input_loop
isEligible:
	bgt $a1 , 5 , continue
	li $v1 , 0
	jr $ra
continue:
	blt $a1 , 15 , return
	li $v1 , 0
	jr $ra
return:
	li $v1 , 1
	jr $ra
next:
	jal sum
	li $v0 , 4
	la $a0 , result
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	li $v0 , 10
	syscall
sum:
	li $v1 , 0
	b sum_continue
sum_continue:
	lw $a0 , ($t5)
	beqz $a0 , return2
	add $v1 , $v1 , $a0
	addi $t5 , $t5 , 4
	b sum_continue
return2:
	jr $ra