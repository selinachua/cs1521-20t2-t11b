#include <stdio.h>

int main(int argc, char **argv) {
    FILE *fp = fopen("text.txt", "a");
    if (fp == NULL) {
        perror("text.txt");
    }
    int c;
    while ((c = fgetc(stdin)) != EOF) {
        fputc(c, fp);
    }
    fclose(fp);

    return 0;
}