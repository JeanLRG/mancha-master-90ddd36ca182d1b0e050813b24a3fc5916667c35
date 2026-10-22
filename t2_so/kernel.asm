; ===== código gerado por mcc =====
.text
_f_fila_insere:
	push bp
	ld bp, sp
	ld r0, (_g_fila_tamanho)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ge, _L6b0268ae_3
	ld r0, 0
	jmp _L6b0268ae_4
_L6b0268ae_3:
	ld r0, 1
_L6b0268ae_4:
	cmp r0, 0
	jmpc eq, _L6b0268ae_5
	ld sp, bp
	pop bp
	ret
_L6b0268ae_5:
	ld r0, _g_fila_prontos
	push r0
	ld r0, (_g_fila_fim)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+4)
	pop r1
	st r0, (r1)
	ld r0, (_g_fila_fim)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	ld r2, r0
	div r0, r1
	mul r0, r1
	sub r2, r0
	ld r0, r2
	st r0, (_g_fila_fim)
	ld r0, (_g_fila_tamanho)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (_g_fila_tamanho)
	ld sp, bp
	pop bp
	ret
_f_fila_remove:
	push bp
	ld bp, sp
	sub sp, 2
	ld r0, (_g_fila_tamanho)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_9
	ld r0, 0
	jmp _L6b0268ae_10
_L6b0268ae_9:
	ld r0, 1
_L6b0268ae_10:
	cmp r0, 0
	jmpc eq, _L6b0268ae_11
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
_L6b0268ae_11:
	ld r0, _g_fila_prontos
	push r0
	ld r0, (_g_fila_inicio)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	st r0, (bp+-2)
	ld r0, (_g_fila_inicio)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	ld r2, r0
	div r0, r1
	mul r0, r1
	sub r2, r0
	ld r0, r2
	st r0, (_g_fila_inicio)
	ld r0, (_g_fila_tamanho)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	sub r0, r1
	st r0, (_g_fila_tamanho)
	ld r0, (bp+-2)
	ld sp, bp
	pop bp
	ret
	ld sp, bp
	pop bp
	ret
_f_imprime_instrucoes:
	push bp
	ld bp, sp
	sub sp, 2
	ld r0, (bp+4)
	push r0
	ld r0, 4
	ld r1, r0
	pop r0
	mul r0, r1
	st r0, (bp+-2)
	ld r0, (bp+-2)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_2
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (bp+4)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_3
	push r0
	call _f_so_imprime
	add sp, 2
	ld sp, bp
	pop bp
	ret
_f_sis_cria_proc:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, 1
	xor r0, -1
	add r0, 1
	st r0, (bp+-4)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_44:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_47
	ld r0, 0
	jmp _L6b0268ae_48
_L6b0268ae_47:
	ld r0, 1
_L6b0268ae_48:
	cmp r0, 0
	jmpc eq, _L6b0268ae_46
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_49
	ld r0, 0
	jmp _L6b0268ae_50
_L6b0268ae_49:
	ld r0, 1
_L6b0268ae_50:
	cmp r0, 0
	jmpc eq, _L6b0268ae_51
	ld r0, (bp+-2)
	st r0, (bp+-4)
	jmp _L6b0268ae_46
_L6b0268ae_51:
_L6b0268ae_45:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_44
_L6b0268ae_46:
	ld r0, (bp+-4)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_52
	ld r0, 0
	jmp _L6b0268ae_53
_L6b0268ae_52:
	ld r0, 1
_L6b0268ae_53:
	cmp r0, 0
	jmpc eq, _L6b0268ae_54
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_55:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_58
	ld r0, 0
	jmp _L6b0268ae_59
_L6b0268ae_58:
	ld r0, 1
_L6b0268ae_59:
	cmp r0, 0
	jmpc eq, _L6b0268ae_57
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 6
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_60
	ld r0, 0
	jmp _L6b0268ae_61
_L6b0268ae_60:
	ld r0, 1
_L6b0268ae_61:
	cmp r0, 0
	jmpc eq, _L6b0268ae_62
	ld r0, (bp+-2)
	st r0, (bp+-4)
	jmp _L6b0268ae_57
_L6b0268ae_62:
_L6b0268ae_56:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_55
_L6b0268ae_57:
_L6b0268ae_54:
	ld r0, (bp+-4)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_63
	ld r0, 0
	jmp _L6b0268ae_64
_L6b0268ae_63:
	ld r0, 1
_L6b0268ae_64:
	cmp r0, 0
	jmpc eq, _L6b0268ae_65
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
_L6b0268ae_65:
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_66:
	ld r0, (bp+-2)
	push r0
	ld r0, 7
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_69
	ld r0, 0
	jmp _L6b0268ae_70
_L6b0268ae_69:
	ld r0, 1
_L6b0268ae_70:
	cmp r0, 0
	jmpc eq, _L6b0268ae_68
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
_L6b0268ae_67:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_66
_L6b0268ae_68:
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (_g_proximo_pid)
	pop r1
	st r0, (r1)
	ld r0, (_g_proximo_pid)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (_g_proximo_pid)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 500
	pop r1
	st r0, (r1+42)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+44)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+50)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+82)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+84)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+86)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (_g_relogio_ticks)
	pop r1
	st r0, (r1+46)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (_g_relogio_ticks)
	pop r1
	st r0, (r1+80)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+4)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+8)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_71:
	ld r0, (bp+-2)
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_74
	ld r0, 0
	jmp _L6b0268ae_75
_L6b0268ae_74:
	ld r0, 1
_L6b0268ae_75:
	cmp r0, 0
	jmpc eq, _L6b0268ae_73
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
_L6b0268ae_72:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_71
_L6b0268ae_73:
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, 6
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, _g_pilhas
	push r0
	ld r0, (bp+-4)
	mul r0, 200
	pop r1
	add r1, r0
	ld r0, r1
	push r0
	ld r0, 100
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, r1
	pop r1
	st r0, (r1)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, 7
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+4)
	pop r1
	st r0, (r1)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, 8
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
	ld r0, (_g_metrica_criados)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (_g_metrica_criados)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+2)
	ld r0, 1
	push r0
	ld r0, (bp+-4)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, (bp+-4)
	push r0
	call _f_fila_insere
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	ld sp, bp
	pop bp
	ret
	ld sp, bp
	pop bp
	ret
_f_imprime_metricas:
	push bp
	ld bp, sp
	sub sp, 10
	ld r0, _str6b0268ae_44
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_45
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_46
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_47
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_tipo_escalonador)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_92
	ld r0, 0
	jmp _L6b0268ae_93
_L6b0268ae_92:
	ld r0, 1
_L6b0268ae_93:
	cmp r0, 0
	jmpc eq, _L6b0268ae_94
	ld r0, _str6b0268ae_48
	push r0
	call _f_so_imprime
	add sp, 2
	jmp _L6b0268ae_95
_L6b0268ae_94:
	ld r0, _str6b0268ae_49
	push r0
	call _f_so_imprime
	add sp, 2
_L6b0268ae_95:
	ld r0, _str6b0268ae_50
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_metrica_criados)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_51
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_52
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_relogio_ticks)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	ld r0, _str6b0268ae_53
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_54
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_metrica_ocioso)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	ld r0, _str6b0268ae_55
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_56
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_57
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_relogio_ticks)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_58
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_cont_int_syscall)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_59
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_cont_int_console)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_60
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_61
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (_g_metrica_preemptoes)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_62
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_63
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_64
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_65
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_96:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_99
	ld r0, 0
	jmp _L6b0268ae_100
