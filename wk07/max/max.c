
void func() {
    return;     // jr $ra
}

int max(int a[], int length) {
    int first_element = a[0];
    if (length == 1) {
        return first_element;
    } else {
        // find max value in rest of array
        int max_so_far = max(&a[1], length - 1);
        if (first_element > max_so_far) {
            max_so_far = first_element;
        }
        return max_so_far;
    }
}

3! = 3 * 2 * 1
4! = 4 * 3 * 2 * 1
4! = 4 * 3!
   = 4 * 3 * 2!

1! = 1

int factorial(int num) {
    if (num == 1) {
        return 1;
    }
    return num * factorial(num - 1);
}