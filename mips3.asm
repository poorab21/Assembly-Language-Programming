.data 
	msg:.asciiz"Enter Value for i:"
	msg2:.asciiz"Enter Value for j:"
	result:.asciiz"The result is "
	g:.word 8
	h:.word 3
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 5
	syscall
	
	move $t0 , $v0
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	li $v0 , 5
	syscall
	
	move $t1 , $v0 
	lw $s1 , g
	lw $s2 , h
	beq $t0 , $t1 , equal
	sub $s0 , $s1 , $s2
	b print
equal:
	add $s0 , $s1 , $s2
print:
	li $v0 , 4
	la $a0 , result
	syscall
	move $a0 , $s0 
	li $v0 , 1
	syscall