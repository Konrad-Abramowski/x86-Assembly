.data
short: .space 2
charPointer: .space 4

.text
  .globl  main
  .extern functionShort, functionCharPointer

main:
  movw $10, short
  pushl short
  call functionShort
  addl $4, %esp

  movw $12345, charPointer
  pushl charPointer
  call functionCharPointer
  addl $4, %esp


  movl $0, %eax
  ret
