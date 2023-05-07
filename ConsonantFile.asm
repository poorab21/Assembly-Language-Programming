.data
	string2:.space 256
	string:.space 256
	filename:.asciiz"coal.txt"
	msg:.asciiz"Enter String:"
.text
.globl main
main:
	li $v0 , 13
	la $a0 , filename
	li $a1 , 1
	syscall
	move $s0 , $v0
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 8
	la $a0 , string
	li $a1 , 256
	syscall
	la $t0 , string
	la $t0 , 0($t0)
	la $t1 , string2
	la $t1 , 0($t1)
loop:
	lb $a0 , ($t0)
	beqz $a0 , exit
	beq $a0 , 'a' , continue
	beq $a0 , 'e' , continue
	beq $a0 , 'i' , continue
	beq $a0 , 'o' , continue
	beq $a0 , 'u' , continue
	beq $a0 , 's' , continue
	sb $a0 , ($t1)
	addi $t1 , $t1 , 1
	addi $t0 , $t0 , 1
	b loop
continue:
	addi $t0 , $t0 , 1
	b loop
exit:
	li $v0 , 15
	move $a0 , $s0
	la $a1 , string2
	la $a2 , 256
	syscall
	li $v0 , 16
	move $a0 , $s0
	syscall
	li $v0 , 10
	syscall