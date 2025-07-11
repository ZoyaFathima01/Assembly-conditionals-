section .text
    global _start

_start:
    mov eax, [num1]

    cmp eax, [num2]
    jg next1
    mov eax, [num2]
next1:

    cmp eax, [num3]
    jg next2
    mov eax, [num3]
next2:

    cmp eax, [num4]
    jg next3
    mov eax, [num4]
next3:

    cmp eax, [num5]
    jg end
    mov eax, [num5]

end:
    mov [largest], eax      ; Store result

    ; Exit syscall
    mov eax, 1
    int 0x80

section .data
    num1 dd 7
    num2 dd 13
    num3 dd 3
    num4 dd 19
    num5 dd 11

section .bss
    largest resd 1
