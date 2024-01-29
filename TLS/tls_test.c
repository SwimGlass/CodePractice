#include <stdio.h>
#include <stdlib.h>

__thread int hello = 3;
int main(void) {
    printf("hello:%d\n",hello);
    return 0;
}
