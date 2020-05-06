#include <stdio.h>

void functionChar(char* pointerChar);

int main(){
  char x = 'a';

  char array[10] = {0,1,2,3,4,5,6,7,8,9};

  functionChar(&x);
  printf("%s\n", &x);
  return 0;
}
