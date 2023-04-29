.data
array:    .word    1, 2, 3, 4, 5# Establish array
prompt: .asciiz                    "Enter a number between 1 and 10:"


main:
add $t0, $zer0, $zero #<---int i =0
li $t1, $zero
loop:
bge $t0,  5, end
sw $t1, 0($t0)
addi $t1, array, 4 
addi $t0, $t0, 1 #<--- 
j loop

end:
    lw     $t2, array($t1)    # get the value from the array cell
    move    $a0, $t2
    li    $v0, 1 
    
        li      $v0, 10
        syscall

