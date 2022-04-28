%{
    #include "y.tab.h"
    extern int yylval;  
%}

%%
[0-9]+  {yylval = atoi(yytext);return NUM;}
\n	 {return 1;}
. ;
%%

int yywrap(){
    return 1;
}