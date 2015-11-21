all: yacc lex cc clean

lex:
	lex mycalc.lex

yacc:
	yacc -dv mycalc.y

cc:
	cc -o mycalc y.tab.c lex.yy.c -ly -ll

clean:
	rm y.output
	rm lex.yy.c