_L6b0268ae_99:
	ld r0, 1
_L6b0268ae_100:
	cmp r0, 0
	jmpc eq, _L6b0268ae_98
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_101
	ld r0, 0
	jmp _L6b0268ae_102
_L6b0268ae_101:
	ld r0, 1
_L6b0268ae_102:
	cmp r0, 0
	jmpc eq, _L6b0268ae_103
	ld r0, _str6b0268ae_66
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_67
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+48)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+46)
	ld r1, r0
	pop r0
	sub r0, r1
	st r0, (bp+-8)
	ld r0, _str6b0268ae_68
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (bp+-8)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	ld r0, _str6b0268ae_69
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_70
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+50)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_71
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, 3
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, 4
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	ld r1, r0
	pop r0
	add r0, r1
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, 5
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (bp+-4)
	ld r0, _str6b0268ae_72
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, 1
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_73
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, 2
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_74
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (bp+-4)
	push r0
	call _f_so_imprime_dec
	add sp, 2
	ld r0, _str6b0268ae_75
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, 3
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, 4
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	ld r1, r0
	pop r0
	add r0, r1
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, 5
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (bp+-6)
	ld r0, _str6b0268ae_76
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, 1
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	ld r0, _str6b0268ae_77
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, 2
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	ld r0, _str6b0268ae_78
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, (bp+-6)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	ld r0, _str6b0268ae_79
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _str6b0268ae_80
	push r0
	call _f_so_imprime
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+86)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc gt, _L6b0268ae_104
	ld r0, 0
	jmp _L6b0268ae_105
_L6b0268ae_104:
	ld r0, 1
_L6b0268ae_105:
	cmp r0, 0
	jmpc eq, _L6b0268ae_106
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+84)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+86)
	ld r1, r0
	pop r0
	div r0, r1
	st r0, (bp+-10)
	ld r0, (bp+-10)
	push r0
	call _f_imprime_instrucoes
	add sp, 2
	jmp _L6b0268ae_107
_L6b0268ae_106:
	ld r0, _str6b0268ae_81
	push r0
	call _f_so_imprime
	add sp, 2
_L6b0268ae_107:
	ld r0, _str6b0268ae_82
	push r0
	call _f_so_imprime
	add sp, 2
_L6b0268ae_103:
_L6b0268ae_97:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_96
_L6b0268ae_98:
	ld r0, _str6b0268ae_83
	push r0
	call _f_so_imprime
	add sp, 2
	ld sp, bp
	pop bp
	ret
_f_sis_mata_proc:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, 1
	xor r0, -1
	add r0, 1
	st r0, (bp+-4)
	ld r0, (bp+4)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_155
	ld r0, 0
	jmp _L6b0268ae_156
_L6b0268ae_155:
	ld r0, 1
_L6b0268ae_156:
	cmp r0, 0
	jmpc eq, _L6b0268ae_154
	ld r0, (_g_processo_atual)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_157
	ld r0, 0
	jmp _L6b0268ae_158
_L6b0268ae_157:
	ld r0, 1
_L6b0268ae_158:
	cmp r0, 0
	jmpc eq, _L6b0268ae_154
	ld r0, 1
	jmp _L6b0268ae_153
_L6b0268ae_154:
	ld r0, 0
_L6b0268ae_153:
	cmp r0, 0
	jmpc eq, _L6b0268ae_159
	ld r0, (_g_processo_atual)
	st r0, (bp+-4)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	st r0, (bp+4)
	jmp _L6b0268ae_160
_L6b0268ae_159:
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_161:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_164
	ld r0, 0
	jmp _L6b0268ae_165
_L6b0268ae_164:
	ld r0, 1
_L6b0268ae_165:
	cmp r0, 0
	jmpc eq, _L6b0268ae_163
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_170
	ld r0, 0
	jmp _L6b0268ae_171
_L6b0268ae_170:
	ld r0, 1
_L6b0268ae_171:
	cmp r0, 0
	jmpc eq, _L6b0268ae_169
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 6
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_172
	ld r0, 0
	jmp _L6b0268ae_173
_L6b0268ae_172:
	ld r0, 1
_L6b0268ae_173:
	cmp r0, 0
	jmpc eq, _L6b0268ae_169
	ld r0, 1
	jmp _L6b0268ae_168
_L6b0268ae_169:
	ld r0, 0
_L6b0268ae_168:
	cmp r0, 0
	jmpc eq, _L6b0268ae_167
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, (bp+4)
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_174
	ld r0, 0
	jmp _L6b0268ae_175
_L6b0268ae_174:
	ld r0, 1
_L6b0268ae_175:
	cmp r0, 0
	jmpc eq, _L6b0268ae_167
	ld r0, 1
	jmp _L6b0268ae_166
_L6b0268ae_167:
	ld r0, 0
_L6b0268ae_166:
	cmp r0, 0
	jmpc eq, _L6b0268ae_176
	ld r0, (bp+-2)
	st r0, (bp+-4)
	jmp _L6b0268ae_163
_L6b0268ae_176:
_L6b0268ae_162:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_161
_L6b0268ae_163:
_L6b0268ae_160:
	ld r0, (bp+-4)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_177
	ld r0, 0
	jmp _L6b0268ae_178
_L6b0268ae_177:
	ld r0, 1
_L6b0268ae_178:
	cmp r0, 0
	jmpc eq, _L6b0268ae_179
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
_L6b0268ae_179:
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (_g_relogio_ticks)
	pop r1
	st r0, (r1+48)
	ld r0, 6
	push r0
	ld r0, (bp+-4)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_180:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_183
	ld r0, 0
	jmp _L6b0268ae_184
_L6b0268ae_183:
	ld r0, 1
_L6b0268ae_184:
	cmp r0, 0
	jmpc eq, _L6b0268ae_182
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 5
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_187
	ld r0, 0
	jmp _L6b0268ae_188
_L6b0268ae_187:
	ld r0, 1
_L6b0268ae_188:
	cmp r0, 0
	jmpc eq, _L6b0268ae_186
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+4)
	push r0
	ld r0, (bp+4)
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_189
	ld r0, 0
	jmp _L6b0268ae_190
_L6b0268ae_189:
	ld r0, 1
_L6b0268ae_190:
	cmp r0, 0
	jmpc eq, _L6b0268ae_186
	ld r0, 1
	jmp _L6b0268ae_185
_L6b0268ae_186:
	ld r0, 0
_L6b0268ae_185:
	cmp r0, 0
	jmpc eq, _L6b0268ae_191
	ld r0, 1
	push r0
	ld r0, (bp+-2)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, 0
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
	ld r0, (bp+-2)
	push r0
	call _f_fila_insere
	add sp, 2
_L6b0268ae_191:
_L6b0268ae_181:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_180
_L6b0268ae_182:
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_192
	ld r0, 0
	jmp _L6b0268ae_193
_L6b0268ae_192:
	ld r0, 1
_L6b0268ae_193:
	cmp r0, 0
	jmpc eq, _L6b0268ae_194
	ld r0, _str6b0268ae_85
	push r0
	call _f_so_imprime
	add sp, 2
	call _f_imprime_metricas
	call _f_so_para
