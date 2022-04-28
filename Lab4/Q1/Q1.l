%{
    #include "y.tab.h"
    extern int yylval;  
%}

alpha [a-zA-Z]
digit [0-9]

%%
"int main()" {return MAINB;}
"printf"  { return PRINTFF; }
"scanf"   { return SCANFF; }
(if|while)" "\(.*\) {return COND;}
^"#include"[ ]*<.+\.h>      { return INCLUDE; }
[-]?{digit}+                { return NUMBER; }
{alpha}({alpha}|{digit})*   { return ID; }
[{]((.|\n)*)[}] {return BLK;}


%%

int yywrap(){
    return 1;
}