	.data
	
newline:	.asciiz 	"\n"
prompt:		.asciiz		 "enter a number"
agb:		.asciiz		 "A is greater than B"
aeb:		.asciiz		 "A is equal to B"	
alb:		.asciiz		 "A is less than B"

	.text
main:

	la 	$a0, prompt
	li 	$v0, 4
	syscall
	
		
	li	$v0, 5
	syscall
	move 	$t0, $v0
		
		
		la 	$a0, newline
		li 	$v0, 4
		syscall
	
	li 	$v0, 4
	la 	$a0, prompt
	syscall
	
	li	$v0, 5
	syscall
	move 	$t1, $v0
	
		la 	$a0, newline
		li 	$v0, 4
		syscall
	

	
	beq $t0, $t1, equal
	blt $t0, $t1, lesser
	bgt $t0, $t1, greater
	
	equal:
	
		la 	$a0, aeb
		li 	$v0, 4
		syscall
		
			li	$v0, 10
			syscall
		
	lesser:
	
		la 	$a0, alb
		li 	$v0, 4
		syscall
		
			li	$v0, 10
			syscall
		
		
	greater:
	
		la 	$a0, agb
		li 	$v0, 4
		syscall
	
	
			li	$v0, 10
			syscall
