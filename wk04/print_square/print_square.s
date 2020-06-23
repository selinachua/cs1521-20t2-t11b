# Translate from print_square.c
	.text 
main:
	# use $t0 for x
	# use $t1 for y

	li 	$v0, 4		# $v0 = print_string code
	la 	$a0, prompt	# $a0 = prompt
	syscall			# printf("Enter a number: ");

	li 	$v0, 5		# $v0 = read_int
	syscall 		# scanf into $v0

	move 	$t0, $v0	# $t0 = $v0
	# y = x * x
	# $t1 = $t0 * $t0
	mul 	$t1, $t0, $t0	

	# $a0 = $t1
	move 	$a0, $t1
	# print_int($a0)
	li 	$v0, 1
	syscall

	jr 	$ra

	.data
prompt:
	.asciiz	"Enter a number: "