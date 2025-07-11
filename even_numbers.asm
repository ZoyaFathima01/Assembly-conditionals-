section .text
    global _start

_start:
    mov eax, 0              ; start from 0

generate:
    cmp eax, 21             ; stop at 20
    jge end

    mov edx, eax
    and edx, 1              ; check if odd/even
    cmp edx, 0
    jne skip_print

    ; --- Convert eax (0-20) to ASCII ---
    mov ecx, eax
    mov edi, 0              ; digit counter
convert_loop:
    xor edx, edx
    mov ebx, 10
    div ebx                ; divide eax by 10 → quotient in eax, remainder in edx
    add dl, '0'
    mov [tmp + edi], dl
    inc edi
    test eax, eax
    jnz convert_loop

    ; --- Print digits in reverse ---
print_digits:
    dec edi
    mov al, [tmp + edi]
    mov [char], al

    mov eax, 4
    mov ebx, 1
    mov ecx, char
    mov edx, 1
    int 0x80

    cmp edi, 0
    jne print_digits

    ; Print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

skip_print:
    inc eax
    jmp generate

end:
    mov eax, 1
    int 0x80

section .bss
    tmp resb 4             ; to hold 4 digits max
    char resb 1

section .data
    newline db 10
