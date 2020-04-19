SYSEXIT = 1
SYSREAD = 3
SYSWRITE = 4
STDIN = 0
STDOUT = 1
EXIT = 0
SYS_CALL = 0x80

input_bytes =  512
number_bytes = 256
lastIndexNumber = 255

.data
number: .space input_bytes
result: .space input_bytes
inputSize: .space 4

.text
.globl _start
_start:

  mov $SYSREAD, %eax
  mov $STDIN, %ebx
  mov $number, %ecx
  mov $input_bytes, %edx
  int $SYS_CALL

  movl %eax, inputSize

  cmpl $0, inputSize
  je end

  movl $0, %edi
  movl $0, %ecx
  movl $number_bytes, %esi

  popf
  clc
  pushf
  jmp inner_loop

# Values of indexes can be a little unclear at first sight. Input string isn`t
# devided into two separated strings which would carry the data of the numbers.
# Program is operating on the one string in which second number starts from the
# 4th index.

outer_loop:
  popf
  clc
  pushf

  cmpl $lastIndexNumber, %ecx
  je write

  incl %ecx
  movl $0, %edi
  movl $number_bytes, %esi

  inner_loop:

    cmpl $number_bytes, %edi
    je outer_loop

    movb number(%ecx), %al
    movb number(%esi), %bl
    mulb %bl
    popf
    adcb $0, %ah
    addb %al, result(%ecx,%edi)
    incl %edi
    adcb %ah, result(%ecx,%edi)
    decl %edi
    incl %edi
    incl %esi
    pushf
    jmp inner_loop

write:
  mov $SYSWRITE, %eax
  mov $STDOUT, %ebx
  mov $result, %ecx
  mov $input_bytes, %edx
  int $SYS_CALL

  movl $0, %esi

cleaning_loop:
  cmpl $input_bytes, %esi
  je finish
  movb $0, result(%esi)
  incl %esi
  jmp cleaning_loop

finish:
  cmpl $0, inputSize
  jne _start

end:
  movl $SYSEXIT, %eax
  movl $EXIT, %ebx
  int $SYS_CALL
