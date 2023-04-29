 	.data

prompt:	.asciiz		 "enter number of terms:"
print:	.asciiz		 "Pi is:"


	.text
main:
	la 	$a0, prompt
	li 	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move 	$a1, $v0
	
	li $v0, 10
	syscall
	