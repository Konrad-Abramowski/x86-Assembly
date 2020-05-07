#include <stdio.h>
#include <unistd.h>

unsigned long long time();

int main(){

  unsigned long long time1, time2;

  time1 = time();
  sleep(1); // Measured function. (Example)
  time2 = time();
  printf("CPU cycles: %llu\n", time2-time1 );
}
