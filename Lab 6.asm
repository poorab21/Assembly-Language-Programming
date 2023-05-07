.data
	input:.space 256
	msg:.asciiz"Enter String:"
	num:.word 0
	lengthA:.asciiz"a occurs "
	lengthE:.asciiz"e occurs "
	lengthI:.asciiz"i occurs "
	lengthO:.asciiz"o occurs "
	lengthU:.asciiz"u occurs "
	lengthS:.asciiz"s occurs "
	times:.asciiz" time\n"
	string:.asciiz"String without Vowels = "
	string2:.asciiz"String with Vowels = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	
	li $v0 , 8
	la $a0 , input
	li $a1 , 40
	syscall
	
	la $t0 , input
	la $t0 , 0($t0)
	la $t1 , input
	la $t1 , 0($t1)
	la $s0 , input
	la $s0 , 0($s0)
	li $t2 , 0
	li $t3 , 0
	li $t4 , 0
	li $t5 , 0
	li $t6 , 0
	li $t7 , 0
loop2:
	lb $a0 , 0($t0)
	beqz $a0 , print
	beq $a0 , 'a' , A
	beq $a0 , 'e' , E
	beq $a0 , 'i' , I
	beq $a0 , 'o' , O
	beq $a0 , 'u' , U
	beq $a0 , 's' , S
	addi $t0 , $t0 , 1
	b loop2
A:
	addi $t2 , $t2 , 1
	addi $t0 , $t0 , 1
	b loop2
E:
	addi $t3 , $t3 , 1
	addi $t0 , $t0 , 1
	b loop2
I:
	addi $t4 , $t4 , 1
	addi $t0 , $t0 , 1
	b loop2
O:
	addi $t5 , $t5 , 1
	addi $t0 , $t0 , 1
	b loop2
U:
	addi $t6 , $t6 , 1
	addi $t0 , $t0 , 1
	b loop2
S:
	addi $t7 , $t7 , 1
	addi $t0 , $t0 , 1
	b loop2
print:
	li $v0 , 4
	la $a0 , lengthA
	syscall
	li $v0 , 1
	move $a0 , $t2
	syscall
	li $v0 , 4
	la $a0 , times
	syscall
	
	li $v0 , 4
	la $a0 , lengthE
	syscall
	li $v0 , 1
	move $a0 , $t3
	syscall
	li $v0 , 4
	la $a0 , times
	syscall
	
	li $v0 , 4
	la $a0 , lengthI
	syscall
	li $v0 , 1
	move $a0 , $t4
	syscall
	li $v0 , 4
	la $a0 , times
	syscall
	
	li $v0 , 4
	la $a0 , lengthO
	syscall
	li $v0 , 1
	move $a0 , $t5
	syscall
	li $v0 , 4
	la $a0 , times
	syscall
	
	li $v0 , 4
	la $a0 , lengthU
	syscall
	li $v0 , 1
	move $a0 , $t6
	syscall
	li $v0 , 4
	la $a0 , times
	syscall
	
	li $v0 , 4
	la $a0 , lengthS
	syscall
	li $v0 , 1
	move $a0 , $t7
	syscall
	li $v0 , 4
	la $a0 , times
	syscall
	b String
String:
	li $v0 , 4
	la $a0 , string
	syscall
	b withoutVowels
withoutVowels:
	lb $a0 , 0($t1)
	beqz $a0 , String2
	beq $a0 , 'a' , increase
	beq $a0 , 'e' , increase
	beq $a0 , 'i' , increase
	beq $a0 , 'o' , increase
	beq $a0 , 'u' , increase
	beq $a0 , 's' , increase
	li $v0 , 11
	syscall
	addi $t1 , $t1 , 1
	b withoutVowels
increase:
	addi $t1 , $t1 , 1
	b withoutVowels
String2:
	li $v0 , 4
	la $a0 , string2
	syscall
	b withVowels
withVowels:
	lb $a0 , 0($s0)
	beqz $a0 , exit
	beq $a0 , 'a' , show
	beq $a0 , 'e' , show
	beq $a0 , 'i' , show
	beq $a0 , 'o' , show
	beq $a0 , 'u' , show
	beq $a0 , 's' , show
	addi $s0 , $s0 , 1
	b withVowels 
show:
	li $v0 , 11
	syscall
	addi $s0 , $s0 , 1
	b withVowels
exit:
	li $v0 , 10
	syscall
