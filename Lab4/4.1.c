#include <stdio.h>

short readFPUControl();
short readFPUStatus();

int main(){

    short x;
    x = readFPUControl();
    printf("FPU control word value: %hi\n", x);
    x = readFPUStatus();
    printf("FPU status register value: %hi\n", x);
    return 0;
}