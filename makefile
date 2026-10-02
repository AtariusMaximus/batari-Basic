# The bB generic-Unix makefile. Should work with most unixy OSes.
SHELL=/bin/sh
CHMOD=chmod
CP=cp
RM=rm
CFLAGS=-O3
CC=/opt/wasi-sdk/bin/clang
LEX=flex
LEXFLAGS=-t

all: 2600basic.wasm preprocess.wasm postprocess.wasm optimize.wasm bbfilter.wasm 

2600basic.wasm: 2600bas.c statements.c keywords.c statements.h keywords.h
	${CC} ${CFLAGS} -o 2600basic.wasm 2600bas.c statements.c keywords.c

postprocess.wasm: postprocess.c
	${CC} ${CFLAGS} -o postprocess.wasm postprocess.c

preprocess.wasm: preprocess.lex
	${LEX} ${LEXFLAGS} < preprocess.lex > lex.yy.c
	${CC} ${CFLAGS} -o preprocess.wasm lex.yy.c
	${RM} -f lex.yy.c

optimize.wasm: optimize.lex
	${LEX} ${LEXFLAGS} -i < optimize.lex > lex.yy.c
	${CC} ${CFLAGS} -o optimize.wasm lex.yy.c
	${RM} -f lex.yy.c

bbfilter.wasm: bbfilter.c
	${CC} ${CFLAGS} -o bbfilter.wasm bbfilter.c

distclean:
	make -f makefile.xcmp.wasm clean

dist:
	make clean
	make distclean
	make -f makefile.xcmp.wasm
	unix2dos *.txt *.c *.h

install: all

clean:
	${RM} -f a.out core 2600basic.wasm preprocess.wasm postprocess.wasm optimize.wasm bbfilter.wasm lex.yy.c

love:
	@echo "not war"
peace:
	@echo "not war"
hay:
	@echo "while the sun shines"
believe:
	@echo "ok... the floor is lava"
