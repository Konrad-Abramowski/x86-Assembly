#include <stdio.h>

short readFPUControl();
short readFPUStatus();
void writeFPUControl(short controlRegister);
float divide(float a, float b);

int bitReturn(int pointer, int index){
    int buf = pointer & 1<<index;

    if (buf == 0) return 0;
    else return 1; 
}
int main(){

    printf("FPU control word value: %hi\n", readFPUControl());
    printf(" 0000 0011 0111 1111  (895)                    \n"); 
    printf("      ^^                                       \n");
    printf("      ||                                       \n");
    printf(" [Rounding Control] (Round to nearest (even))  \n");

    float x = 5.5;
    float y = 2.3;
    printf("x/y (5.5/2.3) = \n");
    float result = divide(x,y);
    int *pointer;
    pointer = &result;
    printf("%.12f\n", result);
    for (int i = 63; i >= 0; i--)
    {
        
        if(i == 62){
            printf(" ");
        }
        if(i == 51){
            printf(" ");
        }
        printf("%d",bitReturn(*pointer,i));
    }
    printf("\n");
    printf("                                                                ^^\n");
    printf("                                                                ||\n");
    printf("                                                        [Round to nearest]\n");


    printf("writeFPUControl function\n");
    writeFPUControl(3967); 
    


    printf("FPU control word value: %hi\n", readFPUControl());
    printf(" 0000 1111 0111 1111 (3967)                    \n"); 
    printf("      ^^                                       \n");
    printf("      ||                                       \n");
    printf(" [Rounding Control] (Round toward zero)         \n");

    printf("x/y (5.5/2.3) = \n");
    result = divide(x,y);
    printf("%.12f\n", result);
    pointer = &result;
    for (int i = 63; i >= 0; i--)
    {
        
        if(i == 62){
            printf(" ");
        }
        if(i == 51){
            printf(" ");
        }
        printf("%d",bitReturn(*pointer,i));
    }
    printf("\n");
    printf("                                                                ^^\n");
    printf("                                                                ||\n");
    printf("                                                       [Round toward zero]\n");
    

    return 0;
}