_L6b0268ae_194:
	ld r0, (bp+-4)
	push r0
	ld r0, (_g_processo_atual)
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_195
	ld r0, 0
	jmp _L6b0268ae_196
_L6b0268ae_195:
	ld r0, 1
_L6b0268ae_196:
	cmp r0, 0
	jmpc eq, _L6b0268ae_197
	call _f_sis_yield
_L6b0268ae_197:
	ld r0, 0
	ld sp, bp
	pop bp
	ret
	ld sp, bp
	pop bp
	ret
_f_sis_espera_proc:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, (_g_processo_atual)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_226
	ld r0, 0
	jmp _L6b0268ae_227
_L6b0268ae_226:
	ld r0, 1
_L6b0268ae_227:
	cmp r0, 0
	jmpc ne, _L6b0268ae_225
	ld r0, (bp+4)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_228
	ld r0, 0
	jmp _L6b0268ae_229
_L6b0268ae_228:
	ld r0, 1
_L6b0268ae_229:
	cmp r0, 0
	jmpc ne, _L6b0268ae_225
	ld r0, 0
	jmp _L6b0268ae_224
_L6b0268ae_225:
	ld r0, 1
_L6b0268ae_224:
	cmp r0, 0
	jmpc eq, _L6b0268ae_230
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
_L6b0268ae_230:
	ld r0, 0
	st r0, (bp+-4)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_231:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_234
	ld r0, 0
	jmp _L6b0268ae_235
_L6b0268ae_234:
	ld r0, 1
_L6b0268ae_235:
	cmp r0, 0
	jmpc eq, _L6b0268ae_233
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_240
	ld r0, 0
	jmp _L6b0268ae_241
_L6b0268ae_240:
	ld r0, 1
_L6b0268ae_241:
	cmp r0, 0
	jmpc eq, _L6b0268ae_239
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 6
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_242
	ld r0, 0
	jmp _L6b0268ae_243
_L6b0268ae_242:
	ld r0, 1
_L6b0268ae_243:
	cmp r0, 0
	jmpc eq, _L6b0268ae_239
	ld r0, 1
	jmp _L6b0268ae_238
_L6b0268ae_239:
	ld r0, 0
_L6b0268ae_238:
	cmp r0, 0
	jmpc eq, _L6b0268ae_237
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, (bp+4)
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_244
	ld r0, 0
	jmp _L6b0268ae_245
_L6b0268ae_244:
	ld r0, 1
_L6b0268ae_245:
	cmp r0, 0
	jmpc eq, _L6b0268ae_237
	ld r0, 1
	jmp _L6b0268ae_236
_L6b0268ae_237:
	ld r0, 0
_L6b0268ae_236:
	cmp r0, 0
	jmpc eq, _L6b0268ae_246
	ld r0, 1
	st r0, (bp+-4)
	jmp _L6b0268ae_233
_L6b0268ae_246:
_L6b0268ae_232:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_231
_L6b0268ae_233:
	ld r0, (bp+-4)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_247
	ld r0, 0
	jmp _L6b0268ae_248
_L6b0268ae_247:
	ld r0, 1
_L6b0268ae_248:
	cmp r0, 0
	jmpc eq, _L6b0268ae_249
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+4)
	pop r1
	st r0, (r1+4)
	ld r0, 5
	push r0
	ld r0, (_g_processo_atual)
	push r0
	call _f_muda_estado
	add sp, 4
	call _f_sis_yield
	ld r0, 0
	ld sp, bp
	pop bp
	ret
_L6b0268ae_249:
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
	ld sp, bp
	pop bp
	ret
_f_sis_le:
	push bp
	ld bp, sp
	ld r0, (_g_processo_atual)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_256
	ld r0, 0
	jmp _L6b0268ae_257
_L6b0268ae_256:
	ld r0, 1
_L6b0268ae_257:
	cmp r0, 0
	jmpc eq, _L6b0268ae_258
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
_L6b0268ae_258:
	call _f_console_disponivel
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_259
	ld r0, 0
	jmp _L6b0268ae_260
_L6b0268ae_259:
	ld r0, 1
_L6b0268ae_260:
	cmp r0, 0
	jmpc eq, _L6b0268ae_261
	call _f_console_le
	ld sp, bp
	pop bp
	ret
_L6b0268ae_261:
	ld r0, 3
	push r0
	ld r0, (_g_processo_atual)
	push r0
	call _f_muda_estado
	add sp, 4
	call _f_sis_yield
	ld r0, 0
	ld sp, bp
	pop bp
	ret
	ld sp, bp
	pop bp
	ret
_f_sis_escreve:
	push bp
	ld bp, sp
	ld r0, (_g_processo_atual)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_268
	ld r0, 0
	jmp _L6b0268ae_269
_L6b0268ae_268:
	ld r0, 1
_L6b0268ae_269:
	cmp r0, 0
	jmpc eq, _L6b0268ae_270
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld sp, bp
	pop bp
	ret
_L6b0268ae_270:
	call _f_console_pronta_escrita
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_271
	ld r0, 0
	jmp _L6b0268ae_272
_L6b0268ae_271:
	ld r0, 1
_L6b0268ae_272:
	cmp r0, 0
	jmpc eq, _L6b0268ae_273
	ld r0, (bp+4)
	push r0
	call _f_escreve_caractere
	add sp, 2
	ld r0, 0
	ld sp, bp
	pop bp
	ret
_L6b0268ae_273:
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+4)
	pop r1
	st r0, (r1+8)
	ld r0, 4
	push r0
	ld r0, (_g_processo_atual)
	push r0
	call _f_muda_estado
	add sp, 4
	call _f_sis_yield
	ld r0, 0
	ld sp, bp
	pop bp
	ret
	ld sp, bp
	pop bp
	ret
_f_muda_estado:
	push bp
	ld bp, sp
	sub sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	st r0, (bp+-2)
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 66
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, (_g_relogio_ticks)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+80)
	ld r1, r0
	pop r0
	sub r0, r1
	ld r1, r0
	pop r0
	add r0, r1
	pop r1
	st r0, (r1)
	ld r0, (bp+6)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_301
	ld r0, 0
	jmp _L6b0268ae_302
_L6b0268ae_301:
	ld r0, 1
_L6b0268ae_302:
	cmp r0, 0
	jmpc eq, _L6b0268ae_300
	ld r0, (bp+-2)
	push r0
	ld r0, 3
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_307
	ld r0, 0
	jmp _L6b0268ae_308
_L6b0268ae_307:
	ld r0, 1
_L6b0268ae_308:
	cmp r0, 0
	jmpc ne, _L6b0268ae_306
	ld r0, (bp+-2)
	push r0
	ld r0, 4
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_309
	ld r0, 0
	jmp _L6b0268ae_310
_L6b0268ae_309:
	ld r0, 1
_L6b0268ae_310:
	cmp r0, 0
	jmpc ne, _L6b0268ae_306
	ld r0, 0
	jmp _L6b0268ae_305
_L6b0268ae_306:
	ld r0, 1
_L6b0268ae_305:
	cmp r0, 0
	jmpc ne, _L6b0268ae_304
	ld r0, (bp+-2)
	push r0
	ld r0, 5
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_311
	ld r0, 0
	jmp _L6b0268ae_312
