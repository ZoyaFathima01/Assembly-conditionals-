section .text
    global _start

_start:
    mov eax, 0              ; Start from 0

generate:
    mov edx, eax
    and edx, 1              ; Check if even
    cmp edx, 0
    jne skip_print          ; If odd, skip

    ; Convert number to ASCII
    mov ecx, eax
    add ecx, '0'
    mov [tmp], cl

    ; Print character
    mov eax, 4
    mov ebx, 1
    mov ecx, tmp
    mov edx, 1
    int 0x80

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, space
    mov edx, 1
    int 0x80

skip_print:
    inc eax
    cmp eax, 21             ; Up to 20
    jl generate

    ; Exit syscall
    mov eax, 1
    int 0x80

section .bss
    tmp resb 1

section .data
    space db 10             ; Newline (ASCII 10)
