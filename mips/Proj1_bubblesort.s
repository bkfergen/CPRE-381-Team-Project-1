# bubble sort
x
	.data
Arr:		.word 		4,3,5,1,2

	.text
	.global  main
main:
   ori	$t1, $zero, 0x0005
   ori  $t0, $zero, $zero
mainloop:
   addi $t2, $t0, 1
   beq  $t2, $t1, maindone

   lui $at, 4097
   ori $a0, $at, 16

   ori $t3, $zero, $zero

   jal passloop


passloop:
   lw  $s1, 0($a0)
   lw  $s2, 4($a0)
   slt $at, $s1, s2
   bne $at, $zero, passswap

passnext:
   addiu $a0, $a0, 4
   addiu $t0, $t0, 1
   slt $at, $zero, $t0
   
passswap:
   sw $s1, 4($a0)
   sw $s0, 0($a0)
   ori $t3, $zero, 1 
   j passnext
maindone:
   j end