_L6b0268ae_311:
	ld r0, 1
_L6b0268ae_312:
	cmp r0, 0
	jmpc ne, _L6b0268ae_304
	ld r0, 0
	jmp _L6b0268ae_303
_L6b0268ae_304:
	ld r0, 1
_L6b0268ae_303:
	cmp r0, 0
	jmpc eq, _L6b0268ae_300
	ld r0, 1
	jmp _L6b0268ae_299
_L6b0268ae_300:
	ld r0, 0
_L6b0268ae_299:
	cmp r0, 0
	jmpc eq, _L6b0268ae_313
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (_g_relogio_ticks)
	pop r1
	st r0, (r1+82)
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+86)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	pop r1
	st r0, (r1+86)
_L6b0268ae_313:
	ld r0, (bp+6)
	push r0
	ld r0, 2
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_316
	ld r0, 0
	jmp _L6b0268ae_317
_L6b0268ae_316:
	ld r0, 1
_L6b0268ae_317:
	cmp r0, 0
	jmpc eq, _L6b0268ae_315
	ld r0, (bp+-2)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_318
	ld r0, 0
	jmp _L6b0268ae_319
_L6b0268ae_318:
	ld r0, 1
_L6b0268ae_319:
	cmp r0, 0
	jmpc eq, _L6b0268ae_315
	ld r0, 1
	jmp _L6b0268ae_314
_L6b0268ae_315:
	ld r0, 0
_L6b0268ae_314:
	cmp r0, 0
	jmpc eq, _L6b0268ae_320
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+82)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_321
	ld r0, 0
	jmp _L6b0268ae_322
_L6b0268ae_321:
	ld r0, 1
_L6b0268ae_322:
	cmp r0, 0
	jmpc eq, _L6b0268ae_323
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+84)
	push r0
	ld r0, (_g_relogio_ticks)
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+82)
	ld r1, r0
	pop r0
	sub r0, r1
	ld r1, r0
	pop r0
	add r0, r1
	pop r1
	st r0, (r1+84)
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+82)
_L6b0268ae_323:
_L6b0268ae_320:
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+6)
	pop r1
	st r0, (r1+2)
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (_g_relogio_ticks)
	pop r1
	st r0, (r1+80)
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, (bp+6)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (bp+4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 52
	push r0
	ld r0, (bp+6)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	pop r1
	st r0, (r1)
	ld sp, bp
	pop bp
	ret
_f_trata_pendencias:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_343:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_346
	ld r0, 0
	jmp _L6b0268ae_347
_L6b0268ae_346:
	ld r0, 1
_L6b0268ae_347:
	cmp r0, 0
	jmpc eq, _L6b0268ae_345
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 3
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_350
	ld r0, 0
	jmp _L6b0268ae_351
_L6b0268ae_350:
	ld r0, 1
_L6b0268ae_351:
	cmp r0, 0
	jmpc eq, _L6b0268ae_349
	call _f_console_disponivel
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_352
	ld r0, 0
	jmp _L6b0268ae_353
_L6b0268ae_352:
	ld r0, 1
_L6b0268ae_353:
	cmp r0, 0
	jmpc eq, _L6b0268ae_349
	ld r0, 1
	jmp _L6b0268ae_348
_L6b0268ae_349:
	ld r0, 0
_L6b0268ae_348:
	cmp r0, 0
	jmpc eq, _L6b0268ae_354
	call _f_console_le
	st r0, (bp+-4)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+-4)
	pop r1
	st r0, (r1+6)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, 0
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+-4)
	pop r1
	st r0, (r1)
	ld r0, 1
	push r0
	ld r0, (bp+-2)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, (bp+-2)
	push r0
	call _f_fila_insere
	add sp, 2
_L6b0268ae_354:
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 4
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_357
	ld r0, 0
	jmp _L6b0268ae_358
_L6b0268ae_357:
	ld r0, 1
_L6b0268ae_358:
	cmp r0, 0
	jmpc eq, _L6b0268ae_356
	call _f_console_pronta_escrita
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_359
	ld r0, 0
	jmp _L6b0268ae_360
_L6b0268ae_359:
	ld r0, 1
_L6b0268ae_360:
	cmp r0, 0
	jmpc eq, _L6b0268ae_356
	ld r0, 1
	jmp _L6b0268ae_355
_L6b0268ae_356:
	ld r0, 0
_L6b0268ae_355:
	cmp r0, 0
	jmpc eq, _L6b0268ae_361
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+8)
	push r0
	call _f_escreve_caractere
	add sp, 2
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, 0
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
	ld r0, 1
	push r0
	ld r0, (bp+-2)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, (bp+-2)
	push r0
	call _f_fila_insere
	add sp, 2
_L6b0268ae_361:
_L6b0268ae_344:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_343
_L6b0268ae_345:
	ld sp, bp
	pop bp
	ret
_f_atualiza_prio_e_salva:
	push bp
	ld bp, sp
	sub sp, 6
	ld r0, (_g_processo_atual)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_388
	ld r0, 0
	jmp _L6b0268ae_389
_L6b0268ae_388:
	ld r0, 1
_L6b0268ae_389:
	cmp r0, 0
	jmpc eq, _L6b0268ae_387
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_390
	ld r0, 0
	jmp _L6b0268ae_391
_L6b0268ae_390:
	ld r0, 1
_L6b0268ae_391:
	cmp r0, 0
	jmpc eq, _L6b0268ae_387
	ld r0, 1
	jmp _L6b0268ae_386
_L6b0268ae_387:
	ld r0, 0
_L6b0268ae_386:
	cmp r0, 0
	jmpc eq, _L6b0268ae_385
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 6
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_392
	ld r0, 0
	jmp _L6b0268ae_393
_L6b0268ae_392:
	ld r0, 1
_L6b0268ae_393:
	cmp r0, 0
	jmpc eq, _L6b0268ae_385
	ld r0, 1
	jmp _L6b0268ae_384
_L6b0268ae_385:
	ld r0, 0
_L6b0268ae_384:
	cmp r0, 0
	jmpc eq, _L6b0268ae_394
	ld r0, 3
	push r0
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+44)
	ld r1, r0
	pop r0
	sub r0, r1
	st r0, (bp+-4)
	ld r0, (bp+-4)
	push r0
	ld r0, 1000
	ld r1, r0
	pop r0
	mul r0, r1
	push r0
	ld r0, 3
	ld r1, r0
	pop r0
	div r0, r1
	st r0, (bp+-6)
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+42)
	push r0
	ld r0, (bp+-6)
	ld r1, r0
	pop r0
	add r0, r1
	push r0
	ld r0, 2
	ld r1, r0
	pop r0
	div r0, r1
	pop r1
	st r0, (r1+42)
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 2
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_395
	ld r0, 0
	jmp _L6b0268ae_396
_L6b0268ae_395:
	ld r0, 1
_L6b0268ae_396:
	cmp r0, 0
	jmpc eq, _L6b0268ae_397
	ld r0, (bp+6)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_398
	ld r0, 0
	jmp _L6b0268ae_399
_L6b0268ae_398:
	ld r0, 1
