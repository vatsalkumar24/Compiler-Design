%{
    #include<stdio.h>
    int yyerror(char* s)
	{
    	printf("Not valid FOR loop syntax.\n");
		return 1;
	}
%}

%token FOR ID OP NUM IF ELSE BREAK CONTINUE TYPE UOP PRNT

%%
E : loop {printf("Correct FOR Loop Syntax!\n");};
loop : FOR '(' expr ';' expr ';' expr ')' block ;
block : stmt | codeblock ;
codeblock : '{' stmts '}' | '{' loop '}'; 
stmts : stmts stmt | stmts if_else | ;
if_else : IF '(' expr ')' codeblock ELSE codeblock | IF '(' expr ')' codeblock;
stmt : PRNT ';'| exprr ';' | BREAK | CONTINUE | loop ;
exprr : expr | ;
expr : TYPE ID OP expr | expr OP expr | ID OP expr | ID UOP | ID | NUM ;
%%

int main()
{
    extern FILE *yyin;
    yyin = fopen("forloop.c", "r");
	yyparse();
	return 0;
}