	.data
	
prompt:		.asciiz		"enter a number 1-10"
newline:	.asciiz 	"\n"
array:		.word		1001 1002 1003 1004 1005 1006 1007 1008 1009 1010


	.text
main:
	la 	$a0, prompt
	li 	$v0, 4
	syscall
	
		
	li	$v0, 5
	syscall
	move 	$t0, $v0
	
	sub 	$t0, $t0, 1
	
	lw 	$t1, 0($t0)
	li	$v0, 1
	#addi $t0, $t0, 0
	#li 	$v0, 1
	#syscall
	
	li	$v0, 10
	syscall
