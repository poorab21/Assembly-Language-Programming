.data
	array:.space 32
.text
.globl main
main:
	la $t0 , array
	la $t1 , 'D'
	sw $t1 , ($t0)
	la $t1 , 'H'
	sw $t1 , 4($t0)
	la $t1 , 'A'
	sw $t1 , 8($t0)
	la $t1 , ' '
	sw $t1 , 12($t0)
	la $t1 , 'S'
	sw $t1 , 16($t0)
	la $t1 , 'u'
	sw $t1 , 20($t0)
	la $t1 , 'f'
	sw $t1 , 24($t0)
	la $t1 , 'f'
	sw $t1 , 28($t0)
	la $t1 , 'a'
	sw $t1 , 32($t0)
	li $t1 , 9
	la $t0 , 32($t0)
loop:
	blt $t1 , 0 , exit
	li $v0 , 4
	la $a0 , ($t0)
	syscall
	subi $t0 , $t0 , 4
	subi $t1 , $t1 , 1
	b loop
exit:
	li $v0 , 10
	syscall
