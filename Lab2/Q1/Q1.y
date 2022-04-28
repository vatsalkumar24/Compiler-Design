%{
    #include<stdio.h>
%}

%token      NUMBER
%left       '-'
%left       '*'
%left       UMINUS

%%

PrecedenceExpression: expr {
    printf("Result = %d\n", $$);
    }

expr : 
    expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | '-' expr %prec UMINUS { $$ = -$2; }
    | NUMBER { $$ = $1; }
    ;
%%

int yyerror(char* s) {
    printf("\nExpression is invalid\n");
}

int main() {
    yyparse();
}