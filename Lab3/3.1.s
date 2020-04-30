.data
SCANF_STRING:   .ascii "%1s %4s"
PRINTF_STRING:  .string "Char: %s ,Char*: %s"

.text
    .globl main
main:
    pushl %ebp
    movl %esp, %ebp
    subl $8, %esp

    leal 12(%ebp), %eax
    pushl %eax
    leal 8(%ebp), %eax
    pushl %eax
    pushl $SCANF_STRING
    call scanf

    leal 12(%ebp), %eax
    pushl %eax
    leal 8(%ebp), %eax
    pushl %eax
    pushl $PRINTF_STRING
    call printf
    addl $8, %esp

    leave
    ret
