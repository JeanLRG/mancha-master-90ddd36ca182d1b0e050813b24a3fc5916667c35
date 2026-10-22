; ponte.asm

        .equ    TICKS_POR_FATIA = 4000

; Funções para uso do mcc
_f_escreve_caractere:
        push    bp
        ld      bp, sp
        ld      r0, (bp+4)
        outb    r0, (1)
        ld      sp, bp
        pop     bp
        ret

_f_console_disponivel:
        push    bp
        ld      bp, sp
        call    bios_console_disponivel
        ld      sp, bp
        pop     bp
        ret

_f_console_le:
        push    bp
        ld      bp, sp
        call    bios_console_le
        ld      sp, bp
        pop     bp
        ret

_f_console_pronta_escrita:
        push    bp
        ld      bp, sp
        inb     r0, (2)
        and     r0, 1
        ld      sp, bp
        pop     bp
        ret

_f_so_imprime:
        push    bp
        ld      bp, sp
        ld      r0, (bp+4)
        call    bios_imprime
        ld      sp, bp
        pop     bp
        ret

_f_so_imprime_dec:
        push    bp
        ld      bp, sp
        ld      r0, (bp+4)
        call    bios_imprime_dec
        ld      sp, bp
        pop     bp
        ret

_f_so_para:
        halt
        jmp     _f_so_para

_f_halt_espera:
        halt
        jmp     _f_halt_espera

_f_obtem_ticks_por_fatia:
        ld      r0, TICKS_POR_FATIA
        ret

tratador_console_wrapper:
        push    r0
        ld      r0, (_g_cont_int_console)
        add     r0, 1
        st      r0, (_g_cont_int_console)
        pop     r0
        jmp     _bios_trata_console

; Inicialização do sistema
_kernel_inicio:
        ld      r0, TICKS_POR_FATIA
        ld      r1, r0
        shr     r1, 8
        outb    r1, (0x22)                  ; PORTA_RELOGIO_LIM_ALTO
        outb    r0, (0x23)                  ; PORTA_RELOGIO_LIM_BAIXO

        ld      r0, 5
        outb    r0, (0x30)                  ; Habilita interrupções de console e relógio

        ld      r0, escalonador_trampolim
        st      r0, (retomada_escalonador)

        ; Hook no vetor 8 (Console) para contar interrupções
        ld      r0, tratador_console_wrapper
        st      r0, (0x40)

        ; Popula a tabela de syscalls
        ld      r0, _ts_le
        st      r0, (tabela_syscalls+0)
        ld      r0, _ts_escreve
        st      r0, (tabela_syscalls+2)
        ld      r0, _ts_cria_proc
        st      r0, (tabela_syscalls+4)
        ld      r0, _ts_mata_proc
        st      r0, (tabela_syscalls+6)
        ld      r0, _ts_espera_proc
        st      r0, (tabela_syscalls+8)

        ; Chama o C para inicializar as tabelas
        ld      r0, pilha_sistema
        add     r0, -32
        push    r0
        call    _f_inicializa_so
        add     sp, 2

        ei
        ld      sp, pilha_sistema
        add     sp, -32
        rete


_ts_le:
        ld      r0, (_g_cont_int_syscall)
        add     r0, 1
        st      r0, (_g_cont_int_syscall)
        call    _f_sis_le
        ret

_ts_escreve:
        ld      r0, (_g_cont_int_syscall)
        add     r0, 1
        st      r0, (_g_cont_int_syscall)
        push    r1
        call    _f_sis_escreve
        add     sp, 2
        ret

_ts_cria_proc:
        ld      r0, (_g_cont_int_syscall)
        add     r0, 1
        st      r0, (_g_cont_int_syscall)
        push    r1
        call    _f_sis_cria_proc
        add     sp, 2
        ret

_ts_mata_proc:
        ld      r0, (_g_cont_int_syscall)
        add     r0, 1
        st      r0, (_g_cont_int_syscall)
        push    r1
        call    _f_sis_mata_proc
        add     sp, 2
        ret

_ts_espera_proc:
        ld      r0, (_g_cont_int_syscall)
        add     r0, 1
        st      r0, (_g_cont_int_syscall)
        push    r1
        call    _f_sis_espera_proc
        add     sp, 2
        ret

; Se o processo bloquear na syscall, o C chama essa função que descarta
; o retorno para a syscall e salta para o escalonador. O quadro salvo
; no "trap 7" fica intacto em pilha_sistema-32.
_f_sis_yield:
        ld      sp, pilha_sistema
        add     sp, -32
        jmp     escalonador_trampolim

escalonador_trampolim:
        ld      r0, sp
        push    r0
        call    _f_escalonador
        add     sp, 2
        rete


_f_usr_le:
        push    bp
        ld      bp, sp
        ld      r0, 0
        trap    7
        ld      sp, bp
        pop     bp
        ret

_f_usr_escreve:
        push    bp
        ld      bp, sp
        ld      r0, 1
        ld      r1, (bp+4)
        trap    7
        ld      sp, bp
        pop     bp
        ret

_f_usr_cria_proc:
        push    bp
        ld      bp, sp
        ld      r0, 2
        ld      r1, (bp+4)
        trap    7
        ld      sp, bp
        pop     bp
        ret

_f_usr_mata_proc:
        push    bp
        ld      bp, sp
        ld      r0, 3
        ld      r1, (bp+4)
        trap    7
        ld      sp, bp
        pop     bp
        ret

_f_usr_espera_proc:
        push    bp
        ld      bp, sp
        ld      r0, 4
        ld      r1, (bp+4)
        trap    7
        ld      sp, bp
        pop     bp
        ret
