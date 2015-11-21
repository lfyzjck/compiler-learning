%{
int wordCount = 0;
int numberCount = 0;
%}
chars [A-za-z\_\'\.\"]
numbers ([0-9])+
delim [" "\n\t]
whitespace {delim}+
words {chars}+
%%

{words} { wordCount++; }
{whitespace} { /* do nothing*/ }
{numbers} { numberCount++; }
%%


int main()
{
    yylex(); /* start the
                analysis*/
    printf(" No of words: %d\n", wordCount);
    printf(" No of numbers: %d\n", numberCount);
    return 0;
}
int yywrap()
{
    return 1;
}
