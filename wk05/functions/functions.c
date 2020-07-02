#include <stdio.h>

int add(int x, int y);

int main(void) {
    int x;
    int y;
    scanf("%d", &x);
    scanf("%d", &y);

    int sum = add(x, y);
    printf("%d\n", sum);

    return 0;
}

int add(int x, int y, int z) {
    return x + y;
}