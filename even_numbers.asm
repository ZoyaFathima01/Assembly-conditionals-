section .text
    global _start

_start:
    mov eax, 0              ; start from 0

generate:
    cmp eax, 21             ; stop when eax == 21
    jge exit

    mov edx, eax
    and edx, 1              ; check if odd
    cmp edx, 0
    jne skip_print

    ; --- convert eax to string ---
    mov ecx, eax            ; copy number to ecx
    mov esi, tmp + 4        ; point to end of buffer
    mov byte [esi], 0       ; null terminator

convert:
    dec esi
    xor edx, edx
    mov ebx, 10
    div ebx                 ; eax /= 10, remainder in edx
    add dl, '0'
    mov [esi], dl
    test eax, eax
    jnz convert

    ; --- print string ---
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, tmp + 4 - esi  ; length of number string
    int 0x80

    ; --- print newline ---
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

skip_print:
    inc eax
    jmp generate

exit:
    mov eax, 1
    int 0x80

section .bss
    tmp resb 5              ; buffer for number string

section .data
    newline db 10
