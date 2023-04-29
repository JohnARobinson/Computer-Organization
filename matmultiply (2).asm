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
	#Array A
	mult	$t0, $t1
	add	$sp, $sp, 4
	#Call to Fill Array A
	mflo	$a0
	jal	fill_array
	#Array B
	mult	$t2, $t3
	#Call to Fill Array B
	mflo	$a0
	jal	fill_array
	#Call to Fill Array C
	add	$a0, $t0, $zero
	add	$a1, $t1, $zero
	add	$a2, $t2, $zero
	add	$a3, $t3, $zero
	jal	matrix_mult
	
	li	$v0, 10
	Syscall

#Fills in Arrays A and B	
fill_array:
	#loop val
	li	$s1, 0
top:
	slt	$s3, $s1, $a0
	beqz	$s3, end
inloop:
	li	$v0, 6
	Syscall
	swc1	$f0, 0($sp)
poloup:
	add	$sp, $sp, 4
	addi	$s1, $s1, 1
	j	top
end:
	jr	$ra
	
#Fills in Array C using A and B
matrix_mult:
	li	$t1, 0
	li	$t2, 0
	li	$t3, 0
	
	add	$t9, $zero, $a0
	la	$s3, 0x7ffff000
	la	$s4, 0($s3)
	
	mult	$a0, $a1
	mflo	$s5
	li	$s6, 4
	mult	$s5, $s6
	mflo	$s5
	add	$s4, $s4, $s5	#$s4 contains start of B column
	
	la	$s7, 0($s4)	#Contains the current B Val
	
	mult	$s6, $a3
	mflo	$s6		#Number to shift $s7 by
	
	sub	$s3, $s3, $s6
	addi	$s3, $s3, -4
	top_out:
		li	$t2, 0
		add	$s3, $s3, $s6
		addi	$s3, $s3, 4
		add	$a0, $zero, $t9
		slt	$s5, $t1, $a0
		beqz	$s5, finisher
		B_Col_Num:
			li	$t3, 0
			slt	$s5, $t2, $a3
			beqz	$s5, top_out_end
			top_in:
				slt	$s5, $t3, $a1
				beqz	$s5, adder
				main_loop:
					#Get the Value of A pos
					lwc1	$f1, 0($s3)
					#Get the Value of B pos
					lwc1	$f3, 0($s7)
					mul.s	$f1, $f1, $f3			
					swc1	$f1, 0($sp)
				poloupinner:
					addi	$sp, $sp, 4
					addi	$t3, $t3, 1
					addi	$s3, $s3, 4
					add	$s7, $s7, $s6
					j	top_in			
				adder: 
					addi	$sp, $sp, -4
					li	$t4, 1
				adder_top:
					slt	$s5, $t4, $a1
					beqz	$s5, B_Col_End
					lwc1	$f1, 0($sp)
					lwc1	$f3, -4($sp)
					addi	$sp, $sp, -4
					add.s	$f1, $f1, $f3
					swc1	$f1, 0($sp)
					addi	$t4, $t4, 1
					j	adder_top
				
			B_Col_End:
				lwc1	$f12, 0($sp)
				li	$v0, 2
				Syscall
				la	$a0, ' '
				li	$v0, 11
				Syscall
				la	$s7, 0($s4)
				addi	$s7, $s7, 4
				sub	$s3, $s3, $s6
				addi	$s3, $s3, -4
				
				addi	$t2, $t2, 1
				j	B_Col_Num
		top_out_end:
		addi	$t1, $t1, 1
		la	$s7, 0($s4)
		j	top_out
	finisher: 
		jr	$ra