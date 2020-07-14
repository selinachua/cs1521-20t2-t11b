# Recursive maximum of array function

# version with a frame pointer

# Register usage:
#   - `a' is in $s0
#   - `a[0]' is in $s1
#   - `length' is in $s2
#   - `max_so_far' is in $t0

max:
	# prologue
	sw    	$fp, -4($sp)
	la    	$fp, -4($sp)
	sw    	$ra, -8($sp)
	sw    	$s0, -12($sp)
	sw    	$s1, -16($sp)
	sw    	$s2, -20($sp)
	addi  	$sp, $sp, -24

	lw    	$s1, ($a0)
	move  	$s2, $a1

	# base case
max_base_case:
	# if (length == 1) return a[0];
	li    	$t0, 1
	bgt   	$a1, $t0, max_rec_case
	lw    	$v0, ($a0)
	j     	max_return

	# recursive case
max_rec_case:
	# int max_so_far = max(&a[1], length-1);
	# TODO: Add code here
	addi 	$a0, $a0, 4 	# $a0 = &a[1]
	sub 	$a1, $a1, 1 	# $a1 = length - 1
	jal 	max
	move 	$t0, $v0 	# $t0 = max_so_far

	# return (a[0] < max_so_far) ? a[0] : max_so_far;
	ble   	$s1, $t0, max_else
	move  	$v0, $s1
	j     	max_return
max_else:
	move  	$v0, $t0
max_return:
    # epilogue
	lw    	$s2, -16($fp)
	lw    	$s1, -12($fp)
	lw    	$s0, -8($fp)
	lw    	$ra, -4($fp)
	la    	$sp, 4($fp)
	lw    	$fp, ($fp)
	jr    	$ra


# some test code which calls max
main:
	addi 	$sp, $sp, -4  	# create stack frame
	sw   	$ra, 0($sp)   	# save return address

	la   	$a0, array
	li   	$a1, 10
	jal   	max    		#

	move  	$a0, $v0     	# printf ("%d")
	li    	$v0, 1
	syscall

	li   	$a0, '\n'     	# printf("%c", '\n');
	li   	$v0, 11
	syscall

                       		# clean up stack frame
	lw   	$ra, 0($sp)   	# restore $ra
	addi 	$sp, $sp, 4   	# restore sp

	li  	$v0, 0         	# return 0
	jr  	$ra


	.data
array:
	.word	1 2 3 4 5 6 4 3 2 1