.text
.globl time
time:
  push %ebx

  xor %eax, %eax
  cpuid
  rdtsc

  pop %ebx
ret
