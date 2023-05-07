.text 
.globl main
main:
	li $t0, 5
	li $t1, 10
	add $v1 , $t0, $t1
	mul $s0 , $t0, $t1
	
	 sub $s1, $v1, $s0
	  li $v0, 1
	  move $a0, $s1
	  syscall
	  