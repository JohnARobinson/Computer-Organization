	.data

prompt:		.asciiz		 "enter a number"

	.text
main:

	li 	$v0, 4
	la 	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	move 	$t0, $v0

	
	li 	$v0, 4
	la 	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	move 	$t1, $v0

	
	add $a0, $t0, $t1
	
	li $v0, 1
	syscall 
	
	li $v0, 10
	syscall
	
