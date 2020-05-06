#include <stdio.h>

void functionShort(short x){
  printf("Short before function: %hi\n", x);
  x++;
  printf("Short after function: %hi\n", x);
}
void functionCharPointer(int x){
  printf("Char* before function: %i\n", x);
  x++;
  printf("Char* after function: %i\n", x);
}
