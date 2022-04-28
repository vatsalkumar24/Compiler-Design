%{
    #include "y.tab.h"
    extern int yylval;
    int lineno = 1;
%}

%%
#include[ ](<.*>)               {return INC;}
"using namespace std;"          {return UNSPC;}
struct                          {return STRUCT;}
int                             {return INT;}
double                          {return DOUBLE;}
char                            {return CHAR;}
float                           {return FLOAT;}
void                            {return VOID;}
return                          {return RETURN;}
cout                            {return COUT;}
cin                             {return CIN;}
"<<"                            {return OUT;}
">>"                            {return IN;}
if                              {return IF;}
else                            {return ELSE;}
for                             {return FOR;}
while                           {return WHILE;}
printf                          {;}
"("                             {return OP;}
")"                             {return CP;}
"{"                             {return OCB;}
"}"                             {return CCB;}
"["                              {return OSB;}
"]"                             {return CSB;}
\".*\"                          {return STRNG;}
[0-9]+                          {return NUM;}
"+"|"-"|"*"|"/"|"<"|">"|"<="|">="|"&"|"|"|"&&"|"||"|"^" {return OPR;}
"="                             {return ASN;}
"++"|"--"                       {return UNOP;}
[a-zA-Z_][a-zA-Z0-9_]*          {return ID;}
["//"].*[\n]                    {lineno++; }
[\n]                            {lineno++;}
;                               {return SC;}
.                               {;}

%%
