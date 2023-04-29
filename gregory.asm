	.data

prompt:	.asciiz		 "Enter number of terms: "
print:	.asciiz		 "Pi is: "
new_line:.asciiz         "\n"
sum:	.double		0.0
denom:	.double		1.0
f:	.double		0.0
one:	.double		1.0
two:	.double		2.0
four:	.double		4.0
zero:	.double		0.0
#i:	.double		0.0

	.text
main:
	la 	$a0, prompt
	li 	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	move 	$a1, $v0

	jal  gregory
	
	#la $a0, print
    	#li $v0, 4
    	#syscall
    	
    	li $v0, 3
    	move $a2, $v0
	syscall
	
		
	li $v0, 10
	syscall
	
gregory:
ldc1 $f4, denom
ldc1 $f6, sum
ldc1 $f8, two
ldc1 $f10, one
ldc1 $f16, four
ldc1 $f18, f

li, $t0, 0	#int i
li, $t1, 2	#divosor
li, $t2, 2	#reman
li, $t3, 0	#resultr
li, $t4, 0	#compare
li, $t5, 1	#fix

#add $a1, $a1, $t5


for:
div.d  $f18, $f10, $f4 #f

beqz $t0, if
div $t0, $t1
mfhi $t2


slt $t3, $zero, $t2
bnez $t3 else
if:
add.d  $f6, $f6, $f18
beq $t3, $t3, skip
else:
sub.d  $f6, $f6, $f18
skip:


add.d $f4, $f4, $f8 #denom+denom+2
mul.d $f12, $f16, $f6

add $t0, $t0, $t5	#i++

#li $v0, 3
#add.d $f12, $f12, $f6
#syscall

slt $t4, $t0, $a1
bnez  $t4, for
#bge $a1, $t0, for
jr $ra

