	.text
main:
# x = $t0
# y = $t1
	la 	$a0, prompt	# $a0 = prompt
	li 	$v0, 4		# print string
	syscall

	li 	$v0, 5		# read int into $v0
	syscall
	move 	$t0, $v0	# $t0 = $v0

	# if x >= 46340, keep going
	# ...
	# jump end_if 
	# bge 	$t0, 46340, if
	# j 	else
if:
	# Check if x < 46340, jump else
	# branch to else if x <...
	li 	$t2, 46340
	blt 	$t0, $t2, else

	la 	$a0, too_big
	li 	$v0, 4
	syscall

	j 	end_if
else:
	mul 	$t1, $t0, $t0	# y = x * x

	li 	$v0, 1
	move 	$a0, $t1 	# $a0 = $t1
	syscall

	# $a0 = '\n'
	# $a0 = $t0
	li 	$a0, '\n'
	li 	$v0, 11
	syscall

end_if:

	jr 	$ra

	.data
prompt:
	.asciiz "Enter a number: "
too_big:
	.asciiz "Square too big for 32 bits\n"