section .data
    nums dd 12, 7, 25, 3, 19   ; five numbers to compare
    msg db "Largest: ", 0
    msglen equ $-msg
    newline db 10

section .bss
    largest resd 1

section .text
    global _start

_start:
    mov eax, [nums]        ; eax = nums[0]
    mov [largest], eax     ; largest = nums[0]

    mov ecx, 1             ; index = 1
find_loop:
    cmp ecx, 5
    jge print_result

    mov eax, [nums + ecx*4]
    mov edx, [largest]
    cmp eax, edx
    jle next_num
    mov [largest], eax
next_num:
    inc ecx
    jmp find_loop

print_result:
    ; print "Largest: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msglen
    int 0x80

    ; print the largest number as decimal
    mov eax, [largest]
    mov ebx, 10
    mov edi, buf+11      ; point to end of buffer
    mov byte [edi], 0    ; null terminator

convert_loop:
    dec edi
    xor edx, edx
    div ebx
    add dl, '0'
    mov [edi], dl
    test eax, eax
    jnz convert_loop

    ; print the number string
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buf+12
    sub edx, edi
    int 0x80

    ; print newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .bss
    buf resb 12
