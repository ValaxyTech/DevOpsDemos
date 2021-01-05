XYZ.exe:main.o big2.o big3.o factorial.o pali.o prime.o reverse.o
	gcc -o XYZ.exe main.o big2.o big3.o factorial.o pali.o prime.o reverse.o
main.o:main.c
	gcc -c main.c
big2.o:big2.c
	gcc -c big2.c
big3.o:big3.c
	gcc -c big3.c
factorial.o:factorial.c
	gcc -c factorial.c
pali.o:pali.c
	gcc -c pali.c
prime.o:prime.c
	gcc -c prime.c
reverse.o:reverse.c
	gcc -c reverse.c


