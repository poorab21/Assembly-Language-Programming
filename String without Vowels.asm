.data
	string:.asciiz""
	msg:.asciiz"Enter String:"
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 8
	la $a0 , string
	li $a1 , 40
	syscall
	
	la $t0 , string
	la $t0 , 0($t0)
loop:
	lb $a0 , 0($t0)
	beqz $a0 , exit
	beq $a0 , 'a' , increase
	beq $a0 , 'e' , increase
	beq $a0 , 'i' , increase
	beq $a0 , 'o' , increase
	beq $a0 , 'u' , increase
	beq $a0 , 's' , increase
	li $v0 , 11
	syscall
	addi $t0 , $t0 , 1
	b loop
increase:
	addi $t0 , $t0 , 1
	b loop
exit:
	li $v0 , 10
	syscall