%{
    #include <stdio.h>  
%}
%%
double|if|static|break|else|int|struct|case|long|switch|char|float|void|while|main|while|for|printf|return    { printf("Reserved Word!\n"); }
[a-zA-z]+  {printf("Unreserved Word!\n");}
\n {return 0;}
. ;
%%

int main()
{
    yylex();
}