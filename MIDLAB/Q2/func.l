%{
    #include "y.tab.h"
    #include "functionmatch.h"
%}
%%
[0-9]+ {
    yylval.argtype = "int";
    return NUM;
}
([0-9]*\.[0-9]+) {
    yylval.argtype = "double";
    return NUM;
}
[ \t] ;
[A-Za-z]+ {
    struct stable *sp = look(yytext);
    yylval.symp = sp;
    return NAME;
}
\n return 0;
. return yytext[0];
%%