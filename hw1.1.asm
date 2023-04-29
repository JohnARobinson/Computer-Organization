	.data

ch:	.asciiz  	"1"
cl:	.asciiz  	"not a string"

	.text
main:
lb $t1,ch
beqz $t1, print
bnez $t1, print2
beq	
	bn
	li $v0, 10
	syscall

print:
	la 	$a0, cl
	li 	$v0, 4
	syscall
	lw 
	
	li $v0, 10
	syscall
print2:
	la 	$a0, ch
	li 	$v0, 4
	syscall
		
	
	li $v0, 10
	syscall
		