_L6b0268ae_399:
	cmp r0, 0
	jmpc eq, _L6b0268ae_400
	ld r0, 1
	push r0
	ld r0, (_g_processo_atual)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+50)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	pop r1
	st r0, (r1+50)
	ld r0, (_g_metrica_preemptoes)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (_g_metrica_preemptoes)
	ld r0, (_g_processo_atual)
	push r0
	call _f_fila_insere
	add sp, 2
_L6b0268ae_400:
_L6b0268ae_397:
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_401:
	ld r0, (bp+-2)
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_404
	ld r0, 0
	jmp _L6b0268ae_405
_L6b0268ae_404:
	ld r0, 1
_L6b0268ae_405:
	cmp r0, 0
	jmpc eq, _L6b0268ae_403
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+4)
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	pop r1
	st r0, (r1)
_L6b0268ae_402:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_401
_L6b0268ae_403:
_L6b0268ae_394:
	ld sp, bp
	pop bp
	ret
_f_escalonador:
	push bp
	ld bp, sp
	sub sp, 10
	ld r0, (_g_relogio_ticks)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (_g_relogio_ticks)
	call _f_trata_pendencias
	ld r0, 0
	st r0, (bp+-10)
	ld r0, (_g_processo_atual)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_465
	ld r0, 0
	jmp _L6b0268ae_466
_L6b0268ae_465:
	ld r0, 1
_L6b0268ae_466:
	cmp r0, 0
	jmpc eq, _L6b0268ae_464
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 2
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_467
	ld r0, 0
	jmp _L6b0268ae_468
_L6b0268ae_467:
	ld r0, 1
_L6b0268ae_468:
	cmp r0, 0
	jmpc eq, _L6b0268ae_464
	ld r0, 1
	jmp _L6b0268ae_463
_L6b0268ae_464:
	ld r0, 0
_L6b0268ae_463:
	cmp r0, 0
	jmpc eq, _L6b0268ae_469
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+44)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	sub r0, r1
	pop r1
	st r0, (r1+44)
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+44)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc le, _L6b0268ae_470
	ld r0, 0
	jmp _L6b0268ae_471
_L6b0268ae_470:
	ld r0, 1
_L6b0268ae_471:
	cmp r0, 0
	jmpc eq, _L6b0268ae_472
	ld r0, 1
	st r0, (bp+-10)
_L6b0268ae_472:
	jmp _L6b0268ae_473
_L6b0268ae_469:
	ld r0, 1
	st r0, (bp+-10)
_L6b0268ae_473:
	ld r0, (bp+-10)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_474
	ld r0, 0
	jmp _L6b0268ae_475
_L6b0268ae_474:
	ld r0, 1
_L6b0268ae_475:
	cmp r0, 0
	jmpc eq, _L6b0268ae_476
	ld r0, (bp+-10)
	push r0
	ld r0, (bp+4)
	push r0
	call _f_atualiza_prio_e_salva
	add sp, 4
	ld r0, 1
	xor r0, -1
	add r0, 1
	st r0, (bp+-6)
	ld r0, (_g_tipo_escalonador)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_477
	ld r0, 0
	jmp _L6b0268ae_478
_L6b0268ae_477:
	ld r0, 1
_L6b0268ae_478:
	cmp r0, 0
	jmpc eq, _L6b0268ae_479
_L6b0268ae_480:
	ld r0, (_g_fila_tamanho)
	push r0
	ld r0, 0
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc gt, _L6b0268ae_482
	ld r0, 0
	jmp _L6b0268ae_483
_L6b0268ae_482:
	ld r0, 1
_L6b0268ae_483:
	cmp r0, 0
	jmpc eq, _L6b0268ae_481
	call _f_fila_remove
	st r0, (bp+-4)
	ld r0, _g_processos
	push r0
	ld r0, (bp+-4)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_484
	ld r0, 0
	jmp _L6b0268ae_485
_L6b0268ae_484:
	ld r0, 1
_L6b0268ae_485:
	cmp r0, 0
	jmpc eq, _L6b0268ae_486
	ld r0, (bp+-4)
	st r0, (bp+-6)
	jmp _L6b0268ae_481
_L6b0268ae_486:
	jmp _L6b0268ae_480
_L6b0268ae_481:
	jmp _L6b0268ae_487
_L6b0268ae_479:
	ld r0, 9999
	st r0, (bp+-8)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_488:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_491
	ld r0, 0
	jmp _L6b0268ae_492
_L6b0268ae_491:
	ld r0, 1
_L6b0268ae_492:
	cmp r0, 0
	jmpc eq, _L6b0268ae_490
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+2)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc eq, _L6b0268ae_495
	ld r0, 0
	jmp _L6b0268ae_496
_L6b0268ae_495:
	ld r0, 1
_L6b0268ae_496:
	cmp r0, 0
	jmpc eq, _L6b0268ae_494
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+42)
	push r0
	ld r0, (bp+-8)
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_497
	ld r0, 0
	jmp _L6b0268ae_498
_L6b0268ae_497:
	ld r0, 1
_L6b0268ae_498:
	cmp r0, 0
	jmpc eq, _L6b0268ae_494
	ld r0, 1
	jmp _L6b0268ae_493
_L6b0268ae_494:
	ld r0, 0
_L6b0268ae_493:
	cmp r0, 0
	jmpc eq, _L6b0268ae_499
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, (r1+42)
	st r0, (bp+-8)
	ld r0, (bp+-2)
	st r0, (bp+-6)
_L6b0268ae_499:
_L6b0268ae_489:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_488
_L6b0268ae_490:
_L6b0268ae_487:
	ld r0, (bp+-6)
	push r0
	ld r0, 1
	xor r0, -1
	add r0, 1
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc ne, _L6b0268ae_500
	ld r0, 0
	jmp _L6b0268ae_501
_L6b0268ae_500:
	ld r0, 1
_L6b0268ae_501:
	cmp r0, 0
	jmpc eq, _L6b0268ae_502
	ld r0, (bp+-6)
	st r0, (_g_processo_atual)
	ld r0, 2
	push r0
	ld r0, (bp+-6)
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, _g_processos
	push r0
	ld r0, (bp+-6)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 3
	pop r1
	st r0, (r1+44)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_503:
	ld r0, (bp+-2)
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_506
	ld r0, 0
	jmp _L6b0268ae_507
_L6b0268ae_506:
	ld r0, 1
_L6b0268ae_507:
	cmp r0, 0
	jmpc eq, _L6b0268ae_505
	ld r0, (bp+4)
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, (bp+-6)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	pop r1
	st r0, (r1)
_L6b0268ae_504:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_503
_L6b0268ae_505:
	jmp _L6b0268ae_508
_L6b0268ae_502:
	ld r0, 1
	xor r0, -1
	add r0, 1
	st r0, (_g_processo_atual)
	ld r0, (_g_metrica_ocioso)
	push r0
	ld r0, 1
	ld r1, r0
	pop r0
	add r0, r1
	st r0, (_g_metrica_ocioso)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_509:
	ld r0, (bp+-2)
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_512
	ld r0, 0
	jmp _L6b0268ae_513
_L6b0268ae_512:
	ld r0, 1
_L6b0268ae_513:
	cmp r0, 0
	jmpc eq, _L6b0268ae_511
	ld r0, (bp+4)
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1)
_L6b0268ae_510:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_509
_L6b0268ae_511:
	ld r0, (bp+4)
	push r0
	ld r0, 7
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, _f_halt_espera
	pop r1
	st r0, (r1)
	ld r0, (bp+4)
	push r0
	ld r0, 8
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, 40960
	pop r1
	st r0, (r1)
