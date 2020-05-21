#include <stdio.h>

short readFPUControl();
short readFPUStatus();
void writeFPUControl(short controlRegister);
float divide(float a, float b);


int main(){

    printf("FPU control word value: %hi\n", readFPUControl());
    printf(" 0000 0011 0111 1111  (895)                    \n"); 
    printf("        ^^                                     \n");
    printf("        ||                                     \n");
    printf(" [Precision Control] ( Extended Precision 64b))\n");

    float x = 5.5;
    float y = 2.3;
    printf("x/y (5.5/2.3) = \n");
    
    
   
    double result = divide(x,y);
    int * pointer;
    pointer = &result;
    printf("%.22f\n", result);
    
    
    printInIEEE(result);
    printf("\n");
    
    printf("writeFPUControl function\n");
    writeFPUControl(127); 
    


    printf("FPU control word value: %hi\n", readFPUControl());
    printf(" 0000 0000 0111 1111 (127)                     \n"); 
    printf("        ^^                                     \n");
    printf("        ||                                     \n");
    printf(" [Precision Control] (Single Precision 24b)    \n");

    printf("x/y (5.5/2.3) = \n");
    result = divide(x,y);
    pointer = &result;
    printf("%.22f\n", result);
    
    printInIEEE(result);

    printf("\n");
    

    return 0;
}



void printInIEEE(double d)
{
 unsigned long long *double_as_int = (unsigned long long *)&d;

 for (int i=0; i<=63; i++)
   {
    if (i==1)
      printf(" "); 
    if (i==12)
      printf(" "); 

    if ((*double_as_int >> (63-i)) & 1)
      printf("1");
    else
      printf("0");
   }
 printf("\n");
}

