; =========================================================
; T1 - random_10.asm (Interativo com E<texto>)
; Gera 10 números pseudo-aleatórios a cada entrada
; =========================================================

        .equ    pilha = 0x3F0

        .org    0
        .dw     main, pilha, 0, 0

        .org    0x80
main:
        ; 1. Configura o limite do relogio para FFFF (Portas HEXADECIMAIS)
        ldq     r0, 0xFF
        outb    r0, (0x22)
        ldq     r0, 0xFF
        outb    r0, (0x23)

        ; 2. Contador para 10 repetições
        ldq     r3, 10

proximo_numero:
        ; ==========================================
        ; 3. ESPERA A ENTRADA DO USUARIO (A Entropia)
        ; ==========================================
espera:
        in      r0, (2)      ; Lê o estado do teclado
        and     r0, 2        ; Verifica se tem caractere (bit 1)
        cmp     r0, 0
        jmpc    z, espera    ; Fica preso aqui ATÉ você digitar E<texto>

        ; Limpa a tecla digitada da memória para não ler duas vezes
        in      r0, (1)

        ; ==========================================
        ; 4. LÊ O RELÓGIO (Byte baixo) E CALCULA
        ; ==========================================
        in      r0, (0x21)   ; PORTA CORRETA DO RELOGIO

        ; Mistura com XOR 
        ld      r1, r0
        shl     r1, 3
        xor     r0, r1

        ; Mantém entre 0 e 255
        ldq     r1, 255
        and     r0, r1

        ; Calcula módulo 10
calcula:
        ldq     r1, 9
        cmp     r0, r1
        jmpc    le, imprime
        ldq     r1, -10
        add     r0, r1
        jmpq    calcula

imprime:
        ; Converte para ASCII
        ldq     r1, 48
        add     r1, r0

        ; Imprime o número
        out     r1, (1)

        ; Imprime Quebra de Linha (10) para forçar o buffer a mostrar na tela
        ldq     r1, 10
        out     r1, (1)

        ; Verifica se já imprimiu 10 vezes
        ldq     r1, -1
        add     r3, r1
        cmp     r3, 0
        jmpc    nz, proximo_numero

        ; Fim seguro
fim:
        jmpq    fim