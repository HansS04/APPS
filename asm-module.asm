;***************************************************************************
;
; Program for education in subject "Assembly Languages" and "APPS"
; petr.olivka@vsb.cz, Department of Computer Science, VSB-TUO
;
; Empty project
;
;***************************************************************************

    bits 64

    section .data


;***************************************************************************

    section .text


    ;rdi rsi rdx rcx r8 r9
    global add_int
add_int:
    ;enter 0,0 může se psát, ale nemusí

    mov eax, edi ;ret = a
    add eax, esi ;ret +=b

    ;leave může se psát ,ale nemusí
    ret
    
    ;rdi rsi rdx rcx r8 r9
    global add_long
add_long:
    ;enter 0,0 může se psát, ale nemusí

    mov rax, rdi ;ret = a
    add rax, rsi ;ret +=b

    ;leave může se psát ,ale nemusí
    ret
    

    global str_len
str_len:
    ;while (ptr[len] != 0 ) len++;
    mov rcx, 0
.zpet:
    cmp byte [rdi + rcx * 1], 0
    je .hotovo

    inc rcx
    jmp .zpet

.hotovo: 
    mov eax, ecx
    ret

    ret


    ;rdi rsi rdx rcx r8 r9
    global suma_int
suma_int
    ;for (int i = 0; i < N; i++) suma += pole[i]
    mov eax, 0
    movsx rsi, esi ; rsi = N, znamenkove rozsirit ten int na 64 bit
    mov rcx,0      ; i = 0
.zpet:
    cmp rcx, rsi       ;i < N
    jge .hotovo
    
    add eax, [rdi + rcx * 4] ; suma += pole [i] ; rdi[rcx]
    
    inc rcx ;i++
    jmp .zpet


.hotovo:
    ret



    ;rdi rsi rdx rcx r8 r9
    global navelka
navelka:
    ;while ...
    ;if (ptr[i] >= 'a' && ptr [i] <= 'z') ptr[i] -= 'a' - 'A';

    mov rcx, 0  ; i = 0
.zpet:
    ;while (){
    cmp byte [rdi + rcx], 0
    je .hotovo

    cmp byte [rdi + rcx ], 'a'
    jl .taknic
    cmp byte [rdi + rcx], 'z'
    jg .taknic

    sub byte [rdi + rcx], 'a' - 'A'
    

.taknic:
    inc rcx
    jmp .zpet
    ;} snazit se drzet uvnitr tech pomyslnych zavorek
.hotovo:
    ret

    global nejmensikladne
nejmensikladne:
    ;mov rcx, 0x7FFFFFFFFFFFFFF                  ;minimum = max_long
    mov rcx , 0                                 ;i = 0
    movsx rsi, esi                              ; < N

.zpet:
    cmp rcx, rsi
    jge .hotovo
    cmp qword [rdi + rcx * 8],0                            ; if (pole [i]  >= 0 && pole [i] < minimum) minimum = pole [i]
    jl .preskoc
    cmp [rdi + rcx * 8], rax        ;?
    jg .preskoc
    mov rax, [rdi + rcx * 8] ; minimum = pole[i]

.preskoc:
    inc rcx     ;i++
    jmp .zpet
.hotovo:
    ret