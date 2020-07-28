// remove public write from specified as command line arguments if needed

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

void chmod_if_needed(char *pathname);

int main(int argc, char *argv[]) {
    for (int arg = 1; arg < argc; arg++) {
        chmod_if_needed(argv[arg]);
    }
    return 0;
}

// chmod a file if publically-writeable

void chmod_if_needed(char *pathname) {
    // 1. We create an empty struct stat.
    struct stat s;
    // 2. We call stat() to fill it up.
    stat(pathname, &s);
    
    // Check if OTH can write 
    // 10 bit bitstring 
    // ---rwxr--r--
    // ---111100110 = mode
    // ---000000010 = S_IWOTH
    // ------------ &
    // ---0000000_0

    //   111100110
    // & 111111101
    // -----------
    //   111100100
    mode_t mode = s.st_mode;
    if ((mode & S_IWOTH) != 0) {
        // chmod
        mode_t new_mode = mode & (~S_IWOTH);
        chmod(pathname, new_mode);
    }
}