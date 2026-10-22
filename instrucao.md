ELC1080 - Sistemas Operacionais "A"
Sobre a disciplina
T2 - Implementação de processos
Sep 24, 2026

No T1, o simulador era dedicado a executar um só programa, colocado na memória na inicialização do simulador, e não podia ser alterado sem interromper e reiniciar a simulação. Agora teremos um mini sistema operacional, para permitir a execução de mais de um programa. Nesse SO, será implementado:

suporte a processos com multiprogramação,
um escalonador (ou três),
chamadas de sistema,
bloqueio de processos por entrada e saída e para esperar a morte de outro, para melhorar o uso da CPU,
preempção de processos, para melhorar a distribuição da CPU.
Os processos não podem mais executar as intruções de E/S ou de parada, devendo chamar o SO para isso. No Mancha há só uma console (um único dispositivo de entrada/saída de caracteres, ver simulador_completo/src/dispositivos.h), diferente de simuladores que dão um terminal dedicado a cada processo: todos os processos vão ler e escrever na mesma console, através do SO.

Nosso SO deve ter 5 chamadas de sistema:

SO_LE: lê um caractere da entrada do processo;
SO_ESCREVE: escreve um caractere na saída do processo;
SO_CRIA_PROC: cria um novo processo;
SO_MATA_PROC: mata um processo (podendo ser o próprio que fez a chamada);
SO_ESPERA_PROC: espera a morte de outro processo.
A CPU do Mancha tem dois modos de execução, usuário e supervisor, indicados pelo bit S do registrador de estado sr. Algumas instruções são privilegiadas e só podem ser executadas em modo supervisor: halt, di, ei, lds (carrega um registrador de supervisor) e rete. As instruções de entrada/saída (in/out/inb/outb) são controladas por um bit diferente, I (E/S permitida) – por isso, para impedir que um processo de usuário acesse portas diretamente, o SO precisa iniciar cada processo com S=0 e I=0 no seu sr (ver simulador_completo/exemplos/protecao.asm, que já demonstra essa técnica). Tentar executar uma instrução privilegiada ou de E/S sem o bit correspondente causa a interrupção 2 (instrução privilegiada), devolvendo o controle ao SO.

A passagem da CPU para o modo supervisor só pode acontecer de uma forma controlada, em que, além de mudar o modo, muda também o endereço de execução: as instruções trap e a chegada de uma interrupção de hardware sempre desviam para um endereço fixo, pré-definido, nunca escolhido pelo programa de usuário. Com isso, dá para organizar a execução de forma que o programa de usuário não consiga executar instruções de E/S, nem desviar diretamente para código que só deve ser executado como supervisor. Esse código será a porta de entrada para o SO, que será o único com direito a executar no modo supervisor.

O processador Mancha possui um vetor de interrupções onde este vetor é uma tabela com 16 quadros de desvio. Cada linha da tabela é o valor que os registradores do processador devem receber. Cada quadro de desvio é composto de quatro valores de 2 bytes: ip, sp, cs, ds. O vetor está armazenado nos primeiros 128 bytes da memória, a partir do endereço 0 (8 bytes por quadro, 16 quadros). Um quadro com ip=0 significa “interrupção ignorada” – é assim que memória zerada se comporta por padrão, então só é preciso preencher os quadros realmente usados.

O processador Mancha começa a execução em modo supervisor como se tivesse recebido a interrupção 0 – é o quadro 0 do vetor que diz onde o código de inicialização do SO está (ip), qual pilha usar (sp) e as bases dos segmentos de código e dados iniciais (cs, ds – os limites, cl e dl, são registradores de supervisor à parte, não fazem parte do quadro, e não importam enquanto a CPU estiver em modo supervisor).

Ao atender qualquer interrupção – inclusive essa “interrupção 0” de inicialização –, a CPU salva todos os 16 registradores do contexto interrompido (r0-r4, bp, sp, ip, e os 8 registradores de supervisor, incluindo sr) empilhando-os, em uma ordem fixa, na pilha indicada pelo campo sp do quadro correspondente – não em endereços fixos da memória. Esse mesmo bloco de 16 palavras é desempilhado pela instrução rete para retomar a execução de onde ela parou (ver bios_mancha/README.md, seção “O quadro de 16 palavras”, para a ordem exata).

A troca de modo de execução é realizada pelas instruções trap e rete (retorno de interrupção). Essa operação toda é chamada de interrupção, e pode acontecer em algumas situações:

