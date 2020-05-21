.data
FPUControlRegister: .space 2
FPUStatusRegister: .space 2
.text
    .globl readFPUControl, readFPUStatus, writeFPUControl, divide, power, clearFlagsAffected

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

power:
    push %ebp
    mov %esp, %ebp

    fld 8(%ebp)
    fld 8(%ebp)
    
    movl $0, %eax
    loop:
        fmul %st(1), %st(0)
        incl %eax     
        cmpl $250, %eax
    jne loop
    

    mov %ebp, %esp
    pop %ebp
ret

clearFlagsAffected:
    push %ebp
    mov %esp, %ebp

    fclex

    mov %ebp, %esp
    pop %ebp
ret