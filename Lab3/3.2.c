#include <stdio.h>

void functionChar(char* pointerChar);

//void functionArray(int* array, int size);

int main(){

  char x = 'a';
  printf("Char before function: %c\n", x);
  functionChar(&x);
  printf("Char after function: %c\n", x);

  char array[10] = {0,1,2,3,4,5,6,7,8,9};

  for (int i=0;i<10;i++){
    printf("%d ", array[i]);
  }
  printf("\n");

  return 0;
}
