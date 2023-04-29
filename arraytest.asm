.data
array:    .word    1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010 # Establish array
prompt: .asciiz                    "Enter a number between 1 and 10:"

    .text
main:
# Setup a system call to print the prompt
    la    $a0, prompt
    li    $v0, 4            #Print string
    syscall

    li    $v0, 5            #Read Integer
    syscall
    move    $t0, $v0
    Sub     $t0, $t0, 1     #Subtract 1 so we get the right number for index
    sll     $t1, $t0, 2     # multiply it by 2 to make t1 a multiple of 4. 

    lw     $t1, array($t1)    # get the value from the array cell
    move    $a0, $t1
    li    $v0, 1        #Print value
    syscall
Exit:
        li      $v0, 10
        syscall