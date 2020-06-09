/**
 * Program that checks if a number is odd using bitwise operations.
 */

#include <stdio.h>

int is_odd(int num);

int main(void) {
    printf("Please enter a number: ");
    int num = 0;
    scanf("%d", &num);

    if (is_odd(num)) {
        printf("ODD\n");
    } else {
        printf("EVEN\n");
    }

    return 0;
}

/**
 * How to figure out if a number is odd or even?
 * 0010 1011     num
 * 0000 1111 &   mask -> tells us value of last 4 bits
 * -----------
 * 0000 1011
 * --> num & mask 
 * if ((num & mask) == 1) -> odd number
 * if ((num & mask) == 0) -> even number
 */
int is_odd(int num) {
    // We want the mask = 0000 0001 = 1
    int mask = 1; // mask = 0000 0001
    // ODD NUMBER.
    if ((num & mask) == 1) {
        return 1;
    }
    // EVEN NUMBER.
    return 0;
}