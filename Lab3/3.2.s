.text
  .globl functionChar
  .type functionChar, @function

functionChar:
pushl %ebp
movl %esp, %ebp

movl 8(%ebp), %ecx
movb (%ecx), %al
incb %al
movb %al, (%ecx)

movl %ebp, %esp
popl %ebp
ret
