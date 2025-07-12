section .data
    newline db 10

section .bss
    buf resb 3        ; up to 2 digits and '\0'

section .text
    global _start

_start:
    mov esi, 0            ; esi will be our counter: 0, 2, ..., 20

print_loop:
    cmp esi, 22           ; stop after printing 20
    jge done

    ; --- convert esi to string in buf ---
    mov eax, esi
    mov edi, buf+2        ; point to end of buffer
    mov byte [edi], 0     ; null terminator

    mov ebx, 10

    dec edi
    xor edx, edx
    div ebx               ; eax = eax / 10, edx = remainder
    add dl, '0'
    mov [edi], dl

    cmp eax, 0
    je .print_one_digit
    dec edi
    add al, '0'
    mov [edi], al

.print_one_digit:
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buf+2
    sub edx, edi
    int 0x80

    ; print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    add esi, 2            ; next even number
    jmp print_loop

done:
    mov eax, 1
    int 0x80