quando o programa de usuário executa a instrução trap (pode indicar qualquer um dos 16 quadros; a BIOS fornecida reserva o quadro 7 para chamadas de sistema, deixando os quadros 6 e 11-15 livres para o que o SO quiser),
quando a CPU encontra algum erro: violação de segmento (1), instrução privilegiada (2), divisão por zero (3), instrução ilegal (4), ausência de quadro de paginação (5),
quando algum dispositivo de E/S pede atenção: console (8), disco (9), relógio (10).
Em qualquer desses casos, ao atender a interrupção, a CPU passa a executar em um endereço pré-definido (o ip do quadro correspondente), em modo supervisor. Diferente de “a CPU não aceita interrupções em modo supervisor” – no Mancha o que impede isso é um bit específico, D (interrupções desabilitadas): toda interrupção liga automaticamente S, I e D ao entrar no quadro, então novas interrupções externas (console, disco, relógio) ficam bloqueadas até o próprio SO decidir religá-las com a instrução ei, quando estiver pronto para ser interrompido de novo (é assim que o escalonador preemptivo consegue funcionar – ver os exemplos abaixo). A BIOS fornecida usa a mesma pilha (pilha_sistema) como destino de todos os quadros do vetor, por simplicidade – não é uma exigência do processador, é uma escolha de projeto que o SO precisa respeitar: como qualquer interrupção seguinte reaproveita esse mesmo endereço, nada que precise sobreviver a um rete pode morar lá, e o SO precisa rodar numa pilha própria, separada (ver bios_mancha/README.md, seção “pilha_sistema vs. pilha_nucleo” – essa é uma pegadinha real, que vale a pena entender antes de escrever o SO).

O Mancha não tem um registrador dedicado para indicar “qual foi o tipo de interrupção”: esse dado já está implícito em qual dos 16 quadros foi usado. Para as chamadas de sistema especificamente, a convenção que vamos seguir (a mesma da BIOS fornecida, ver abaixo) é: o número da chamada vai no registrador r0 antes do trap, e os argumentos em r1-r4.

O SO deste trabalho pode ser escrito inteiramente em C (compilado pelo mcc), inteiramente em linguagem de montagem, ou uma mistura das duas: uma pequena “ponte” em assembly cuida do que a linguagem C do mcc não expõe (acesso a porta, ei, o primeiro rete manual), e o resto – estruturas de processo, tabela de processos, escalonador, chamadas de sistema – pode ser C comum. O exemplo bios_mancha/exemplos/multitarefa_c/ mostra exatamente esse padrão (um escalonador simples, round-robin, escrito em C) e é o ponto de partida recomendado para este trabalho.

A base de firmware fornecida é a pasta bios_mancha/ (arquivo src/bios.asm): ela já define o vetor de interrupções completo, os quadros de tratamento das exceções da CPU, os drivers de console/disco/relógio, e um mecanismo de despacho de chamada de sistema (trap 7 mais uma tabela de até 16 chamadas, tabela_syscalls) – ver bios_mancha/README.md. O endereço 0 da memória contém o vetor de interrupções (não código executável); é o ip do quadro 0 que aponta para _start, em bios.asm, colocado lá pelo montador ao montar bios.asm junto com o código do SO (montador bios_mancha/src/bios.asm meuso.asm -o meuso.mob). _start chama um rótulo _kernel_inicio, que deve ser definido pelo SO: é lá que o primeiro processo (o “init”) deve ser montado e colocado para rodar, do mesmo jeito que _kernel_inicio faz nos exemplos de bios_mancha/exemplos/.

Para garantir que o SO tenha controle da máquina, o relógio (portas de E/S 0x20-0x23, ver simulador_completo/src/dispositivos.h) pode ser programado com um limite, e passa a gerar a interrupção 10 periodicamente – é essa interrupção que vai acionar a preempção nas Partes II e III. A configuração do relógio (e a habilitação da interrupção correspondente, no controlador de interrupções) é feita no _kernel_inicio, como já mostram os exemplos de bios_mancha/exemplos/.

Parte I
Entenda as mudanças no código e o funcionamento do SO.

Faça uma implementação inicial de processos:

