#define N_PROCESSOS 10
#define QUANTUM_MAX 3 
#define TICKS_POR_FATIA 4000

#define ESCALONADOR_ROUND_ROBIN 1
#define ESCALONADOR_PRIORIDADE  2

int tipo_escalonador = ESCALONADOR_ROUND_ROBIN;

#define ESTADO_LIVRE 0
#define ESTADO_PRONTO 1
#define ESTADO_EXEC 2
#define ESTADO_BLOQ_LEITURA 3
#define ESTADO_BLOQ_ESCRITA 4
#define ESTADO_BLOQ_ESPERA_PROC 5
#define ESTADO_MORT 6

struct processo {
    int pid;
    int estado;
    int esperado_pid;
    int lido;
    int pendente_escrita;
    int quadro[16];

    int prio;
    int quantum_restante;
    
    int tick_criacao;
    int tick_fim;
    
    int preemptoes;
    int vezes_estado[7];
    int tempo_estado[7];
    int ultimo_tick;
    
    int tick_desbloqueio;
    int espera_acumulada;
    int num_esperas;
};

struct processo processos[N_PROCESSOS];
int pilhas[N_PROCESSOS][100];
int processo_atual = -1;
int proximo_pid = 1;

#define TAM_FILA 16
int fila_prontos[TAM_FILA];
int fila_inicio = 0;
int fila_fim = 0;
int fila_tamanho = 0;

void fila_insere(int p) {
    if (fila_tamanho >= N_PROCESSOS) return;
    fila_prontos[fila_fim] = p;
    fila_fim = (fila_fim + 1) % TAM_FILA;
    fila_tamanho = fila_tamanho + 1;
}

int fila_remove(void) {
    int p;
    if (fila_tamanho == 0) return -1;
    p = fila_prontos[fila_inicio];
    fila_inicio = (fila_inicio + 1) % TAM_FILA;
    fila_tamanho = fila_tamanho - 1;
    return p;
}

int cont_int_syscall = 0;
int cont_int_console = 0;
int metrica_criados = 0;
int metrica_ocioso = 0;
int metrica_preemptoes = 0;
int relogio_ticks = 0;

void escreve_caractere(int c); 
int console_disponivel(void);
int console_le(void);
int console_pronta_escrita(void);
void so_imprime(char *s);
void so_imprime_dec(int v);
void so_para(void);
void halt_espera(void);
void sis_yield(void);

void muda_estado(int p, int novo_estado);

void imprime_instrucoes(int ticks) {
    int mil;
    mil = ticks * 4;
    so_imprime_dec(mil);
    so_imprime("000 inst (");
    so_imprime_dec(ticks);
    so_imprime(" t)");
}

int sis_cria_proc(int (*pont_entrada)(void)) {
    int i, p;
    p = -1;
    for (i = 0; i < N_PROCESSOS; i++) {
        if (processos[i].estado == ESTADO_LIVRE) { p = i; break; }
    }
    if (p == -1) {
        for (i = 0; i < N_PROCESSOS; i++) {
            if (processos[i].estado == ESTADO_MORT) { p = i; break; }
        }
    }
    if (p == -1) return -1;

    for (i = 0; i < 7; i++) {
        processos[p].vezes_estado[i] = 0;
        processos[p].tempo_estado[i] = 0;
    }
    processos[p].pid = proximo_pid;
    proximo_pid = proximo_pid + 1;
    processos[p].prio = 500;
    processos[p].quantum_restante = 0;
    processos[p].preemptoes = 0;
    processos[p].tick_desbloqueio = 0;
    processos[p].espera_acumulada = 0;
    processos[p].num_esperas = 0;
    processos[p].tick_criacao = relogio_ticks;
    processos[p].ultimo_tick = relogio_ticks;
    processos[p].esperado_pid = 0;
    processos[p].pendente_escrita = 0;
    
    for (i = 0; i < 16; i++) processos[p].quadro[i] = 0;
    processos[p].quadro[6] = (int) &pilhas[p][100];
    processos[p].quadro[7] = (int) pont_entrada;
    processos[p].quadro[8] = 0;

    metrica_criados = metrica_criados + 1;
    
    processos[p].estado = ESTADO_LIVRE;
    muda_estado(p, ESTADO_PRONTO);
    fila_insere(p);

    return processos[p].pid;
}

