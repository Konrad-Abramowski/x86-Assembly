SYSREAD = 3
SYSWRITE = 4
STDIN = 0
STDOUT = 1
SYS_CALL = 0x80

.data
memory: .space 4
input: .space 4
output: .space 4
emptyString: .ascii "a"
.text
.globl time, saveToRegister, saveToMemory, readSYSCALL, writeSYSCALL

time:
  push %ebx

  xor %eax, %eax
  cpuid
  rdtsc

  pop %ebx
ret

saveToRegister:
movl $1, %eax
jmp time

saveToMemory:
movl $1, memory
jmp time


readSYSCALL:
movl $SYSREAD, %eax
movl $STDIN, %eax
movl $input, %ecx
movl $4, %edx
int $SYS_CALL
jmp time

writeSYSCALL:
movl $SYSWRITE, %eax
movl $STDOUT, %ebx
movl $output, %ecx
movl $4, %edx
jmp time
