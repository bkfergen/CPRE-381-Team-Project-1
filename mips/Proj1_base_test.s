	addi $s0, $s1, 4
	add  $s2, $s0, $zero
	addu $s3, $s2, $s0
	addiu $s4, $s2, 2
	and  $s5, $s4, $s2
	andi $s5, $s5, 0x00000000
	lui $a0, 4096
	sw $a0, 0($a0)
	lw $a0 , 0($a0)
	nor $t0, $s4, $zero
	xor $t1, $s4, $s2
	xori $t2, $t1, 0x0F0F0F0F
	or $t3, $zero, $t2
	ori $t4, $zero, 0xFFFFFFFF
	slt $at, $s2, $s4
	slti $s0, $s2, 0x00000F00
	sll $t5, $s4, 7
	srl $t5, $t5, 7
	sra $t4, $t4, 9
	sub $s2, $s2, $s3
	subu $s2, $s2, $s3
	repl.qb $t7, 0x0000000F
	halt
