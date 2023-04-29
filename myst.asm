	.text
# example code to use function "bar" !
main:
	li	$v0, 	5
	move	$a0, $v0

	li	$s0, 1
	sw	$s0, 4($sp)

	li	$s1, 0
	sw	$s1, 8($sp)
	
	jal	loop_top
	move 	$a0, $v0
	li	$v0, 1
	syscall
	li	$v0, 10
	syscall
loop_top:
	lw	$s1, 8($sp)
	slt	$t0, $s1, $a0
	beqz	$t0, loop_end

	
# loop body
	addi	$t0, $s1, 1	
	lw	$s0, 4($sp)
	multu	$t0, $s0	
	mflo	$s0
	sw	$s0, 4($sp)
	addi	$s1, $s1, 1
	sw	$s1, 8($sp)	
	j 	loop_top

loop_end:
	lw	$v0, 4($sp)
	
epilog:	
	jr	$ra

	
	
	
