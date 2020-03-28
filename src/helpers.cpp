#include <stdio.h>
#include <errno.h>
#include <stdlib.h>

void die(const char *message)
{
    if (errno)
    {
        perror(message);
    }
    else
    {
        printf("Error: %s\n", message);
    }
    exit(1);
}