	.text 
main:
# x = $t0
	li 	$t0, 24		# $t0 = 24
loop:
	bge 	$t0, 42, end_loop

	move 	$a0, $t0 
	li 	$v0, 1
	syscall			# printf(%d)

	li 	$a0, '\n'
	li 	$v0, 11
	syscall

	addi 	$t0, $t0, 3 	# $t0 = $t0 + 3
	j 	loop

end_loop:

	jr 	$ra

	.data



	li	$t0, ...
loop:
	bge 	..., end_loop

	...

	addi 	$t0, $t0, 1
	j 	loop
end_loop:
