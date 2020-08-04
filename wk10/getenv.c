/**
 * Write a C program, print_diary.c, which prints the contents of the file 
 * $HOME/.diary to stdout
 * The lecture example getenv.c shows how to get the value of an environment 
 * variable.
 * 
 * snprintf is a convenient fucntion for constructing the pathname of the 
 * diary file.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Example of how to make use of information in the env
    // getenv -> get the value of an env variable

    // 1. Get my "HOME" from my environment.
    char *home_pathname = getenv("HOME");

    // 2. Read from "HOME/.diary"
    // 2a. Concatenate home_pathname + "/" + ".diary" using snprintf
    char *diary_string = ".diary";

    // diary_pathname = $HOME/.diary == /Users/selina/.diary
    // home_pathname = "/Users/selina"
    // diary_string  = ".diary";
    // home_pathname + "/" + ".diary" using snprintf
    int total_length = strlen(diary_string) + strlen(home_pathname) + 2;
    char diary_pathname[total_length];
    snprintf(diary_pathname, total_length, "%s/%s", home_pathname, diary_string);
    FILE *file = fopen(diary_pathname, "r");
    if (!file) {
        perror(diary_pathname);
        return 1;
    }

    // 3. Print out the contents of file.
    int byte;
    while((byte = fgetc(file)) != EOF) {
        fputc(byte, stdout);
    }

    fclose(file);

    return 0;
}