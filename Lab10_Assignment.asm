.data
	input:.space 100
	filename:.asciiz"coal.txt"
	newline:.asciiz"\n"
	msg:.asciiz"Enter List:"
	Sub:.space 100
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 8
	la $a0 , input
	li $a1 , 100
	syscall
	
	li $v0 , 13
	la $a0 , filename
	li $a1 , 1
	syscall
	move $s0 , $v0
	la $t0 , input
	la $t0 , ($t0)
	la $t2 , Sub
	la $t2 , ($t2)
loop:
	lb $t1 , ($t0)
	beqz $t1 , exit
	beq $t1 , ';' , New_Line
	beq $t1 , '.' , exit
	sb $t1 , ($t2)
	addi $t2 , $t2 , 1
	addi $t0 , $t0 , 1
	b loop
New_Line:
	la $t3 , newline
	lb $t5 , ($t3)
	sb $t5 , ($t2)
	addi $t2 , $t2 , 1
	addi $t0 , $t0 , 1
	b loop
exit:
	li $v0 , 15
	move $a0 , $s0
	la $a1 , Sub
	la $a2 , 100
	syscall
	li $v0 , 16
	move $a0 , $v0
	syscall
	li $v0 , 10
	syscall