# Relatório de Implementação e Execução do SO - Trabalho 2 (Sistemas Operacionais)

## 1. Visão Geral da Arquitetura

O sistema operacional foi desenvolvido para a arquitetura **Mancha**, composto por uma camada em assembly ([ponte.asm](ponte.asm)) e um núcleo escrito na linguagem C compilada pelo `mcc` ([kernel.c](kernel.c)), integrando-se com a BIOS mínima fornecida ([bios_mancha](../bios_mancha/src/bios.asm)).

### Características Principais
- **Modos de Execução**: Modo supervisor ($S=1, I=1$) exclusivo para o núcleo do SO; processos de usuário são iniciados com $S=0, I=0, D=0$ em seus registradores de estado ($SR$), garantindo que tentativas de executar instruções privilegiadas ou de E/S direta gerem exceção e passem o controle ao SO.
- **Estrutura de Processo (`struct processo`)**: Cada processo possui seu identificador único (`pid`), estado atual, prioridade dinâmica, quadro de 16 registradores salvo, pilha isolada e contadores de métricas de desempenho.
- **Chamadas de Sistema**: Interface via `trap 7` com passagem de argumentos em $r1..r4$, identificador da chamada em $r0$ e valor de retorno depositado em $r0$ no quadro salvo.

---

## 2. Chamadas de Sistema Implementadas

| Chamada | Número (`r0`) | Argumentos | Retorno | Descrição |
| :--- | :---: | :--- | :---: | :--- |
| `SO_LE` | `0` | - | caractere / `0` | Lê caractere da console. Bloqueia em `ESTADO_BLOQ_LEITURA` se não houver entrada disponível. |
| `SO_ESCREVE` | `1` | `r1`: caractere | `0` | Escreve caractere na console. Bloqueia em `ESTADO_BLOQ_ESCRITA` caso o dispositivo esteja ocupado. |
| `SO_CRIA_PROC` | `2` | `r1`: ponteiro de função | `pid` ou `-1` | Aloca PCB, inicializa pilha de usuário, configura quadro de registradores e insere na fila de prontos. |
| `SO_MATA_PROC` | `3` | `r1`: `pid` (`0` = próprio) | `0` ou `-1` | Finaliza processo (`ESTADO_MORT`), acorda processos dependentes e cede a CPU imediatamente se for auto-término. |
| `SO_ESPERA_PROC` | `4` | `r1`: `pid` esperado | `0` ou `-1` | Bloqueia o chamador em `ESTADO_BLOQ_ESPERA_PROC` até o processo alvo terminar. Se inválido ou auto-espera, retorna `-1`. |

---

## 3. Algoritmos de Escalonamento Implementados

O sistema oferece suporte a dois algoritmos de escalonamento preemptivos, selecionáveis através da variável `tipo_escalonador` em [kernel.c](kernel.c):

### 3.1. Escalonador Circular (Round-Robin com Fila FIFO)
- Mantém uma fila circular explícita (`fila_prontos`).
- Processos que ficam prontos (criados, desbloqueados ou que sofreram preempção por fim de quantum) entram no final da fila (`fila_insere`).
- O escalonador sempre seleciona o primeiro processo da fila (`fila_remove`).
- Cada processo tem direito a um quantum de $3$ fatias de relógio (`QUANTUM_MAX = 3`). A cada interrupção periódica (interrupção 10), o quantum é decrementado. Ao zerar, ocorre preempção.

### 3.2. Escalonador por Prioridade Dinâmica
- Processos iniciam com prioridade $0.5$ (representada como `500` em escala inteira $\times 1000$).
- Quando um processo perde o processador (por bloqueio ou fim de quantum), sua prioridade é recalculada:
  $$\text{prio} = \frac{\text{prio} + \frac{t_{\text{exec}}}{t_{\text{quantum}}}}{2}$$
  onde $t_{\text{exec}} = \text{QUANTUM\_MAX} - \text{quantum\_restante}$.
- O escalonador escolhe o processo no estado `ESTADO_PRONTO` com **menor valor numérico de prioridade** (maior prioridade real).

---

## 4. Comparativo de Execução e Métricas

Cenário de teste: Processo `init` inicializa e cria concorrentemente os processos `A`, `B` e `C` (cada qual realizando loops de computação e chamadas `usr_escreve`), aguardando o término de cada um através de `usr_espera_proc`.

Todas as métricas de tempo são contabilizadas em instruções de relógio da CPU (cada interrupção do relógio equivale a $4000$ instruções).

| Métrica Coletada | Escalonador Round-Robin | Escalonador por Prioridade |
| :--- | :---: | :---: |
| **Processos Criados** | 4 | 4 |
| **Tempo Total de Execução** | 248.000 inst (62 ticks) | 276.000 inst (69 ticks) |
| **Tempo Ocioso do Sistema** | 0 inst (0 ticks) | 0 inst (0 ticks) |
| **Preempções Globais** | 17 | 18 |
| **Interrupções de Relógio (tipo 10)** | 62 | 69 |
| **Chamadas de Sistema (tipo 7)** | 24 | 24 |
| **Interrupções de Console (tipo 8)** | 0 | 0 |
| **PID 1 (`init`) - Tempo de Retorno** | 248.000 inst (62 ticks) | 276.000 inst (69 ticks) |
| **PID 1 (`init`) - Tempo em Bloqueado** | 220.000 inst (55 ticks) | 244.000 inst (61 ticks) |
| **PID 2 (`Proc A`) - Preempções / Retorno** | 6 preempções / 228.000 inst | 6 preempções / 232.000 inst |
| **PID 3 (`Proc B`) - Preempções / Retorno** | 5 preempções / 208.000 inst | 6 preempções / 248.000 inst |
| **PID 4 (`Proc C`) - Preempções / Retorno** | 6 preempções / 236.000 inst | 6 preempções / 264.000 inst |

### Análise dos Resultados
1. **Distribuição Justa no Round-Robin**: No escalonador circular FIFO, os processos `A`, `B` e `C` receberam fatias de tempo rigorosamente alternadas (média de 5 a 6 preempções por processo), apresentando tempos de retorno muito homogêneos.
2. **Prioridades Dinâmicas**: No escalonador por prioridade, o cálculo penaliza processos intensivos em CPU conforme utilizam mais tempo de sua fatia, priorizando quem cede a CPU antecipadamente. O tempo total foi ligeiramente superior devido ao overhead de ordenação e recalculo das prioridades a cada transição.
3. **Bloqueio Eficiente**: O processo `init` permaneceu bloqueado em `ESTADO_BLOQ_ESPERA_PROC` durante a quase totalidade do teste ($> 88\%$ do tempo total), sem gastar ciclos de CPU em espera ocupada.

---

## 5. Como Compilar e Executar

Para compilar e gerar a imagem do SO:
```bash
make clean && make
```

Para executar a simulação interativa no simulador Mancha:
```bash
../simulador_completo/bin/simulador multitarefa_c.mob
```
*(Comandos do operador do simulador: `D0` para velocidade máxima, `C` para continuar execução, `F` para sair).*

Para executar a validação automatizada e extração direta das métricas:
```bash
python3 executa_simulador.py multitarefa_c.mob
```
