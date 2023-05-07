.data
	input:.space 256
	msg:.asciiz"Enter String:"
	result1:.asciiz"Word is a pallindrome"
	result2:.asciiz"Word is not a pallindrome"
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
	la $t0 , input
	la $t1 , input
	la $t1 , 0($t1)
	li $t2 , 0
LoopToEnd:
	lb $a0 , 0($t0)
	beqz $a0 , Sub
	addi $t0 , $t0 , 1
	addi $t2 , $t2 , 1
	b LoopToEnd
Sub:
	subi $t0 , $t0 , 1
	b pallindrome
pallindrome:
	beq $t2 , 1 , exit2
	subi $t0 , $t0 , 1
	lb $s0 , ($t0)
	lb $s1 , ($t1)
	bne $s0 , $s1 , exit
	addi $t1 , $t1 , 1
	subi $t2 , $t2 , 1
	b pallindrome
exit:
	li $v0 , 4
	la $a0 , result2
	syscall
	li $v0 , 10
	syscall
exit2:
	li $v0 , 4
	la $a0 , result1
	syscall
	li $v0 , 10
	syscall
