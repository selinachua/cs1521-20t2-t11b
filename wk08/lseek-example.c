#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv) {
    char *arr = "!";
    int fd = open("text.txt", O_WRONLY);
    lseek(fd, 3, SEEK_SET);
    write(fd,arr, 1);
    close(fd);
    return 0;
}