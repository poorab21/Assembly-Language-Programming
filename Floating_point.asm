.data
	array:.float 24.0, 87.0 ,34.0 ,23.0 ,42.0 ,67.0 ,76.0 ,12.0 ,92.0 , 85.0
	target:.float 10.0
	start:.float 1.0
	zero:.float 0.0
.text
.globl main
main:
	la $t1 , array
	la $t1 , 0($t1)
	l.s $f4 , target
	l.s $f5 , start
	l.s $f6 , start
	l.s $f7 , zero
loop:
	l.s $f8 , ($t1)
	add.s $f7 , $f7 , $f8
	addi $t1 , $t1 , 4
	add.s $f6 , $f6 , $f5
	c.le.s $f6 , $f4 
	bc1t loop
	
	div.s $f9 , $f7 , $f4
	li $v0 , 2
	mov.s $f12 , $f9
	syscall
	li $v0 , 10
	syscall
	