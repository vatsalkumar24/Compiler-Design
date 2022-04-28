%{
#include <stdio.h>
#include <stdlib.h>
void yyerror (const char *str) {
	printf("Syntax Incorrect!\n");
}
%}
%token ID NUM SELECT FROM WHERE LIKE DESC ASC GROUP HAVING ORDER OR AND LE GE NE;
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%%
except : line ';' {printf("Correct Syntax\n"); exit(0);} 

line :  SELECT atributes FROM tableList W ;

W : WHERE conditions G | G ;
ST3 : GROUP atributes HC| HC ;
ST4 : HAVING conditions O | O ;
O : ORDER atributes DA | ;
DA : DESC | ASC | ;
atributes : ID',' atributes | '*' | ID ;
tableList : ID',' tableList | ID ; 
conditions : conditions OR conditions | conditions AND conditions | E ;
E : F '=' F | F '<' F | F '>' F | F LE F | F GE F | F NE F | F OR F | F AND F | F LIKE F ;
F : ID | NUM ;
%%
int main() 
{
	yyparse();
}


