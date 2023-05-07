.data
	array:.space 90
	input:.asciiz"Enter String:"
	msg:.asciiz"String["
	msg2:.asciiz"] = "
.text
.globl main
main:
	la $t0 , array
	li $v0 , 4
	la $a0 , input
	syscall
	
	li $v0 , 8
	la $a0 , ($t0)
	li $a1 , 15
	syscall
	
	li $v0 , 4
	la $a0 , input
	syscall
	
	li $v0 , 8
	la $a0 , 15($t0)
	li $a1 , 15
	syscall
	
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 1
	li $t1 , 0
	move $a0 , $t1
	syscall 
	li $v0 , 4
	la $a0 , msg2
	syscall
	
	li $v0 , 4
	la $a0 , ($t0)
	syscall
	
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 1
	li $t1 , 1
	move $a0 , $t1
	syscall
	li $v0 , 4
	la $a0 , msg2
	syscall 
	
	li $v0 , 4
	la $a0 , 15($t0)
	syscall
	
	