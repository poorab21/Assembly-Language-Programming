.data
	msg:.asciiz"Enter String:"
	input:.asciiz""
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 8
	la $a0 , input
	li $a1 , 50
	syscall
	
	la $t0 , input
	li $t1 , 0
loop:
	lb $a0 , 0($t0)
	beqz $a0 , continue
	addi $t1 , $t1 , 1
	addi $t0 , $t0 , 1
	b loop
continue:
	la $t2 , input
	subi $t1 , $t1 , 1
	add $t2 , $t2 , $t1
	b loop2
loop2:
	beq $t1 , -1 , exit
	li $v0 , 11
	lb $a0 , ($t2)
	syscall
	subi $t2 , $t2 , 1
	subi $t1 , $t1 , 1
	b loop2
exit:
	li $v0 , 10
	syscall
	 