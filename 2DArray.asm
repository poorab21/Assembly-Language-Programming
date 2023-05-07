.data
	array:.word 10,20,30,40
	      .word 50,60,70,80
	      .word 90,100,110,120
	      .word 130,140,150,160
.text
.globl main
main:
	la $s0 , array
	la $s0 , 0($s0)
	li $t0 , 4
	
	li $t1 , 2
	li $t2 , 1
	
	li $t3 , 4
	mul $t4 , $t1 , $t0
	add $t4 , $t4 , $t2
	mul $t4 , $t4 , $t3
	add $s0 , $s0 , $t4
	lw $s1 , ($s0)
	li $v0 , 1
	move $a0 , $s1
	syscall
	li $v0 , 10
	syscall
	
	      