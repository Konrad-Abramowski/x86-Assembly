#include <stdio.h>

short readFPUControl();
short readFPUStatus();
void writeFPUControl(short controlRegister);

int main(){

    printf("FPU status register value: %hi\n", readFPUStatus());

    printf("FPU control word value: %hi\n", readFPUControl());

    printf("writeFPUControl function\n");
    writeFPUControl(8000);
   
    printf("FPU control word value: %hi\n", readFPUControl());

    return 0;
}