_L6b0268ae_508:
	jmp _L6b0268ae_514
_L6b0268ae_476:
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_515:
	ld r0, (bp+-2)
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_518
	ld r0, 0
	jmp _L6b0268ae_519
_L6b0268ae_518:
	ld r0, 1
_L6b0268ae_519:
	cmp r0, 0
	jmpc eq, _L6b0268ae_517
	ld r0, _g_processos
	push r0
	ld r0, (_g_processo_atual)
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, (bp+4)
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	pop r1
	st r0, (r1)
_L6b0268ae_516:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_515
_L6b0268ae_517:
_L6b0268ae_514:
	ld sp, bp
	pop bp
	ret
_f_processoA:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_530:
	ld r0, (bp+-2)
	push r0
	ld r0, 3
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_533
	ld r0, 0
	jmp _L6b0268ae_534
_L6b0268ae_533:
	ld r0, 1
_L6b0268ae_534:
	cmp r0, 0
	jmpc eq, _L6b0268ae_532
	ld r0, 65
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, 0
	st r0, (bp+-4)
_L6b0268ae_535:
	ld r0, (bp+-4)
	push r0
	ld r0, 800
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_538
	ld r0, 0
	jmp _L6b0268ae_539
_L6b0268ae_538:
	ld r0, 1
_L6b0268ae_539:
	cmp r0, 0
	jmpc eq, _L6b0268ae_537
_L6b0268ae_536:
	ld r0, (bp+-4)
	push r0
	add r0, 1
	st r0, (bp+-4)
	pop r0
	jmp _L6b0268ae_535
_L6b0268ae_537:
_L6b0268ae_531:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_530
_L6b0268ae_532:
	ld r0, 0
	push r0
	call _f_usr_mata_proc
	add sp, 2
	ld sp, bp
	pop bp
	ret
_f_processoB:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_550:
	ld r0, (bp+-2)
	push r0
	ld r0, 3
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_553
	ld r0, 0
	jmp _L6b0268ae_554
_L6b0268ae_553:
	ld r0, 1
_L6b0268ae_554:
	cmp r0, 0
	jmpc eq, _L6b0268ae_552
	ld r0, 66
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, 0
	st r0, (bp+-4)
_L6b0268ae_555:
	ld r0, (bp+-4)
	push r0
	ld r0, 800
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_558
	ld r0, 0
	jmp _L6b0268ae_559
_L6b0268ae_558:
	ld r0, 1
_L6b0268ae_559:
	cmp r0, 0
	jmpc eq, _L6b0268ae_557
_L6b0268ae_556:
	ld r0, (bp+-4)
	push r0
	add r0, 1
	st r0, (bp+-4)
	pop r0
	jmp _L6b0268ae_555
_L6b0268ae_557:
_L6b0268ae_551:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_550
_L6b0268ae_552:
	ld r0, 0
	push r0
	call _f_usr_mata_proc
	add sp, 2
	ld sp, bp
	pop bp
	ret
_f_processoC:
	push bp
	ld bp, sp
	sub sp, 4
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_570:
	ld r0, (bp+-2)
	push r0
	ld r0, 3
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_573
	ld r0, 0
	jmp _L6b0268ae_574
_L6b0268ae_573:
	ld r0, 1
_L6b0268ae_574:
	cmp r0, 0
	jmpc eq, _L6b0268ae_572
	ld r0, 67
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, 0
	st r0, (bp+-4)
_L6b0268ae_575:
	ld r0, (bp+-4)
	push r0
	ld r0, 800
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_578
	ld r0, 0
	jmp _L6b0268ae_579
_L6b0268ae_578:
	ld r0, 1
_L6b0268ae_579:
	cmp r0, 0
	jmpc eq, _L6b0268ae_577
_L6b0268ae_576:
	ld r0, (bp+-4)
	push r0
	add r0, 1
	st r0, (bp+-4)
	pop r0
	jmp _L6b0268ae_575
_L6b0268ae_577:
_L6b0268ae_571:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_570
_L6b0268ae_572:
	ld r0, 0
	push r0
	call _f_usr_mata_proc
	add sp, 2
	ld sp, bp
	pop bp
	ret
_f_init:
	push bp
	ld bp, sp
	sub sp, 6
	ld r0, 73
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, _f_processoA
	push r0
	call _f_usr_cria_proc
	add sp, 2
	st r0, (bp+-2)
	ld r0, _f_processoB
	push r0
	call _f_usr_cria_proc
	add sp, 2
	st r0, (bp+-4)
	ld r0, _f_processoC
	push r0
	call _f_usr_cria_proc
	add sp, 2
	st r0, (bp+-6)
	ld r0, (bp+-2)
	push r0
	call _f_usr_espera_proc
	add sp, 2
	ld r0, 49
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, (bp+-4)
	push r0
	call _f_usr_espera_proc
	add sp, 2
	ld r0, 50
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, (bp+-6)
	push r0
	call _f_usr_espera_proc
	add sp, 2
	ld r0, 51
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, 10
	push r0
	call _f_usr_escreve
	add sp, 2
	ld r0, 0
	push r0
	call _f_usr_mata_proc
	add sp, 2
	ld sp, bp
	pop bp
	ret
_f_inicializa_so:
	push bp
	ld bp, sp
	sub sp, 2
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_590:
	ld r0, (bp+-2)
	push r0
	ld r0, 10
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_593
	ld r0, 0
	jmp _L6b0268ae_594
_L6b0268ae_593:
	ld r0, 1
_L6b0268ae_594:
	cmp r0, 0
	jmpc eq, _L6b0268ae_592
	ld r0, _g_processos
	push r0
	ld r0, (bp+-2)
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 0
	pop r1
	st r0, (r1+2)
_L6b0268ae_591:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_590
_L6b0268ae_592:
	ld r0, 1
	xor r0, -1
	add r0, 1
	st r0, (_g_processo_atual)
	ld r0, _f_init
	push r0
	call _f_sis_cria_proc
	add sp, 2
	ld r0, 0
	st r0, (_g_processo_atual)
	ld r0, 2
	push r0
	ld r0, 0
	push r0
	call _f_muda_estado
	add sp, 4
	ld r0, _g_processos
	push r0
	ld r0, 0
	mul r0, 88
	pop r1
	add r1, r0
	push r1
	ld r0, 3
	pop r1
	st r0, (r1+44)
	ld r0, 0
	st r0, (bp+-2)
_L6b0268ae_595:
	ld r0, (bp+-2)
	push r0
	ld r0, 16
	ld r1, r0
	pop r0
	cmp r0, r1
	jmpc lt, _L6b0268ae_598
	ld r0, 0
	jmp _L6b0268ae_599
_L6b0268ae_598:
	ld r0, 1
_L6b0268ae_599:
	cmp r0, 0
	jmpc eq, _L6b0268ae_597
	ld r0, (bp+4)
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	push r1
	ld r0, _g_processos
	push r0
	ld r0, 0
	mul r0, 88
	pop r1
	add r1, r0
	ld r0, r1
	add r0, 10
	push r0
	ld r0, (bp+-2)
	mul r0, 2
	pop r1
	add r1, r0
	ld r0, (r1)
	pop r1
	st r0, (r1)
