%{
    #include "y.tab.h"
%}

%%
(int|double) {return TYPE;}
[a-zA-Z0-9]* {yylval.word = yytext; return ID; }
; {return SC;}
[\n]* {return NL;}
[\t ]   ;
%%

int yywrap(){
    return 1;
}
