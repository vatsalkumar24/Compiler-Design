%{
    #include "y.tab.h"
    int lineno=1;
%}

%%

"="                         	{return ASSIGN;}
";"                        	{return SQ;}
"("				{return OSB;}
")"				{return CSB;}
"{"				{return OMB;}
"}"				{return CMB;}
"["				{return OBB;}
"]"				{return CBB;}
"<"				{return OAB;}
">"				{return CAB;}
"+"|"*"|"-"			{return MATHOPR;}
"#include"			{return INC;}
"++"|"--"			{return UOPR;}
".h"				{return HDREND;}
("int"|"float")             	{return TYPE;}
"for"				{return FORS;}
[0-9]+|[0-9]+.[0-9]+        	{return NUM;}
[a-zA-Z0-9]+               	{yylval.str = yytext; return ID;}
[\n]*                       	{lineno++;}
.                           	{}

%%


int yywrap()
{
    return 1;
}

