.data 
	array:.space 90
	input:.asciiz"Enter String:"
	msg1:.asciiz"\nString["
	msg2:.asciiz"] = "
.text
.globl main
main:
	la $t0 , array
	li $t1 , 5
	li $t2 , 0
	li $t3 , 5
	li $t4 , 0
	la $t5 , 0($t0)
loop1:
	beq $t2 , $t1 , loop2
	li $v0 , 4
	la $a0 , input
	syscall
	li $v0 , 8
	la $a0 , ($t0)
	li $a1 , 15
	syscall
	addi $t0 , $t0 , 15
	addi $t2 , $t2 , 1
	b loop1
loop2:
	beq $t4 , $t3 , exit
	li $v0 , 4
	la $a0 , msg1
	syscall
	li $v0 , 1
	move $a0 , $t4
	syscall
	li $v0 , 4
	la $a0 , msg2
	syscall
	li $v0 , 4
	la $a0 , ($t5)
	syscall
	addi $t4 , $t4 , 1
	addi $t5 , $t5 , 15
	b loop2
exit:
	li $v0 , 10
	syscall