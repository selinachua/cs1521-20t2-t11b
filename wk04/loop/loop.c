#include <stdio.h>

int main(void) {
    for (int x = 24; x < 42; x += 3) {
        printf("%d\n",x);
    }
    return 0;
}

int main(void) {
    int x = 24;
    while (x < 42) {
        printf("%d\n", x);
        x += 3;
    }

    return 0;
}