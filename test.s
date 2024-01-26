





    .data

v: 	.word 1 5 8 9 7 5 3

    .text
    .globl main

main:	 
		la      $a2, v

		li      $a0, 0
		li      $a1, 2
		jal     func 
		
		
		li      $a0, 3
		li      $a1, 4
		j end


func:   
		sll     $a0, $a0, 2		 
        sll     $a1, $a1, 2          
        add     $t3, $a2, $a0       
        add     $t4, $a2, $a1   
        lw      $t1, 0($t3)
        lw      $t2, 0($t4)
        sw      $t1, 0($t4)
        sw      $t2, 0($t3)
		jr      $ra

end: 
