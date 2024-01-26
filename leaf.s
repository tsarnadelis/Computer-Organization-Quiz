	.text 

leaf:
	addi $sp,$sp,-4
	sw $s0,0($sp)
	add $t0,$a0,$a1
	add $t1,$a2,$a3
	sub $s0,$t0,$t1
	add $v0,$s0,$zero
	lw $s0,0($sp)
	addi $sp,$sp,4
	jr $ra
	
main:
	li $a0,2
	li $a1,3
	li $a2,4
	li $a3,5
	
	addi $sp,$sp, -4
	sw $ra,0($sp)
	jal leaf
	
	lw $ra,0($sp)
	addi $sp,$sp,4
	
	move $a0,$v0
	li $v0,1
	syscall
	
	jr $ra