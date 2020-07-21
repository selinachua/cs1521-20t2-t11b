#include <stdio.h>

int main(int argc, char **argv) {
    FILE *fp = fopen("text.txt", "w");
    if (fp == NULL) {
        perror("text.txt");
    }
    int c;
    while ((c = fgetc(stdin)) != '\n') {
        fputc(c, fp);
    }
    fclose(fp);

    return 0;
}