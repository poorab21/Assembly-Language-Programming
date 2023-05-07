.data
	input:.asciiz"Text has been entered"
	filename:.asciiz"coal.txt"
.text
.globl main
main:
	li $v0 , 13
	la $a0 , filename
	li $a1 , 1
	syscall
	
	move $s1 , $v0
	
	li $v0 , 15
	move $a0 , $s1
	la $a1 , input
	la $a2 , 22
	syscall
	
	li $v0 , 16
	move $a0 , $s1
	syscall
	
	li $v0 , 10
	syscall
