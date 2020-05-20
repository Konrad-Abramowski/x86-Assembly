.data
FPUControlRegister: .space 2
FPUStatusRegister: .space 2
.text
    .globl readFPUControl, readFPUStatus, writeFPUControl

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