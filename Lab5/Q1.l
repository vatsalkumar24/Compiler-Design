%{
    #include "y.tab.h"
    extern int yylval;  
%}

alpha [a-zA-Z]
digit [0-9]

%%
"for"                       {return FOR;}
"if"	                    {return IF;}
"else"	                    {return ELSE;}
"break"                     {return BREAK;}
"continue"                  {return CONTINUE;}
"int"                       {return TYPE;}  
"printf(".*")"              {return PRNT;}
{digit}+                    {return NUM;}
{alpha}({alpha}|{digit})*   {return ID;}
=|<|>|!=|<=|>=|==|&&|"||"|[+-/*] {return OP;}
"++"|"--"                   {return UOP;}
[ \n\t]                    ;
.                           {return *yytext;}
%%

int yywrap(){
    return 1;
}