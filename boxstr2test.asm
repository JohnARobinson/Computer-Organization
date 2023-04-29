       .data
text_prompt:       .asciiz             "Enter text: "
size_prompt:       .asciiz             "Enter size of box: "
star:              .asciiz             "*"
space:             .asciiz             " "
new_line:          .asciiz             "\n"
max_buffer_len:    .word               100
buffer:            .space              100

         .text
main:
    la $a0, text_prompt
    li $v0, 4
    syscall
    
    la $a0, buffer
    la $a1, max_buffer_len
    li $v0, 8
    syscall
    
    la $a0, size_prompt
    li $v0, 4
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0
    
    move $a0, $t1
    jal stars
    move $a0, $t0
    jal print_text
    move $a0, $t1
    jal stars
    
    j exit
    
exit:
   li $v0, 10
   syscall
   
print_text:
   move $t3, $a0 # remember input string
   
   # print star
   la $a0, star
   li $v0, 4
   syscall
   
   # print space
   la $a0, space
   li $v0, 4
   syscall
   
   # print string
   la $a0, buffer
   li $v0, 4
   syscall
   
   # print space
   la $a0, space
   li $v0, 4
   syscall
   
   # print star
   la $a0, star
   li $v0, 4
   syscall
   
   # print new line
   la $a0, new_line
   li $v0, 4
   syscall
   
   jr $ra
   
print_string:
   li $v0, 4
   syscall
   jr $ra
   
stars:
   move $t7, $a0 # int num_of_stars = <input>
   li $t6, 0   # int i = 0;
   print_stars:
       la $a0, star
       li $v0, 4
       syscall
       addi $t6, $t6, 1 # i++
       blt $t6, $t7, print_stars
   la $a0, new_line
   li $v0, 4
   syscall
   jr $ra
   
print_star:
   la $a0, star # load star character
   li $v0, 4    # tell system to print it
   syscall      # actually print it
   jr $ra       # go back to where print_star was called   