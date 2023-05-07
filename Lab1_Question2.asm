.text
.globl main
main:
	li $t0, 32
	li $t1, 52
	mul $v0, $t0, $t1
	
	li $t2, 58
	li $t3, 3
	sub $v1, $t2, $t3
	
	add $s0, $v0, $v1
	
	mul $s1, $s0, 50
	
	li $v0, 1
	move $a0, $s1
	syscall
	