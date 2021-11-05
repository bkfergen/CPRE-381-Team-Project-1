# bubble sort

	.data
Arr:		.word 		4,3,5,1,2

	.text
	.global  main
main:
   ori	$t1, $zero, 0x0005    #load 5 into $t1

mainloop:
   addi $a1, $t1, -1 	      #decrement $t1 and store in $a1
   slt $at, $a1, $zero
   beq  $zero, $a1, maindone  #if $a1 is equal to zero jump to end

   lui $at, 4097	      # la pseudoinstruction that loads the Arr address into $a0
   ori $a0, $at, 16

   ori $t2, $zero, $zero      #load zero into $t3

   jal passloop		      #jump to passloop

   beq $zero, $t2, maindone   #if there was no swaps we are done(jump to end)

   addi $t1,$t1,-1            #decrement $t1
   beq $zero, $zero, mainloop #unconditional jump back to mainloop

   j end		      #jump to end

passloop:
   lw  $s1, 0($a0)            #load Arr[i] into $s1
   lw  $s2, 4($a0)	      #load Arr[i+1] onto $s2
   slt $at, $s1, $s2 	      #if $s1 is less than $s2 set $at to 1 otherwise 0
   bne $at, $zero, passswap   #branch if $at is not equal to $zero

passnext:
   addiu $a0, $a0, 4	      #iterate array pointer
   addiu $a1, $a1, -1         #decrement number of loops 

   slt $at, $a1, $zero	      #if $a1 is less than 0 set $at 
   beq $at, $zero, passloop   #if $at is equal to 0 loop

   jr $ra		      #jump to return address	
   
passswap:
   sw $s1, 4($a0)	      #store Arr[i+1] in address loaded in $s1
   sw $s2, 0($a0)	      #store Arr[i] in address loaded in $s2
   ori $t2, $zero, 1 	      #tell main we did a swap
   j passnext		      #goto pass next

maindone:
   j end

end:
