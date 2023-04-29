	.data
	
prompt:		.asciiz		 "enter a number"
newline:	.asciiz 	"\n"

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
	
	
	and $a0, $t1, $t0
	li $v0, 1
	syscall 

	
	la 	$a0, newline
	li 	$v0, 4
	syscall
	
	or $a0, $t1, $t0
	li $v0, 1
	syscall 
	
	la 	$a0, newline
	li 	$v0, 4
	syscall
	
	xor $a0, $t1, $t0
	li $v0, 1
	syscall 
	
	
	li $v0, 10
	syscall
	