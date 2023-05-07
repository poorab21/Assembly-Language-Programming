.data
	msg:.asciiz"Enter Number:"
	newline:.asciiz"\n"
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t0 , $v0
	
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t1 , $v0
	
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t2 , $v0
	li $t3 , 0
	li $t4 , 0
	li $t5 , 0
loop:
	bge $t0 , $t1 , loop2
	b loop4
loop2:
	bge $t0 , $t2 , loop6
	b loop3
loop6:
	bge $t1 , $t2 , assign3
	move $t3 , $t0
	move $t4 , $t2
	move $t5 , $t1
	b exit
assign3:
	move $t3 , $t0
	move $t4 , $t1
	move $t5 , $t2
	b exit
loop3:
	move $t3 , $t2
	move $t4 , $t0
	move $t5 , $t1
	b exit
loop4:
	bge $t1 , $t2 , loop5
	b loop7
loop5:
	bge $t2 , $t0 , assign2
	move $t3 , $t1
	move $t4 , $t0
	move $t5 , $t2
	b exit
assign2:
	move $t3 , $t1
	move $t4 , $t2
	move $t5 , $t0
	b exit
loop7:	
	move $t3 , $t2
	move $t4 , $t1
	move $t5 , $t0
	b exit
exit:
	li $v0 , 1
	move $a0 , $t3
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	li $v0 , 1
	move $a0 , $t4
	syscall
	li $v0 , 4
	la $a0 , newline
	syscall
	li $v0 , 1
	move $a0 , $t5
	syscall
	li $v0 , 10
	syscall