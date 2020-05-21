.data
FPUControlRegister: .space 2
FPUStatusRegister: .space 2
.text
    .globl readFPUControl, readFPUStatus, writeFPUControl, divide

readFPUControl:
    push %ebp
    movl %esp, %ebp
    fstcw FPUControlRegister
    fwait
    movw FPUControlRegister, %ax
    movl %ebp, %esp
    pop %ebp
ret

readFPUStatus:
    push %ebp
    movl %esp, %ebp
    fstsw FPUStatusRegister
    fwait
    movw FPUStatusRegister, %ax
    movl %ebp, %esp
    pop %ebp
ret

writeFPUControl:
    push %ebp
    movl %esp, %ebp
    fldcw 8(%ebp)
    fwait
    movl %ebp, %esp
    pop %ebp
ret

divide:
    push %ebp
    mov %esp, %ebp

    fld 12(%ebp)
    fld 8(%ebp)
    fdiv %st(1), %st(0)

    mov %ebp, %esp
    pop %ebp
ret