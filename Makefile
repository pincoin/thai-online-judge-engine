all: a.out

a.out: main.o whitelist.o
	gcc -Wall -o a.out main.o whitelist.o -lseccomp

main.o: main.c main.h
	gcc -g -Wall -D DEBUG_PTRACE -D DEBUG_SECCOMP -o main.o -c main.c

whitelist.o: whitelist.c whitelist.h
	gcc -g -Wall -o whitelist.o -c whitelist.c

clean:
	rm -f a.out *.o
	rm -f *.out *.log
