main:
	addi $t0, $zero, 5
loop:
	beq $t1, $t0, exit
	jal loop2
	jal loop3
	bne $t0, $t0, exit
	addi $t1, $t1, 1
	j loop
loop2:
	addi $a0, $a0, 1
	jr $ra
loop3:
	addi $a1, $a1, 1
	jr $ra
exit:
	halt
