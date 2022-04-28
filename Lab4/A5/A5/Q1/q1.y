%{
	#include <stdio.h>
	#include <string.h>
	#include <stdlib.h>
    int yylex();
    int yyerror(char *s);
	int flag;
	int i;
	int k =0;	
%}

%start S
%token INC ID OAB CAB OCB CCB MAINB CODE INCEND BLK COND

%%
S : includes main {printf("The given code is valid.");}
includes : include includes | ;
include : INC OAB ID INCEND CAB ;
main : MAINB blks ;
blks : BLK | COND BLK ;
%%

int yyerror(char* s) {
    printf("Not valid program.\n %s", s);
	return 1;
}

int main()
{
	extern FILE *yyin;
    yyin = fopen("code.cpp", "r");
	yyparse();
	return 0;
}
