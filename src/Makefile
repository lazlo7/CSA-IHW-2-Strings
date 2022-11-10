CC=gcc
name=prog

${name}-c:
	$(CC) $(name).c -o $(name)-c

${name}-as:
	${CC} ${as-flags} -S $(name).c -o $(name)-template.S

all: ${name}-c ${name}-as
.PHONY : ${name}-c ${name}-as clean

clean:
	rm -f $(name)