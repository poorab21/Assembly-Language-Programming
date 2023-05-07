.data
	msg:.asciiz"Enter Number:"
	result:.asciiz"MSD = "
.text
.globl main
main:
	li $v0 , 4
	la $a0 , msg
	syscall
	li $v0 , 5
	syscall
	move $t0 , $v0
	li $t1 , 10
	jal MSD
	li $v0 , 4
	la $a0 , result
	syscall
	li $v0 , 1
	move $a0 , $v1
	syscall
	li $v0 , 10
	syscall
MSD:
	div $t0 , $t1
	mflo $s0
	ble $s0 , 0 , exit
	move $v1 , $s0
	move $t0 , $s0
	b MSD
exit:
	jr $ra