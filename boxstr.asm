	.data
	
newline:	.asciiz 	"\n"
prompt:		.asciiz		"Enter text: "
prompt2:	.asciiz	 	"Enter size of box: "
star:		.asciiz		"*"
space:		.asciiz		" "
name:		.word		 32

	.text
main:
	
	li 	$v0, 4
	la 	$a0, prompt	#string
	syscall
	
	li	$v0, 8
	la	$a0, name
	li	$a1, 32
	syscall
	
	li 	$v0, 4
	la 	$a0, newline
	syscall

	

	li 	$v0, 4
	la 	$a0, prompt2
	syscall
	
		
	li	$v0, 5
	syscall
	move 	$t0, $v0	#size of box
	
	li 	$v0, 4
	la 	$a0, newline
	syscall

	subi $t0, $t0, 1
	li $t1, 0
	li $t4, 0
	addi $t0, $t0, 0

	jal   stars
	
	li 	$v0, 4
	la 	$a0, newline
	syscall
	jal findnewline
	jal innerbox
	
	li 	$v0, 4
	la 	$a0, newline
	syscall
	
	li $t1, 0
	li $t4, 0
	jal stars
	jal end

stars: 

	add $t4, $t4, 1
	beq $t4, 1, stars
	li 	$v0, 4
	la 	$a0, star
	syscall
	

	addi $t1, $t1, 1
	ble $t1, $t0, stars


	jr $ra
findnewline:

	lb $a3,name($s0)
	addi $s0,$s0,1
	bnez $a3, findnewline
	beq $a1, $s0, end
	subiu $s0,$s0,2
	sb $0, name($s0)
	
	jr $ra



innerbox:

	li 	$v0, 4
	la 	$a0, star
	syscall

	
	li 	$v0, 4
	la 	$a0, space
	syscall
	
	li 	$v0, 4
	la 	$a0, name
	syscall

	li 	$v0, 4
	la 	$a0, space
	syscall
	
	li 	$v0, 4
	la 	$a0, star
	syscall
	
	jr $ra  
	
#strlength:
	#li $t3
#strlengthloop:
	#lb $t1, 0($a0)
	#beqz $t1, exitloop
	#add$a0
	
#exitloop:
	#jr $ra
	

end: 

	li $v0, 10
	syscall
