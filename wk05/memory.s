Address       Data Definition
0x10010000    aa:  .word 42         # int aa = 42; &aa = 0x10010000
0x10010004    bb:  .word 666        # int bb = 666;
0x10010008    cc:  .word 1          # int cc[4] = {1, 3, 5, 7};
0x1001000C         .word 3
0x10010010         .word 5
0x10010014         .word 7

# What address will be calculated, and what value will be loaded 
# into register $t0, after each of the following statements (or 
# pairs of statements)?
# la, lw, lb -> load things from memory (data)
# la -> load address of label
# lw -> load word
la   $t0, aa        # $t0 = 0x10010000 
lw   $t0, bb        # $t0 = 666
lb   $t0, bb        # ...
lw   $t0, aa+4      # $t0 = 666 -> lw   $t0, bb

# int *p = &num; -> p has the value of the address of num 
# *p == num      -> grab the value at address of num
la   $t1, cc        # $t1 = 0x10010008
lw   $t0, ($t1)     # $t0 = 1
la   $t1, cc        # $t1 = 0x10010008
lw   $t0, 8($t1)    # $t0 = *($t1 + 8) = 5
li   $t1, 8         # $t1 = 8
lw   $t0, cc($t1)   # $t0 = *($t1 + cc) = *(8 + cc) = 5
la   $t1, cc        # $t1 = 0x10010008
lw   $t0, 2($t1)    # $t0 = *($t1 + 2) = ERROR