# Converting from C to MIPS directives.

# struct two_ints {
# 	int x;
# 	int y;
# };
# struct two_ints v7;

# int v6[10][5];
v6:
	.space 	200

# struct { int x; int y; } v7;
v7:
	.space 	8

# struct { int x; int y; } v8[4];
v8:
	.space 	32

# struct { int x; int y; } *v9[4];
v9:
	.space 	16
