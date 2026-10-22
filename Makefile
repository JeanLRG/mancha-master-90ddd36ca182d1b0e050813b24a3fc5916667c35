# Makefile de nível superior: compila o simulador do Mancha completo,
# depois o compilador C, depois a BIOS de brinquedo -- nessa ordem,
# porque compilador_c usa o montador de simulador_completo/bin/, e
# bios_mancha usa TANTO esse montador QUANTO o mcc de compilador_c/bin/
# (seu exemplo exemplos/multitarefa_c/ tem um escalonador escrito em C,
# compilado pelo mcc).

.PHONY: all simulador_completo compilador_c bios_mancha \
        clean clean-simulador_completo clean-compilador_c clean-bios_mancha

all: simulador_completo compilador_c bios_mancha

simulador_completo:
	$(MAKE) -C simulador_completo all

compilador_c: simulador_completo
	$(MAKE) -C compilador_c all

bios_mancha: simulador_completo compilador_c
	$(MAKE) -C bios_mancha all

clean: clean-compilador_c clean-bios_mancha clean-simulador_completo

clean-simulador_completo:
	$(MAKE) -C simulador_completo clean

clean-compilador_c:
	$(MAKE) -C compilador_c clean

clean-bios_mancha:
	$(MAKE) -C bios_mancha clean
