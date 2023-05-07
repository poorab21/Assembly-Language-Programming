.data
	start:.float 0.0
	size:.float 0.0
	array:.space 200
	msg:.asciiz"Enter Size:"
	msg2:.asciiz"Enter Value:"
	number:.float 1.0
	newline:.asciiz"\n"
	sum:.asciiz"\nSum = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 6
	syscall
	la $t0 , array
	la $t0 , ($t0)
	la $t1 , array
	la $t1 , 0($t1)
	s.s $f0 , size
	l.s $f4 , size
	l.s $f5 , start
	l.s $f6 , number
	l.s $f7 , start
	l.s $f9 , start
	la $t2 , array
	la $t2 , 0($t2)
loop:
	c.lt.s $f5 , $f4
	bc1f convert
	li $v0 , 4
	la $a0 , msg2
	syscall
	li $v0 , 6
	syscall
	s.s $f0 , ($t0)
	addi $t0 , $t0 , 4
	add.s $f5 , $f5 , $f6
	b loop
convert:
	c.lt.s $f7 , $f4
	bc1f traverse
	l.s $f10 , ($t1)
	cvt.w.s $f10 , $f10
	mfc1 $t7 , $f10
	sw $t7 , ($t1)
	addi $t1 , $t1 , 4
	add.s $f7 , $f7 , $f6 
	b convert
traverse:
	c.lt.s $f9 , $f4
	bc1f exit
	li $v0 , 1
	lw $a0 , ($t2)
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	addi $t2 , $t2 , 4
	add.s $f9 , $f9 , $f6
	b traverse
exit:
	li $v0 , 10
	syscall