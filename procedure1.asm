.data
	msg:.asciiz"Enter Number:"
	msg2:.asciiz"Enter Number:"
	result1:.asciiz"Sum = "
	result2:.asciiz"\nProduct = "
	result3:.asciiz"\nDifference = "
	result4:.asciiz"\nQuotient = "
	result5:.asciiz"\nRemainder = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 5
	syscall
	move $a1 , $v0
	
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	li $v0 , 5
	syscall
	move $a2 , $v0
	
	jal sum
	li $v0 , 4
	la $a0 , result1
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	
	jal product
	li $v0 , 4
	la $a0 , result2
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	
	jal difference
	li $v0 , 4
	la $a0 , result3
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	
	jal quotient
	li $v0 , 4
	la $a0 , result4
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	
	jal remainder
	li $v0 , 4
	la $a0 , result5
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	
	li $v0 , 10
	syscall
sum:
	add $v1 , $a1 , $a2
	jr $ra
product:
	mul $v1 , $a1 , $a2
	jr $ra
difference:
	sub $v1 , $a1 , $a2
	jr $ra
quotient:
	div $a1 , $a2
	mflo $v1
	jr $ra
remainder:
	div $a1 , $a2
	mfhi $v1
	jr $ra