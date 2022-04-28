%{
    #include<stdio.h>
%}

%token      NUMBER
%left       '-' '+'
%left       '(' ')'

%%

S       : E {printf("Output = %d\n", $1);}

E       : E '-' E { $$ = $1 - $3; }
        | E '+' E { $$ = $1 + $3; }
        | '(' E ')' { $$ = $2; }
        | NUMBER { $$ = $1; }
        ;
%%

int yyerror(char* s) {
    printf("Invalid Expression!\n");
}

int main() {
    printf("Enter an Expression: ");
    yyparse();
}