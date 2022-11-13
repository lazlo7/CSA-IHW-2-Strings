CC=gcc
CFLAGS=-std=c11
as-flavor=intel
name=prog

${name}-c:
	$(CC) ${CFLAGS} $(name).c -o $(name)-c

${name}-as:
	${CC} -c ${name}.S -o ${name}.o
	${CC} ${name}.o -o ${name}-as

${name}-raw:
	${CC} -S ${name}.c ${CFLAGS} -masm=${as-flavor} -o ${name}-raw.S  
	${CC} -c ${name}-raw.S -o ${name}-raw.o
	${CC} ${name}-raw.o -o ${name}-raw

all: ${name}-c ${name}-as
.PHONY : ${name}-c ${name}-as clean all
.DEFAULT_GOAL := all

clean:
	rm -f *.o
	rm -f $(name)-c
	rm -f $(name)-as
	rm -f ${name}-raw
	rm -f ${name}-raw.S