_L6b0268ae_596:
	ld r0, (bp+-2)
	push r0
	add r0, 1
	st r0, (bp+-2)
	pop r0
	jmp _L6b0268ae_595
_L6b0268ae_597:
	ld sp, bp
	pop bp
	ret

.data
_g_tipo_escalonador:
	.dw 1
_g_processos:
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
_g_pilhas:
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
_g_processo_atual:
	.dw -1
_g_proximo_pid:
	.dw 1
_g_fila_prontos:
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
	.db 0
_g_fila_inicio:
	.dw 0
_g_fila_fim:
	.dw 0
_g_fila_tamanho:
	.dw 0
_g_cont_int_syscall:
	.dw 0
_g_cont_int_console:
	.dw 0
_g_metrica_criados:
	.dw 0
_g_metrica_ocioso:
	.dw 0
_g_metrica_preemptoes:
	.dw 0
_g_relogio_ticks:
	.dw 0

; ----- literais de string -----
_str6b0268ae_0:
	.db 48, 48, 48, 32, 105, 110, 115, 116, 32, 40, 0
_str6b0268ae_1:
	.db 32, 116, 41, 0
_str6b0268ae_2:
	.db 48, 48, 48, 32, 105, 110, 115, 116, 32, 40, 0
_str6b0268ae_3:
	.db 32, 116, 41, 0
_str6b0268ae_4:
	.db 10, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 10, 0
_str6b0268ae_5:
	.db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 77, 69, 84, 82, 73, 67, 65, 83, 32, 68, 65, 32, 69, 88, 69, 67, 85, 67, 65, 79, 32, 68, 79, 32, 83, 79, 32, 32, 32, 32, 32, 32, 32, 32, 10, 0
_str6b0268ae_6:
	.db 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 10, 0
_str6b0268ae_7:
	.db 69, 115, 99, 97, 108, 111, 110, 97, 100, 111, 114, 32, 117, 116, 105, 108, 105, 122, 97, 100, 111, 58, 32, 0
_str6b0268ae_8:
	.db 82, 79, 85, 78, 68, 45, 82, 79, 66, 73, 78, 32, 40, 67, 73, 82, 67, 85, 76, 65, 82, 41, 10, 0
_str6b0268ae_9:
	.db 80, 82, 73, 79, 82, 73, 68, 65, 68, 69, 32, 68, 73, 78, 65, 77, 73, 67, 65, 10, 0
_str6b0268ae_10:
	.db 49, 46, 32, 78, 117, 109, 101, 114, 111, 32, 100, 101, 32, 112, 114, 111, 99, 101, 115, 115, 111, 115, 32, 99, 114, 105, 97, 100, 111, 115, 58, 32, 0
_str6b0268ae_11:
	.db 10, 0
_str6b0268ae_12:
	.db 50, 46, 32, 84, 101, 109, 112, 111, 32, 116, 111, 116, 97, 108, 32, 100, 101, 32, 101, 120, 101, 99, 117, 99, 97, 111, 58, 32, 0
_str6b0268ae_13:
	.db 10, 0
_str6b0268ae_14:
	.db 51, 46, 32, 84, 101, 109, 112, 111, 32, 116, 111, 116, 97, 108, 32, 111, 99, 105, 111, 115, 111, 32, 40, 115, 105, 115, 116, 101, 109, 97, 32, 111, 99, 105, 111, 115, 111, 41, 58, 32, 0
_str6b0268ae_15:
	.db 10, 0
_str6b0268ae_16:
	.db 52, 46, 32, 73, 110, 116, 101, 114, 114, 117, 112, 99, 111, 101, 115, 32, 114, 101, 99, 101, 98, 105, 100, 97, 115, 32, 112, 111, 114, 32, 116, 105, 112, 111, 58, 10, 0
_str6b0268ae_17:
	.db 32, 32, 32, 45, 32, 82, 101, 108, 111, 103, 105, 111, 32, 40, 116, 105, 112, 111, 32, 49, 48, 41, 58, 32, 0
_str6b0268ae_18:
	.db 10, 32, 32, 32, 45, 32, 67, 104, 97, 109, 97, 100, 97, 115, 32, 100, 101, 32, 115, 105, 115, 116, 101, 109, 97, 32, 40, 116, 105, 112, 111, 32, 55, 41, 58, 32, 0
_str6b0268ae_19:
	.db 10, 32, 32, 32, 45, 32, 67, 111, 110, 115, 111, 108, 101, 32, 40, 116, 105, 112, 111, 32, 56, 41, 58, 32, 0
_str6b0268ae_20:
	.db 10, 0
_str6b0268ae_21:
	.db 53, 46, 32, 78, 117, 109, 101, 114, 111, 32, 100, 101, 32, 112, 114, 101, 101, 109, 112, 116, 111, 101, 115, 32, 103, 108, 111, 98, 97, 105, 115, 58, 32, 0
_str6b0268ae_22:
	.db 10, 0
_str6b0268ae_23:
	.db 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 10, 0
_str6b0268ae_24:
	.db 68, 69, 84, 65, 76, 72, 69, 83, 32, 80, 79, 82, 32, 80, 82, 79, 67, 69, 83, 83, 79, 58, 10, 0
_str6b0268ae_25:
	.db 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 10, 0
_str6b0268ae_26:
	.db 80, 114, 111, 99, 101, 115, 115, 111, 32, 80, 73, 68, 32, 0
_str6b0268ae_27:
	.db 58, 10, 0
_str6b0268ae_28:
	.db 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 100, 101, 32, 114, 101, 116, 111, 114, 110, 111, 58, 32, 0
_str6b0268ae_29:
	.db 10, 0
_str6b0268ae_30:
	.db 32, 32, 45, 32, 78, 117, 109, 101, 114, 111, 32, 100, 101, 32, 112, 114, 101, 101, 109, 112, 116, 111, 101, 115, 58, 32, 0
_str6b0268ae_31:
	.db 10, 0
_str6b0268ae_32:
	.db 32, 32, 45, 32, 86, 101, 122, 101, 115, 32, 101, 109, 32, 99, 97, 100, 97, 32, 101, 115, 116, 97, 100, 111, 58, 32, 80, 114, 111, 110, 116, 111, 61, 0
_str6b0268ae_33:
	.db 32, 69, 120, 101, 99, 61, 0
_str6b0268ae_34:
	.db 32, 66, 108, 111, 113, 61, 0
_str6b0268ae_35:
	.db 10, 0
_str6b0268ae_36:
	.db 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 101, 109, 32, 80, 114, 111, 110, 116, 111, 58, 32, 0
_str6b0268ae_37:
	.db 10, 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 101, 109, 32, 69, 120, 101, 99, 58, 32, 32, 32, 0
_str6b0268ae_38:
	.db 10, 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 101, 109, 32, 66, 108, 111, 113, 58, 32, 32, 32, 0
_str6b0268ae_39:
	.db 10, 0
_str6b0268ae_40:
	.db 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 109, 101, 100, 105, 111, 32, 100, 101, 32, 114, 101, 115, 112, 111, 115, 116, 97, 58, 32, 0
_str6b0268ae_41:
	.db 78, 47, 65, 32, 40, 110, 97, 111, 32, 98, 108, 111, 113, 117, 101, 111, 117, 41, 0
