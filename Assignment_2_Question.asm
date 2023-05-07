.data
	array:.space 256
	msg:.asciiz"Please Enter some whole numbers.to End Loop ,Insert a zero value\n"
	input:.asciiz"Number:"
	sum:.asciiz"The sum of the numbers is "
	largest:.asciiz"\nThe largest number is "
	smallest:.asciiz"\nThe smallest number is "
	average:.asciiz"\nthe Average of the numbers is "
	newline:.asciiz"\n"
.text
.globl main
main:
	li $v0 , 4    #generate string
	la $a0 , msg
	syscall
	li $t1 , 0
	li $t2 , 0
	li $t3 , 0
	la $t4 , array
	la $t5 , array
	la $t5 , 0($t5)
loop:
	li $v0 , 4
	la $a0 , input
	syscall
	li $v0 , 5           #loop for entering numbers till zero value is inserted
	syscall
	move $t0 , $v0         
	beqz $t0 , BeforeSmallest #if number=0 then move to other function
	sw $v0 , ($t4)     #storing number value in array
	addi $t4 , $t4 , 4   #increment in $t4
	bgt $t0 , $t2 , change  #checks if value in t0 i greater than the current greatest value and if so then copies the values
	add $t1 , $t1 , $t0   #calculate sum of all numbers into $t1
	addi $t3 , $t3 , 1
	b loop
BeforeSmallest:
	lw $t6 , 0($t5)        
	addi $t5 , $t5 , 4
	b Smallest_Determine   
Smallest_Determine:
	lw $a0 , ($t5)    #checking and comparing of the numbers from input for smallest number
	beqz $a0 , exit              
	bgt $t6 , $a0 , small   
	addi $t5 , $t5 , 4
	b Smallest_Determine
small:
	lw $t6 , ($t5)
	addi $t5 , $t5 , 4
	b Smallest_Determine
change:
	move $t2 , $t0     #t2 = the current largest value
	add $t1 , $t1 , $t0
	addi $t3 , $t3 , 1
	b loop
exit:
	div $t1 , $t3  #printing of the answers
	mflo $s0
	mfhi $s1
	li $v0 , 4
	la $a0 , sum
	syscall
	li $v0 , 1
	move $a0 , $t1
	syscall
	li $v0 , 4
	la $a0 , largest
	syscall
	li $v0 , 1
	move $a0 , $t2
	syscall
	li $v0  , 4
	la $a0  , smallest
	syscall
	li $v0 , 1
	move $a0 , $t6
	syscall
	li $v0 , 4
	la $a0 , average
	syscall
	li $v0 , 1
	move $a0 , $s0
	syscall
	li $v0 , 10
	syscall
