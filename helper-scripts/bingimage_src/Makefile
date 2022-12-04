
lex: lex.o
	gcc -o bingimage lex.o
	mkdir ~/.cache/bingimage
lex.o: lex.l
	flex -o lex.c lex.l
	gcc -c lex.c