void imprime_metricas(void) {
    int i, bloq_vezes, bloq_tempo, turnaround, resp_med;

    so_imprime("\n============================================\n");
    so_imprime("          METRICAS DA EXECUCAO DO SO        \n");
    so_imprime("============================================\n");
    
    so_imprime("Escalonador utilizado: ");
    if (tipo_escalonador == ESCALONADOR_ROUND_ROBIN) {
        so_imprime("ROUND-ROBIN (CIRCULAR)\n");
    } else {
        so_imprime("PRIORIDADE DINAMICA\n");
    }

    so_imprime("1. Numero de processos criados: ");
    so_imprime_dec(metrica_criados);
    so_imprime("\n");

    so_imprime("2. Tempo total de execucao: ");
    imprime_instrucoes(relogio_ticks);
    so_imprime("\n");

    so_imprime("3. Tempo total ocioso (sistema ocioso): ");
    imprime_instrucoes(metrica_ocioso);
    so_imprime("\n");

    so_imprime("4. Interrupcoes recebidas por tipo:\n");
    so_imprime("   - Relogio (tipo 10): ");
    so_imprime_dec(relogio_ticks);
    so_imprime("\n   - Chamadas de sistema (tipo 7): ");
    so_imprime_dec(cont_int_syscall);
    so_imprime("\n   - Console (tipo 8): ");
    so_imprime_dec(cont_int_console);
    so_imprime("\n");

    so_imprime("5. Numero de preemptoes globais: ");
    so_imprime_dec(metrica_preemptoes);
    so_imprime("\n");

    so_imprime("--------------------------------------------\n");
    so_imprime("DETALHES POR PROCESSO:\n");
    so_imprime("--------------------------------------------\n");

    for (i = 0; i < N_PROCESSOS; i++) {
        if (processos[i].estado != ESTADO_LIVRE) {
            so_imprime("Processo PID ");
            so_imprime_dec(processos[i].pid);
            so_imprime(":\n");

            turnaround = processos[i].tick_fim - processos[i].tick_criacao;
            so_imprime("  - Tempo de retorno: ");
            imprime_instrucoes(turnaround);
            so_imprime("\n");

            so_imprime("  - Numero de preemptoes: ");
            so_imprime_dec(processos[i].preemptoes);
            so_imprime("\n");

            bloq_vezes = processos[i].vezes_estado[ESTADO_BLOQ_LEITURA] + 
                         processos[i].vezes_estado[ESTADO_BLOQ_ESCRITA] + 
                         processos[i].vezes_estado[ESTADO_BLOQ_ESPERA_PROC];
            so_imprime("  - Vezes em cada estado: Pronto=");
            so_imprime_dec(processos[i].vezes_estado[ESTADO_PRONTO]);
            so_imprime(" Exec=");
            so_imprime_dec(processos[i].vezes_estado[ESTADO_EXEC]);
            so_imprime(" Bloq=");
            so_imprime_dec(bloq_vezes);
            so_imprime("\n");

            bloq_tempo = processos[i].tempo_estado[ESTADO_BLOQ_LEITURA] + 
                         processos[i].tempo_estado[ESTADO_BLOQ_ESCRITA] + 
                         processos[i].tempo_estado[ESTADO_BLOQ_ESPERA_PROC];
            so_imprime("  - Tempo em Pronto: ");
            imprime_instrucoes(processos[i].tempo_estado[ESTADO_PRONTO]);
            so_imprime("\n  - Tempo em Exec:   ");
            imprime_instrucoes(processos[i].tempo_estado[ESTADO_EXEC]);
            so_imprime("\n  - Tempo em Bloq:   ");
            imprime_instrucoes(bloq_tempo);
            so_imprime("\n");

            so_imprime("  - Tempo medio de resposta: ");
            if (processos[i].num_esperas > 0) {
                resp_med = processos[i].espera_acumulada / processos[i].num_esperas;
                imprime_instrucoes(resp_med);
            } else {
                so_imprime("N/A (nao bloqueou)");
            }
            so_imprime("\n");
        }
    }
    so_imprime("============================================\n");
}

