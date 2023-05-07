.data
	filename:.asciiz"coal.txt"
	data:.space 100
.text
.globl main
main:
	li $v0 , 13
	la $a0 , filename
	la $a1 , 0
	syscall
	
	move $s0 , $v0
	
	li $v0 , 14
	move $a0 , $s0
	la $a1 , data
	la $a2 , 100
	syscall
	
	li $v0 , 4
	la $a0 , data
	syscall
	
	li $v0 , 10
	syscall