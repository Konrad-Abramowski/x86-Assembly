#include <stdio.h>
#include <unistd.h>

unsigned long long time();
unsigned long long saveToRegister();
unsigned long long saveToMemory();
unsigned long long readSYSCALL();
unsigned long long writeSYSCALL();

int main(){
  int number;

  unsigned long long time1, time2;

  time1 = time();
  time2 = saveToRegister();
  printf("CPU cycles for saving into register: %llu\n", time2-time1 );

  time1 = time();
  time2 = saveToMemory();
  printf("CPU cycles for saving into memory: %llu\n", time2-time1 );

  time1 = time();
  time2 = readSYSCALL();
  printf("CPU cycles for SYS_CALL READ: %llu\n", time2-time1 );

  time1 = time();
  time2 = readSYSCALL();
  printf("CPU cycles for SYS_CALL WRITE: %llu\n", time2-time1 );

  time1 = time();
  scanf("%d", &number);
  time2 = time();
  printf("CPU cycles for scanf: %llu\n", time2-time1 );

  time1 = time();
  printf("");
  time2 = time();
  printf("CPU cycles for empty printf: %llu\n", time2-time1 );

  time1 = time();
  printf("Assembler");
  time2 = time();
  printf("\nCPU cycles for short printf: %llu\n", time2-time1 );

  time1 = time();
  printf("Assembler\n");
  time2 = time();
  printf("CPU cycles for short printf with \\n: %llu\n", time2-time1 );
  return 0;
}
