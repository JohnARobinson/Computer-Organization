	.data
	
newline:	.asciiz 	"\n"
prompt:		.asciiz		"enter a number"
star:		.asciiz		"*"

	.text
main:

	li 	$v0, 4
	la 	$a0, prompt
	syscall
	
		
	li	$v0, 5
	syscall
	move 	$t0, $v0
	
	li 	$v0, 4
	la 	$a0, newline
	syscall

	add $t1, $zero, $zero
top: 
	bge $t1, $t0, end
	add $s0, $s0, $t1
	addi $t1, $t1, 1
	
	
	li 	$v0, 4
	la 	$a0, star
	syscall
	
	li 	$v0, 4
	la 	$a0, newline
	syscall
	
	
	
	j top
end: 

	li $v0, 10
	syscall
		