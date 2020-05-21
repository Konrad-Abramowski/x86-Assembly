#include <stdio.h>
#include <math.h>

short readFPUControl();
short readFPUStatus();
void writeFPUControl(short controlRegister);
float divide(float a, float b);
float power(float x);
void clearFlagsAffected();

int main(){

    float a = 1.0;
    float b = 0.0;
    printf("FPU status register value: %hi\n", readFPUStatus());

    printf("Division b/a (0/1) \n");
    divide (b, a); // Division b/a (0/1) in valid operation what`s why 
    // ZE flag is still equal zero.

    printf("FPU status register value: %hi\n", readFPUStatus());
    // FPU status register value is equal to 14336 (11 1000 0000 0000)
    // From 189 page of Intel Basic Architecture we know that ZE flag bit 
    // is 2nd (counting form zero) and it`s still zero

    printf("Division a/b (1/0) \n");
    divide(a,b);
    printf("FPU status register value: %hi\n", readFPUStatus());
    // FPU status register value is equal to 12292 (11 0000 0000 0100)
    //                                                            ^
    //                                                            |
    //                                                         [ZE flag]
    // ZE flag affected

    clearFlagsAffected();
    

    printf("---------\n");

    float x = powf(2.0, 120);
   
    printf("FPU status register value: %hi\n", readFPUStatus());
    // FPU status register value is equal to 12288 (11 0000 0000 0000)
    //                                                            ^
    //                                                            |
    //                                                         [ZE flag]
    // Flags equal zero

    // Rising x to the 250th power
    printf("Rising x to the 250th power\n");
    power(x);
    
    printf("FPU status register value: %hi\n", readFPUStatus());
    // FPU status register value is equal to 12288 (10 1000 0010 1000)
    //                                                           ^
    //                                                           |
    //                                                        [OE flag]
    // Overflow
    return 0;
}