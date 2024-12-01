section .data
    message db 'SEE YOU LATER BABY 😈', 0
    smiley db '😀😂😈 Melissa was here!', 0

section .bss

section .text
    global _start

_start:
    ; Mesajı ekrana yazdır
    mov eax, 4
    mov ebx, 1
    mov ecx, message
    mov edx, 20
    int 0x80

    ; Sonsuz döngü başlat
.loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, smiley
    mov edx, 20
    int 0x80
    jmp .loop

    ; Programdan çıkış (Asla çalışmayacak)
    mov eax, 1
    xor ebx, ebx
    int 0x80
