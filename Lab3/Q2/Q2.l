%{
    #include<stdio.h>
    int key =0, op=0, id=0;    
%}

%%
double|if|else|int|char|float|void|while|main|while|for|printf|return|begin|break|#include|stdio.h   {key++;}
[a-zA-Z][a-zA-Z0-9]*    { id++;}
"++"|"--"|"+"|"-"|"*"|"/"|"%"   {op++;}
"<"|">"|"<="|">="|"=="|"="    {op++;}
.   ;
%%
int main()
{
    extern FILE *yyin;
    yyin = fopen("input.c","r");
    yylex();
    printf("No.of Keywords, Operators, Identifiers: %d %d %d\n",key,op,id);
}