int sis_mata_proc(int pid) {
    int i, idx;
    idx = -1;
    if (pid == 0 && processo_atual != -1) {
        idx = processo_atual;
        pid = processos[idx].pid;
    } else {
        for (i = 0; i < N_PROCESSOS; i++) {
            if (processos[i].estado != ESTADO_LIVRE && processos[i].estado != ESTADO_MORT && processos[i].pid == pid) {
                idx = i;
                break;
            }
        }
    }
    if (idx == -1) return -1;

    processos[idx].tick_fim = relogio_ticks;
    muda_estado(idx, ESTADO_MORT);

    for (i = 0; i < N_PROCESSOS; i++) {
        if (processos[i].estado == ESTADO_BLOQ_ESPERA_PROC && processos[i].esperado_pid == pid) {
            muda_estado(i, ESTADO_PRONTO);
            processos[i].quadro[0] = 0;
            fila_insere(i);
        }
    }

    if (processos[idx].pid == 1) {
        so_imprime("\n[SO] Processo init terminou. Apresentando metricas e desligando.\n");
        imprime_metricas();
        so_para();
    }

    if (idx == processo_atual) {
        sis_yield();
    }
    return 0;
}

int sis_espera_proc(int pid) {
    int i, existe;
    if (processo_atual == -1 || pid == processos[processo_atual].pid) return -1; 
    existe = 0;
    for (i = 0; i < N_PROCESSOS; i++) {
        if (processos[i].estado != ESTADO_LIVRE && processos[i].estado != ESTADO_MORT && processos[i].pid == pid) {
            existe = 1;
            break;
        }
    }
    if (existe == 1) {
        processos[processo_atual].esperado_pid = pid;
        muda_estado(processo_atual, ESTADO_BLOQ_ESPERA_PROC);
        sis_yield(); 
        return 0; 
    }
    return -1;
}

int sis_le(void) {
    if (processo_atual == -1) return -1;
    if (console_disponivel() != 0) return console_le();
    
    muda_estado(processo_atual, ESTADO_BLOQ_LEITURA);
    sis_yield();
    return 0; 
}

int sis_escreve(int c) {
    if (processo_atual == -1) return -1;
    if (console_pronta_escrita() != 0) {
        escreve_caractere(c);
        return 0;
    }
    processos[processo_atual].pendente_escrita = c;
    muda_estado(processo_atual, ESTADO_BLOQ_ESCRITA);
    sis_yield();
    return 0;
}

void muda_estado(int p, int novo_estado) {
    int estado_antigo;
    estado_antigo = processos[p].estado;
    
    processos[p].tempo_estado[estado_antigo] = processos[p].tempo_estado[estado_antigo] + (relogio_ticks - processos[p].ultimo_tick);
    
    if (novo_estado == ESTADO_PRONTO && (estado_antigo == ESTADO_BLOQ_LEITURA || estado_antigo == ESTADO_BLOQ_ESCRITA || estado_antigo == ESTADO_BLOQ_ESPERA_PROC)) {
        processos[p].tick_desbloqueio = relogio_ticks;
        processos[p].num_esperas = processos[p].num_esperas + 1;
    }
    
    if (novo_estado == ESTADO_EXEC && estado_antigo == ESTADO_PRONTO) {
        if (processos[p].tick_desbloqueio != 0) {
            processos[p].espera_acumulada = processos[p].espera_acumulada + (relogio_ticks - processos[p].tick_desbloqueio);
            processos[p].tick_desbloqueio = 0;
        }
    }

    processos[p].estado = novo_estado;
    processos[p].ultimo_tick = relogio_ticks;
    processos[p].vezes_estado[novo_estado] = processos[p].vezes_estado[novo_estado] + 1;
}

void trata_pendencias(void) {
    int i, c;
    for (i = 0; i < N_PROCESSOS; i++) {
        if (processos[i].estado == ESTADO_BLOQ_LEITURA && console_disponivel() != 0) {
            c = console_le();
            processos[i].lido = c;
            processos[i].quadro[0] = c; 
            muda_estado(i, ESTADO_PRONTO);
            fila_insere(i);
        }
        if (processos[i].estado == ESTADO_BLOQ_ESCRITA && console_pronta_escrita() != 0) {
            escreve_caractere(processos[i].pendente_escrita);
            processos[i].quadro[0] = 0;
            muda_estado(i, ESTADO_PRONTO);
            fila_insere(i);
        }
    }
}

