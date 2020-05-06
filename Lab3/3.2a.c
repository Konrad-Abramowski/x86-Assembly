#include <stdio.h>

void functionChar(char* pointerChar);

void functionArray(char* array, int size);

int main(){

  char x = 'a';

  printf("Char before function: %c\n", x);
  functionChar(&x);
  printf("Char after function: %c\n", x);

  char array[10] = "abcdefghij";

  printf("Array before function: ");
  for (int i=0;i<10;i++){
    printf("%c ", array[i]);
  }
  printf("\n");
  functionArray(array, 10);
  printf("Array after function: ");
  for (int i=0;i<10;i++){
    printf("%c ", array[i]);
  }
  printf("\n");

  return 0;
}
