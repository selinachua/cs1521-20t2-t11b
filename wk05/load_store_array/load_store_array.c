int main(void) {
    int i;
    int numbers[10] = {0,1,2,-3,4,-5,6,-7,8,9};

    i = 0;
    while (i < 10) {
        int num = numbers[i];
        if (num < 0) {
            num += 42;
            numbers[i] = num;
        }
        i++;
    }
}