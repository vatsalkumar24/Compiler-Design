%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
    int yylex();
    int yyerror(char* s)
	{
    	printf("Not valid program.\n %s", s);
		return 1;
	}
	int flag;
	int i;
	int k =0;	
%}

%start S
%token MAINB PRINTFF SCANFF ID INCLUDE NUMBER BLK COND

%%
S : includes main {printf("The given code is valid.");}
includes : include includes | ;
include : INCLUDE;
main : MAINB blks ;
blks : BLK | COND BLK | PRINTFF BLK | SCANFF BLK;
%%

int main()
{
	extern FILE *yyin;
    yyin = fopen("code.cpp", "r");
	yyparse();
	return 0;
}
