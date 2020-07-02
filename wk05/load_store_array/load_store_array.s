# Loading from Array:
# 1. Load starting address
# 2. Calculate the offset -> i * 4
# 3. Load into register
	.text 
main:
# $t0 = i
	li 	$t0, 0 		# i = 0
while:
	bge 	$t0, 10, end_while

	la 	$t1, numbers 	# $t1 = &numbers
	mul 	$t2, $t0, 4	# $t2 = i * 4
	add	$t2, $t2, $t1	# $t2 = &numbers[i]
	lw 	$t3, ($t2)	# $t3 = numbers[i]
if:
	bge 	$t3, $zero, end_if

	addi 	$t3, $t3, 42 	# num += 42;
	sw 	$t3, ($t2)	# numbers[i] = num;
end_if:
	addi 	$t0, $t0, 1	# i++
	j 	while
end_while:
	jr 	$ra 		# return 0
###################################
	.data
numbers:
	.word	0 1 2 -3 4 -5 6 -7 8 9