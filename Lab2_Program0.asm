.data 
	english1:.asciiz"Enter English Marks\n"
	marks1:.word 0
	maths1:.asciiz"Enter Maths Marks\n"
	marks2:.word 0
	maths2:.asciiz"\nMaths = "
	english2:.asciiz"\nEnglish = " 
	physics1:.asciiz"Enter Physics Marks\n"
	marks3:.word 0
	physics2:.asciiz"\nPhysics = "
	chemistry1:.asciiz"Enter Chemistry Marks\n"
	marks4:.word 0
	chemistry2:.asciiz"\nChemistry = "
	total1:.asciiz"\nTotal(out of 800) = "
	total2:.asciiz"\nTotal(out of 400) = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , english1
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0,marks1
	lw $t1,marks1
	move $s0 , $t1
	
	li $v0 , 4
	la $a0 , maths1
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , marks2
	lw $t2 , marks2
	move $s1 , $t2
	
	li $v0 , 4
	la $a0 , physics1
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , marks3
	lw $t3 , marks3
	move $s2 , $t3 
	
	li $v0 , 4
	la $a0 ,chemistry1
	syscall
	
	li $v0 , 5
	syscall
	
	sw $v0 , marks4
	lw $t4 , marks4
	move $s3 , $t4 
	
	li $v0 , 4
	la $a0 , english2
	syscall
	
	mul $s0 , $s0 , 2
	move $a0 , $s0
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , maths2
	syscall
	
	mul $s1 , $s1 , 2
	move $a0 , $s1
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , physics2
	syscall
	
	mul $s2 , $s2 , 2
	move $a0 , $s2
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , chemistry2
	syscall
	
	mul $s3 , $s3 , 2
	move $a0 , $s3
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , total1
	syscall
	
	move $v1 , $s0
	add $v1 , $v1 , $s1
	add $v1 , $v1 , $s2
	add $v1 , $v1 , $s3
	move $a0 , $v1
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , total2
	syscall
	
	move $t5 , $t1
	add $t5 , $t5 , $t2
	add $t5 , $t5 , $t3
	add $t5 , $t5 , $t4
	move $a0 , $t5
	li $v0 , 1
	syscall