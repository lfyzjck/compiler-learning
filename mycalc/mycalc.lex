%{
#include <stdio.h>
#include "y.tab.h"

int yywrap(void) 
{
    return 1;
}
%}

integer ([1-9][0-9]*)|0
double ([0-9]+\.[0-9]+)|0

%%

"+" return ADD;
"-" return SUB;
"*" return MUL;
"/" return DIV;
"\n" return CR;
{double} {
    double temp;
    sscanf(yytext, "%lf", &temp);
    yylval.double_value = temp;
    return DOUBLE_LITERAL;
}
{integer} {
    int temp;
    sscanf(yytext, "%d", &temp);
    yylval.int_value = temp;
    return INT_LITERAL;
}
[\t];
. {
    fprintf(stderr, "lexical error.\n");
    exit(1);
}
%%


