fact:
        addi $sp, $sp, -8     # adjust stack for 2 items
        sw   $ra, 4($sp)      # save return address
        sw   $a0, 0($sp)      # save argument
        slti $t0, $a0, 1      # test for n < 1
        beq  $t0, $zero, L1
        addi $v0, $zero, 1    # if so, result is 1
        addi $sp, $sp, 8      #   pop 2 items from stack
        jr   $ra              #   and return

L1:     addi $a0, $a0, -1     # else decrement n
        jal  fact             # recursive call
        lw   $a0, 0($sp)      # restore original n
        lw   $ra, 4($sp)      #   and return address
        addi $sp, $sp, 8      # pop 2 items from stack
        mul  $v0, $a0, $v0    # multiply to get result
        jr   $ra              # and return
        
main:
        li      $v0, 5
        syscall

        move    $a0, $v0
        
        ## li      $a0, 5         # address of first string x[i]

        addi    $sp, $sp, -4   # adjust stack for 1 item
        sw      $ra, 0($sp)    # save $ra
        jal     fact           # call strcpy
        lw      $ra, 0($sp)    # restore saved $ra
        addi    $sp, $sp, 4    # pop 1 item from stack
        
        move    $a0, $v0
        li      $v0, 1         # print result

        syscall                # print second string

        jr      $ra
