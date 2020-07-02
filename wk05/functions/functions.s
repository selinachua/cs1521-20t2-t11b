        .text
main:
# x = $t0
# y = $t1
# sum = $t3
        # TODO: Add code here
        sw	$fp, -4($sp)
	la	$fp, -4($sp)
	sw	$ra, -4($fp)
	addi	$sp, $sp, -8
        
        li      $v0, 5
        syscall
        move    $t0, $v0        # scanf("%d", &x);

        li      $v0, 5
        syscall
        move    $t1, $v0        # scanf("%d", &y);

        move    $a0, $t0        # $a0 = x
        move    $a1, $t1        # $a1 = y
        jal     add_nums
        move    $t3, $v0        # sum = return value = $v0

        move    $a0, $t3
        li      $v0, 1
        syscall

        li      $a0, '\n'
        li      $v0, 11
        syscall

        # TODO: Add code here
        lw	$ra, -4($fp)
   	la	$sp, 4($fp)
   	lw	$fp, ($fp)
        jr      $ra

# ADD FUNCTION
# Assume that $a0 - $a3 contains arguments that we want
# We have to put return value inside $v0
add_nums:
        sw	$fp, -4($sp)
	la	$fp, -4($sp)
	sw	$ra, -4($fp)
	addi	$sp, $sp, -24

        add     $v0, $a0, $a1

        lw	$ra, -4($fp)
   	la	$sp, 4($fp)
   	lw	$fp, ($fp)
        jr      $ra

#######################################
        .data