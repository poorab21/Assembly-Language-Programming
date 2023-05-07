.data
	array:.float 24.0, 87.0 ,34.0 ,23.0 ,42.0 ,67.0 ,76.0 ,12.0 ,92.0 , 85.0
	target:.float 10.0
	start:.float 1.0
	zero:.float 0.0
	newline:.asciiz"\n"
.text
.globl main
main:
	la $t1 , array
	la $t1 , 0($t1)
	l.s $f4 , target
	l.s $f5 , start
	l.s $f6 , start
	l.s $f7 , zero
	li $t0 , 0
loop:
	lw $a0 , ($t1)
	beqz $a0 , exit
	li $v0 , 1
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t1 , $t1 , 4
	b loop
exit:	
	li $v0 , 10
	syscall
	
