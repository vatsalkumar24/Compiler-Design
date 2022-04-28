%{
    #include<stdio.h>
    int yyerror(char* s)
	{
    	printf("Not valid syntax.\n");
		return 1;
	}
%}

%start E
%token STRUCT TYPE NUM ID SC OBR CBR OSB CSB MAIN INC OAB CAB DOT HDR AS

%%
E : include struct main {printf("Correct syntax!\n");} ;
include : INC OAB HDR CAB | include INC OAB HDR CAB ;
struct : STRUCT ID OBR stmts CBR var SC | STRUCT ID OBR stmts nested_struct CBR var SC  | STRUCT ID OBR nested_struct stmts CBR var SC ; 
nested_struct: STRUCT ID OBR stmts CBR ID SC | STRUCT ID OBR stmts CBR ID OSB NUM CSB SC; 
main : TYPE MAIN OBR stmts CBR;
var : ID | ID OSB NUM CSB | ;
stmts : TYPE ID SC | TYPE ID OSB NUM CSB SC | stmts TYPE ID SC | stmts TYPE ID OSB NUM CSB SC | decl ;
decl : STRUCT ID ID SC;
%%
int main()
{
    extern FILE *yyin;
    yyin = fopen("struct.c", "r");
	yyparse();
	return 0;
}