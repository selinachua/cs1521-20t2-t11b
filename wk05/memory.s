Address       Data Definition
0x10010000    aa:  .word 42
0x10010004    bb:  .word 666
0x10010008    cc:  .word 1
0x1001000C         .word 3
0x10010010         .word 5
0x10010014         .word 7

cc:
    .word   1 3 5 7

# What address will be calculated, and what value will be loaded 
# into register $t0, after each of the following statements (or 
# pairs of statements)?
la   $t0, aa
lw   $t0, bb
lb   $t0, bb
lw   $t0, aa+4

la   $t1, cc
lw   $t0, ($t1)
la   $t1, cc
lw   $t0, 8($t1)
li   $t1, 8
lw   $t0, cc($t1)
la   $t1, cc
lw   $t0, 2($t1)