	.text
# example code to use function "bar" !
main:
	li	$v0, 	5
	move	$a0, $v0
	jal	bar
	nop
		
	move 	$a0, $v0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall
# end runner.	
	
	
# the function bar!
bar:	# a0 = n
	# grow stack for local variables & saved regs
	# $sp+0 = $ra, $sp+4 = p, $sp+8 = i, 
	# $sp+12 = $s0, $sp+16 = $s1, $sp+20 = $ra
	# $sp+24 = $t0, $sp+28 = $t1
	addi	$sp, $sp, -24
	sw	$s0, 12($sp)
	sw	$s1, 16($sp)
	sw	$ra, 20($sp)
	sw	$t0, 24($sp)
	sw	$t1, 28($sp)
	
# statement 1	
	li	$s0, 1
	sw	$s0, 4($sp)
	
# loop init
	li	$s1, 0
	sw	$s1, 8($sp)
	
# loop test
loop_top:
	lw	$s1, 8($sp)
	slt	$t0, $s1, $a0
	beqz	$t0, loop_end
	nop
	
# loop body
	lw	$s1, 8($sp)
	addi	$t0, $s1, 1
	
	lw	$s0, 4($sp)
	multu	$t0, $s0
	
	mflo	$s0
	sw	$s0, 4($sp)
	
	lw	$s1, 8($sp)
	addi	$s1, $s1, 1
	sw	$s1, 8($sp)
	
	j 	loop_top
	nop
	
loop_end:
	lw	$v0, 4($sp)
	
epilog:	
	lw	$s0, 12($sp)
	lw	$s1, 16($sp)
	lw	$ra, 20($sp)
	lw	$t0, 24($sp)
	lw	$t1, 28($sp)
	addi	$sp, $sp, 24
	
	jr	$ra
	nop
	
	
	