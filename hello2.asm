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

	
	li $s0,0
findnewline:

	lb $a3,name($s0)
	addi $s0,$s0,1
	bnez $a3, findnewline
	beq $a1, $s0, end
	subiu $s0,$s0,2
	sb $0, name($s0)
	
end:	
	
	
			
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
