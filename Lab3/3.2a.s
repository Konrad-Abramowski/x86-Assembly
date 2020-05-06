.text
  .globl functionChar, functionArray

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

functionArray:
pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax
movl 12(%ebp), %ecx
movl $0, %edi

loop:
cmpl %edi, %ecx
je  end
movl (%eax,%edi,1),%edx
incl %edx
movl %edx, (%eax,%edi,1)
incl %edi
jmp loop

end:
movl %ebp, %esp
popl %ebp
ret
