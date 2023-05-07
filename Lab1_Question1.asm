.text
.globl main
main:
	li $t0, 18
	li $t1, 116
	add $v1, $t0, $t1
	
	li $t2, 15
	li $t3, 2
	mul $v0, $t2, $t3
	
	mul $s0, $v0 , 5
	
	add $s1, $s0, $v1
	li $v0, 1
	move $a0, $s1
	syscall
	