void atualiza_prio_e_salva(int *quadro, int cedeu) {
    int i, t_exec, t_exec_frac;
    if (processo_atual != -1 && processos[processo_atual].estado != ESTADO_LIVRE && processos[processo_atual].estado != ESTADO_MORT) {
        t_exec = QUANTUM_MAX - processos[processo_atual].quantum_restante;
        t_exec_frac = (t_exec * 1000) / QUANTUM_MAX;
        processos[processo_atual].prio = (processos[processo_atual].prio + t_exec_frac) / 2;
        
        if (processos[processo_atual].estado == ESTADO_EXEC) {
            if (cedeu == 1) {
                muda_estado(processo_atual, ESTADO_PRONTO);
                processos[processo_atual].preemptoes = processos[processo_atual].preemptoes + 1;
                metrica_preemptoes = metrica_preemptoes + 1;
                fila_insere(processo_atual);
            }
        }
        for (i = 0; i < 16; i++) processos[processo_atual].quadro[i] = quadro[i];
    }
}

void escalonador(int *quadro) {
    int i, p, prox, melhor_prio, cedeu;

    relogio_ticks = relogio_ticks + 1;
    trata_pendencias();

    cedeu = 0;
    if (processo_atual != -1 && processos[processo_atual].estado == ESTADO_EXEC) {
        processos[processo_atual].quantum_restante = processos[processo_atual].quantum_restante - 1;
        if (processos[processo_atual].quantum_restante <= 0) cedeu = 1;
    } else {
        cedeu = 1;
    }

    if (cedeu == 1) {
        atualiza_prio_e_salva(quadro, cedeu);
        
        prox = -1;

        if (tipo_escalonador == ESCALONADOR_ROUND_ROBIN) {
            while (fila_tamanho > 0) {
                p = fila_remove();
                if (processos[p].estado == ESTADO_PRONTO) {
                    prox = p;
                    break;
                }
            }
        } else {
            melhor_prio = 9999;
            for (i = 0; i < N_PROCESSOS; i++) {
                if (processos[i].estado == ESTADO_PRONTO && processos[i].prio < melhor_prio) {
                    melhor_prio = processos[i].prio;
                    prox = i;
                }
            }
        }

        if (prox != -1) {
            processo_atual = prox;
            muda_estado(prox, ESTADO_EXEC);
            processos[prox].quantum_restante = QUANTUM_MAX;
            for (i = 0; i < 16; i++) quadro[i] = processos[prox].quadro[i];
        } else {
            processo_atual = -1;
            metrica_ocioso = metrica_ocioso + 1;
            for (i = 0; i < 16; i++) quadro[i] = 0;
            quadro[7] = (int) halt_espera; 
            quadro[8] = 0xA000; 
        }
    } else {
        for (i = 0; i < 16; i++) processos[processo_atual].quadro[i] = quadro[i];
    }
}

int usr_le(void);
int usr_escreve(int c);
int usr_cria_proc(int (*pont_entrada)(void));
int usr_mata_proc(int pid);
int usr_espera_proc(int pid);

void processoA(void) {
    int i, j;
    for (i = 0; i < 3; i++) {
        usr_escreve('A');
        for (j = 0; j < 800; j++) {}
    }
    usr_mata_proc(0);
}

void processoB(void) {
    int i, j;
    for (i = 0; i < 3; i++) {
        usr_escreve('B');
        for (j = 0; j < 800; j++) {}
    }
    usr_mata_proc(0);
}

void processoC(void) {
    int i, j;
    for (i = 0; i < 3; i++) {
        usr_escreve('C');
        for (j = 0; j < 800; j++) {}
    }
    usr_mata_proc(0);
}

void init(void) {
    int pid_a, pid_b, pid_c;
    usr_escreve('I');
    
    pid_a = usr_cria_proc(processoA);
    pid_b = usr_cria_proc(processoB);
    pid_c = usr_cria_proc(processoC);
    
    usr_espera_proc(pid_a);
    usr_escreve('1');
    usr_espera_proc(pid_b);
    usr_escreve('2');
    usr_espera_proc(pid_c);
    usr_escreve('3');
    
    usr_escreve('\n');
    usr_mata_proc(0);
}

void inicializa_so(int *quadro_boot) {
    int i;
    for (i = 0; i < N_PROCESSOS; i++) processos[i].estado = ESTADO_LIVRE;
    processo_atual = -1;
    sis_cria_proc(init); 
    
    processo_atual = 0;
    muda_estado(0, ESTADO_EXEC);
    processos[0].quantum_restante = QUANTUM_MAX;
    for (i = 0; i < 16; i++) quadro_boot[i] = processos[0].quadro[i];
}