_str6b0268ae_42:
	.db 10, 0
_str6b0268ae_43:
	.db 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 10, 0
_str6b0268ae_44:
	.db 10, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 10, 0
_str6b0268ae_45:
	.db 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 77, 69, 84, 82, 73, 67, 65, 83, 32, 68, 65, 32, 69, 88, 69, 67, 85, 67, 65, 79, 32, 68, 79, 32, 83, 79, 32, 32, 32, 32, 32, 32, 32, 32, 10, 0
_str6b0268ae_46:
	.db 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 10, 0
_str6b0268ae_47:
	.db 69, 115, 99, 97, 108, 111, 110, 97, 100, 111, 114, 32, 117, 116, 105, 108, 105, 122, 97, 100, 111, 58, 32, 0
_str6b0268ae_48:
	.db 82, 79, 85, 78, 68, 45, 82, 79, 66, 73, 78, 32, 40, 67, 73, 82, 67, 85, 76, 65, 82, 41, 10, 0
_str6b0268ae_49:
	.db 80, 82, 73, 79, 82, 73, 68, 65, 68, 69, 32, 68, 73, 78, 65, 77, 73, 67, 65, 10, 0
_str6b0268ae_50:
	.db 49, 46, 32, 78, 117, 109, 101, 114, 111, 32, 100, 101, 32, 112, 114, 111, 99, 101, 115, 115, 111, 115, 32, 99, 114, 105, 97, 100, 111, 115, 58, 32, 0
_str6b0268ae_51:
	.db 10, 0
_str6b0268ae_52:
	.db 50, 46, 32, 84, 101, 109, 112, 111, 32, 116, 111, 116, 97, 108, 32, 100, 101, 32, 101, 120, 101, 99, 117, 99, 97, 111, 58, 32, 0
_str6b0268ae_53:
	.db 10, 0
_str6b0268ae_54:
	.db 51, 46, 32, 84, 101, 109, 112, 111, 32, 116, 111, 116, 97, 108, 32, 111, 99, 105, 111, 115, 111, 32, 40, 115, 105, 115, 116, 101, 109, 97, 32, 111, 99, 105, 111, 115, 111, 41, 58, 32, 0
_str6b0268ae_55:
	.db 10, 0
_str6b0268ae_56:
	.db 52, 46, 32, 73, 110, 116, 101, 114, 114, 117, 112, 99, 111, 101, 115, 32, 114, 101, 99, 101, 98, 105, 100, 97, 115, 32, 112, 111, 114, 32, 116, 105, 112, 111, 58, 10, 0
_str6b0268ae_57:
	.db 32, 32, 32, 45, 32, 82, 101, 108, 111, 103, 105, 111, 32, 40, 116, 105, 112, 111, 32, 49, 48, 41, 58, 32, 0
_str6b0268ae_58:
	.db 10, 32, 32, 32, 45, 32, 67, 104, 97, 109, 97, 100, 97, 115, 32, 100, 101, 32, 115, 105, 115, 116, 101, 109, 97, 32, 40, 116, 105, 112, 111, 32, 55, 41, 58, 32, 0
_str6b0268ae_59:
	.db 10, 32, 32, 32, 45, 32, 67, 111, 110, 115, 111, 108, 101, 32, 40, 116, 105, 112, 111, 32, 56, 41, 58, 32, 0
_str6b0268ae_60:
	.db 10, 0
_str6b0268ae_61:
	.db 53, 46, 32, 78, 117, 109, 101, 114, 111, 32, 100, 101, 32, 112, 114, 101, 101, 109, 112, 116, 111, 101, 115, 32, 103, 108, 111, 98, 97, 105, 115, 58, 32, 0
_str6b0268ae_62:
	.db 10, 0
_str6b0268ae_63:
	.db 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 10, 0
_str6b0268ae_64:
	.db 68, 69, 84, 65, 76, 72, 69, 83, 32, 80, 79, 82, 32, 80, 82, 79, 67, 69, 83, 83, 79, 58, 10, 0
_str6b0268ae_65:
	.db 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 10, 0
_str6b0268ae_66:
	.db 80, 114, 111, 99, 101, 115, 115, 111, 32, 80, 73, 68, 32, 0
_str6b0268ae_67:
	.db 58, 10, 0
_str6b0268ae_68:
	.db 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 100, 101, 32, 114, 101, 116, 111, 114, 110, 111, 58, 32, 0
_str6b0268ae_69:
	.db 10, 0
_str6b0268ae_70:
	.db 32, 32, 45, 32, 78, 117, 109, 101, 114, 111, 32, 100, 101, 32, 112, 114, 101, 101, 109, 112, 116, 111, 101, 115, 58, 32, 0
_str6b0268ae_71:
	.db 10, 0
_str6b0268ae_72:
	.db 32, 32, 45, 32, 86, 101, 122, 101, 115, 32, 101, 109, 32, 99, 97, 100, 97, 32, 101, 115, 116, 97, 100, 111, 58, 32, 80, 114, 111, 110, 116, 111, 61, 0
_str6b0268ae_73:
	.db 32, 69, 120, 101, 99, 61, 0
_str6b0268ae_74:
	.db 32, 66, 108, 111, 113, 61, 0
_str6b0268ae_75:
	.db 10, 0
_str6b0268ae_76:
	.db 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 101, 109, 32, 80, 114, 111, 110, 116, 111, 58, 32, 0
_str6b0268ae_77:
	.db 10, 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 101, 109, 32, 69, 120, 101, 99, 58, 32, 32, 32, 0
_str6b0268ae_78:
	.db 10, 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 101, 109, 32, 66, 108, 111, 113, 58, 32, 32, 32, 0
_str6b0268ae_79:
	.db 10, 0
_str6b0268ae_80:
	.db 32, 32, 45, 32, 84, 101, 109, 112, 111, 32, 109, 101, 100, 105, 111, 32, 100, 101, 32, 114, 101, 115, 112, 111, 115, 116, 97, 58, 32, 0
_str6b0268ae_81:
	.db 78, 47, 65, 32, 40, 110, 97, 111, 32, 98, 108, 111, 113, 117, 101, 111, 117, 41, 0
_str6b0268ae_82:
	.db 10, 0
_str6b0268ae_83:
	.db 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 61, 10, 0
_str6b0268ae_84:
	.db 10, 91, 83, 79, 93, 32, 80, 114, 111, 99, 101, 115, 115, 111, 32, 105, 110, 105, 116, 32, 116, 101, 114, 109, 105, 110, 111, 117, 46, 32, 65, 112, 114, 101, 115, 101, 110, 116, 97, 110, 100, 111, 32, 109, 101, 116, 114, 105, 99, 97, 115, 32, 101, 32, 100, 101, 115, 108, 105, 103, 97, 110, 100, 111, 46, 10, 0
_str6b0268ae_85:
	.db 10, 91, 83, 79, 93, 32, 80, 114, 111, 99, 101, 115, 115, 111, 32, 105, 110, 105, 116, 32, 116, 101, 114, 109, 105, 110, 111, 117, 46, 32, 65, 112, 114, 101, 115, 101, 110, 116, 97, 110, 100, 111, 32, 109, 101, 116, 114, 105, 99, 97, 115, 32, 101, 32, 100, 101, 115, 108, 105, 103, 97, 110, 100, 111, 46, 10, 0
