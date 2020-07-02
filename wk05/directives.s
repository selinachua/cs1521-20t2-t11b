# Practice how to convert C variables into MIPS data directives.
# Initialised variables:  int i = 2;
# Uninitialised variable: int num;
	.data
# int u; -> uninitalised variable
u:
	.space 	4
# int v = 42; -> initialised variable
v:
	.word 	42
# char w; -> un..
w:
	.space 	1
# char x = 'a';
x:
	.byte 	'a'
# double y; -> un...
y:
	.space 	8
# int z[20] -> uninitialised -> space;
z:
	.space 	80
# int numbers = {0, 1, 2, 3};
numbers:
	.word 	0, 1, 2, 3
# char chs = {'a', 'b'};
chs:
	.byte 'a', 'b'
