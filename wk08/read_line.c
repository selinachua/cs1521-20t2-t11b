#include <stdio.h>

// errno = 1 -> 1 stand for No file exists
// text.txt: No file exists

// char *argv[] == char **argv
// char *argv = {'a', 'b', 'c'}
// char **argv = { {'a', 'b'}, {'c', 'd'} }
int main(int argc, char *argv[]) {
    // 1. Open the file
    FILE *fp = fopen("text.txt", "r");
    if (fp == NULL) {
        perror("text.txt");
    }
    // 2. Read the file
    // 3. Print out the first line of the file
    // We want to use fputc and fgetc
    // fgets and fputs are a NO
    int c;
    while ((c = fgetc(fp)) != '\n') {
        // print it to stdout
        // printf("%c", c);
        fputc(c, stdout);
    }
    // 4. Close the file
    fclose(fp);

    return 0;
}