## Stack frames
#

# ... jal add_nums ...

add_nums:
	# set up stack frame
	sw	$fp, -4($sp)
	la	$fp, -4($sp)
	sw	$ra, -4($fp)
	sw	$s0, -8($fp)
	sw 	$s1, -12($fp)
	sw 	$s2, -16($fp)
	sw 	$s3, -20($fp)
	addi	$sp, $sp, -24

	# ... some code over here ...
	add 	$v0, $a0, $a1

add_nums_end:
	# tear down stack frame
	lw	$ra, -4($fp)
   	lw	$s0, -8($fp)
   	lw	$s1, -12($fp)
	lw 	$s2, -16($fp)
	lw 	$s3, -20($fp)
   	la	$sp, 4($fp)
   	lw	$fp, ($fp)

	jr 	$ra