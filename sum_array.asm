	.data
prompt:		.asciiz "Enter the number of elements, up to 20: "
label:		.asciiz "Enter the numbers into the array: "
total:		.asciiz "Total: "
nL:		.asciiz "\n"
	.text
main:
	li $t1, 0
	li $t0, 0
	addi $sp, $sp, -84
loop:
	slt $s4, $t0, $zero
	slti $s5, $t0, 20
	bnez $s4, body
	beqz $t0, body
	bnez $s5, stop
body:	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	j loop
stop:
	addi $t4, $sp, 0
while:	beq $t1, $t0, end
	li $v0, 6
	syscall
	s.s $f0, ($t4)
	
	addi $t1, $t1, 1
	addi $t4, $t4, 4
	j while
	
end:	
	addi $a0, $sp, 0
	addi $a1, $t0, 0
	jal sum_array
	
	addi $sp, $sp, 84
	la $a0, total
	li $v0, 4
	syscall
	li $v0, 2
	mov.s $f12, $f2
	syscall
	la $a0, nL
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	
sum_array:
	li $t1, 0
for:
	beq $t1, $a1, fin
	l.s $f1, ($a0)
	
	add.s $f2, $f2, $f1
	
	addi $a0, $a0, 4
	addi $t1, $t1, 1
	j for
fin:
	jr $ra
	