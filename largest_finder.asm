section .text
    global _start

_start:
    mov eax, [num1]

    cmp eax, [num2]
    jge next1
    mov eax, [num2]
next1:

    cmp eax, [num3]
    jge next2
    mov eax, [num3]
next2:

    cmp eax, [num4]
    jge next3
    mov eax, [num4]
next3:

    cmp eax, [num5]
    jge store
    mov eax, [num5]

store:
    mov [largest], eax

    ; Exit
    mov eax, 1
    int 0x80

section .data
    num1 dd 17
    num2 dd 42
    num3 dd 13
    num4 dd 29
    num5 dd 6

section .bss
    largest resd 1
