# Loading from Array:
# 1. Load starting address
# 2. Calculate the offset -> i * 4
# 3. Load into register
	.text
main:
# $t0 = i
	li 	$t0, 0		# i = 0
while:
	bge	$t0, 10, end_while

	la 	$t1, numbers 	# $t1 = &numbers
	mul 	$t2, $t0, 4 	# $t2 = i * 4
	add 	$t2, $t2, $t1 	# $t2 = &numbers[i]
	lw 	$t3, ($t2) 	# $t3 = *($t2) = numbers[i]

	move 	$a0, $t3
	li 	$v0, 1
	syscall 		# printf("%d");

	li 	$a0, '\n'
	li 	$v0, 11
	syscall

	addi 	$t0, $t0, 1	# i++
	j 	while
end_while:
	jr 	$ra 		# return 0;
############################
	.data
numbers:
	.word 	0 1 2 3 4 5 6 7 8 9