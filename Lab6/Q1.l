%{
    #include "y.tab.h"
    extern int yylval;  
%}

alpha [a-zA-Z]
digit [0-9]

%%
"struct"                    {return STRUCT;}
"#include"                  {return INC;}
"main()"                    {return MAIN;}
"int"|"double"|"char"       {return TYPE;}  
\.                          {return DOT;}
{digit}+                    {return NUM;}
{alpha}({alpha}|{digit})*   {return ID;}
{alpha}+[\.][h]             {return HDR;}
"="                         {return AS;}
"<"                         {return OAB;}
">"                         {return CAB;}
"{"                         {return OBR;} 
"}"                         {return CBR;} 
"["                         {return OSB;}
"]"                         {return CSB;}
";"                         {return SC;}
[ \n\t]                     ;
.                           {return yytext[0];}
%%

int yywrap(){
    return 1;
}