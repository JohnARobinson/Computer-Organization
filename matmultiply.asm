#Programmed by Gregory Neibert
.data

.text
main:
	#Array A Initials
	li	$t0, 0
	li	$t1, 0
	
	#Array B Initials
	li	$t2, 0
	li	$t3, 0
	
	#Array C Initials
	li	$t4, 0
	li	$t5, 0
	
	#Rows of A
	li	$v0, 5
	Syscall
	add	$t0, $t0, $v0
	
	#Cols of A
	li	$v0, 5
	Syscall
	add	$t1, $t1, $v0
	
	#Rows of B
	li	$v0, 5
	Syscall
	add	$t2, $t2, $v0
	
	#Cols of B
	li	$v0, 5
	Syscall
	add	$t3, $t3, $v0
	
	#Final Array Spaces
	li	$t7, 4
	#Array A
	mult	$t0, $t1
	mflo	$t4
	mult	$t4, $t7
	mflo	$t4
	sub	$sp, $zero, $t4
	
	#Array B
	mult	$t2, $t3
	mflo	$t5
	mult	$t5, $t7
	mflo	$t5
	sub	$sp, $zero, $t5
	
	#Array C
	mult	$t0, $t3
	mflo	$t6
	mult	$t6, $t7
	mflo	$t6
	sub	$sp, $zero, $t6
	
	#Call to Fill Array A
	add	$a0, $zero, $sp
	div	$t4, $t7
	mflo	$a1
	jal	fill_array
	
	#Call to Fill Array B
	div	$t5, $t7
	mflo	$t8
	add	$t9, $sp, $t8
	add	$a0, $zero, $t9
	mflo	$a1
	jal	fill_array
	
	#Call to Fill Array C
	lw	$a1, 0($sp)
	
	div	$t5, $t7
	mflo	$t8
	add	$t9, $sp, $t8
	lw	$a2, 0($t9)
	
	div	$t6, $t7
	mflo	$t8
	add	$t9, $sp, $t8
	lw	$a3, 0($t9)
	
	div	$t6, $t7
	mflo	$a0
	
	li	$v0, 10
	Syscall

#Fills in Arrays A and B	
fill_array:
	
	#loop val
	li	$s1, 0
	#array value holder
	lw	$s2, 0($a0)
top:
	slt	$s3, $s1, $a1
	beqz	$s3, end
inloop:
	li	$v0, 6
	Syscall
	cvt.d.s	$f4, $f6
	swc1	$f6, 0($s2)
poloup:
	sll	$s4, $s1, 2
	add	$s3, $a0, $s4
	add	$s2, $zero, $s3
	
	addi	$s1, $s1, 1
	j	top
end:
	jr	$ra
	
#Fills in Array C using A and B
matrix_mult:
	
	
