	.text
main:
# $t0 = row
	li 	$t0, 0 		# row = 0
loop0:
	bge 	$t0, 6, end_loop0
	li 	$t1, 0		# col = 0
loop1:
	bge 	$t1, 12, end_loop1

	mul 	$t2, $t0, 12 	# $t2 = row * N_COL
	add 	$t2, $t2, $t1 	# $t2 += col
	# la 	$t3, flag 
	# add 	$t3, $t3, $t2 
	# lb 	$t3, ($t3)
	lb	$t2, flag($t2)	# $t2 = flag[row][col]

	move 	$a0, $t2	# $a0 = $t2
	li 	$v0, 11 	# $v0 = print_char
	syscall

	addi 	$t1, $t1, 1 	# col++
	j 	loop1
end_loop1:
	li 	$a0, '\n'
	li 	$v0, 11
	syscall

	addi 	$t0, $t0, 1	# row++
	j 	loop0
end_loop0:

	jr 	$ra 		# return 0

###########################
	.data
flag:
	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
	.byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
	.byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
	.byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'