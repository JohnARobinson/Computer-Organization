 	.data
 

prompt:	.asciiz		 "enter your name:"
hello:	.asciiz		 "Hello "
meet:	.asciiz		 " ,pleased to meet you!\n"
name:	.word		 32

	.text

main:
	la 	$a0, prompt
	li 	$v0, 4
	syscall
	
	li	$v0, 8
	la	$a0, name
	li	$a1, 32
	syscall
	
		
	la 	$a0, hello
	li 	$v0, 4
	syscall
	
	
	la 	$a0, name
	li 	$v0, 4
	syscall
	
		
	la 	$a0, meet
	li 	$v0, 4
	syscall
	
	
	
	li $v0, 10
	syscall