crie um tipo de dados que é uma estrutura que contém as informações a respeito de um processo
crie uma tabela de processos, que é um vetor dessas estruturas
inicialize a primeira entrada nessa tabela (o primeiro processo) na criação do init
crie uma variável que designe o processo em execução. Faça de tal forma que tenha suporte a não ter nenhum processo em execução
implemente as funções que salvam o quadro de 16 palavras do processador na tabela de processos (na entrada correspondente ao processo em execução) e que o recuperam de volta – é o mesmo padrão de cópia usado pelo escalonador de bios_mancha/exemplos/multitarefa_c/ (função escalonador, em kernel.c) ou bios_mancha/src/bios.asm (bios_copia_quadro), só que agora copiando de/para a sua tabela de processos em vez de duas áreas fixas
implemente a função do escalonador (so_escalona, ou o nome que preferir). Ela escolhe o próximo processo a executar (altera a variável que designa o processo em execução). Pode ser bem simples: se o processo que estava em execução estiver pronto continua sendo executado e se não, escolhe o primeiro que encontrar na tabela que esteja pronto.
implemente as chamadas de criação e morte de processos
o pid do processo não é a mesma coisa que sua entrada na tabela: quando um processo termina sua entrada na tabela pode ser reutilizada por outro processo, o pid não, é uma espécie de número de série do processo.
Não obstante, pode-se adaptar a biblioteca C (compilador_c/rt/runtime.asm) para utilizar as chamadas de sistema aqui implementadas.

Parte II
Na parte I, um processo não bloqueia, se ele não está morto, ele pode executar. Nesta parte, vamos implementar o bloqueio de processos e eliminar a espera ocupada na E/S.

nas chamadas de E/S, se o dispositivo não estiver pronto, o SO deve bloquear o processo e não realizar a E/S; se o dispositivo estiver pronto, ele realiza a E/S e não bloqueia, como na parte I.
na função que trata de pendências, o SO deve verificar o estado dos dispositivos que causaram bloqueio e realizar operações pendentes e desbloquear processos se for o caso
implemente a chamada de sistema SO_ESPERA_PROC, que bloqueia o processo chamador até que o processo que ele identifica na chamada tenha terminado. Se o processo esperado não existe ou se for o próprio processo chamador, retorna um erro para o processo, não bloqueia ele esperando algo que não vai acontecer. Quando tratar a morte de um processo, o SO deve verificar se há alguém esperando por esse acontecimento.
Parte III
Implemente um escalonador preemptivo round-robin (circular):

os processos prontos são colocados em uma fila
o escalonador sempre escolhe o primeiro da fila
quando um processo fica pronto (é criado ou desbloqueia), vai para o final da fila
se terminar o quantum de um processo, ele é colocado no final da fila (preempção)
O quantum é definido como um múltiplo do intervalo de interrupção do relógio (em outras palavras, o quantum equivale a tantas interrupções). Quando um processo é selecionado para executar, tem o direito de executar durante o tempo de um quantum. Uma forma simples de implementar isso é ter uma variável do SO, controlada pelo escalonador, que é inicializada com o valor do quantum (em interrupções) quando um processo diferente do que foi interrompido é selecionado. Cada vez que recebe uma interrupção do relógio, decrementa essa variável. Quando essa variável chega a zero, o processo corrente é movido para o final da fila, se não tiver bloqueado.

Implemente um segundo escalonador, semelhante ao circular: os processos têm um quantum, e sofrem preempção quando esse quantum é excedido. Os processos têm também uma prioridade, e o escalonador escolhe o processo com maior prioridade entre os prontos. A prioridade de um processo é calculada da seguinte forma:

quando um processo é criado, recebe prioridade 0,5
quando um processo perde o processador (porque bloqueou ou porque acabou seu quantum), a prioridade do processo é calculada como prio = (prio + t_exec/t_quantum) / 2, onde t_exec é o tempo desde que ele foi escolhido para executar e t_quantum é o tempo do quantum. O t_exec é o quantum menos o valor da variável que o escalonador decrementa a cada interrupção. O valor da prioridade é uma espécie de média do percentual do quantum que o processo usou a cada vez que executou. Quanto menor esse valor, maior deve ser a prioridade do processo.
O SO deve manter algumas métricas, que devem ser apresentadas no final da execução do SO (quando o init morrer):

número de processos criados
tempo total de execução
tempo total em que o sistema ficou ocioso (todos os processos bloqueados)
número de interrupções recebidas de cada tipo
número de preempções
tempo de retorno de cada processo (diferença entre data do término e da criação)
número de preempções de cada processo
número de vezes que cada processo entrou em cada estado (pronto, bloqueado, executando)
tempo total de cada processo em cada estado (pronto, bloqueado, executando)
tempo médio de resposta de cada processo (tempo entre desbloquear e ser escalonado)
Os tempos acima são medidos em número de instruções (medidas pelo relógio).

Gere um relatório de execuções do sistema em diferentes configurações.

Links úteis
Slides da aula aqui
Link do compilador C e simulador: https://gitlab.inf.ufsm.br/jvlima/mancha
ELC1080 - Sistemas Operacionais "A"
ELC1080 - Sistemas Operacionais "A"
joao-vicente.lima@ufsm.br
 joao-lima
ELC1080 - 2026/2 - UFSM