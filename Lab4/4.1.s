.data
FPUControlRegister: .space 4
FPUStatusRegister: .space 4

.text
    .globl readFPUControl, readFPUStatus

readFPUControl:
    push %ebp
    movl %esp, %ebp
    fstcw FPUControlRegister
    movw $FPUControlRegister, %ax
    pop %ebp
ret

readFPUStatus:
    push %ebp
    movl %esp, %ebp
    fstsw FPUStatusRegister
    movw $FPUStatusRegister, %ax
    pop %ebp
ret