%{
        #include<stdio.h>
        #include<stdlib.h>
        #include<string.h>
        int yylex();
        int yyerror(char *s);
        char *yytext;
        char declrs[100][100];
        int declrCount=0;
        void decl(char *var);
        int ifDecl(char *var);
%}

%union {
    char* str;
}

%start S
%token <str> ID TYPE ASSIGN NUM SQ MAIND OMB CMB OSB CSB OBB CBB OAB CAB INC HDREND UOPR FORS MATHOPR

%%

S : incls fns {printf("The code for matrix operation is okay\n");}

fns: fns fn |;
fn: TYPE f OSB CSB OMB codes CMB | TYPE {yyerror("invalid function declaration");};

incls: incls incl | ;
incl: INC OAB ID HDREND CAB | INC OAB ID HDREND { yyerror("invalid header declaration");}  ;

codes: mainblk | dclrs matmul | ;


matmul: mul sub add | {yyerror("given code for matrix multiplication is incorrect");}

mul: for OMB for OMB for OMB arropr CMB CMB CMB;
add: for OMB for OMB arropr CMB CMB;
sub: for OMB for OMB arropr CMB CMB;


for: FORS OSB TYPE ID ASSIGN NUM SQ ID OAB NUM SQ ID UOPR CSB;

arropr: arrnotation ASSIGN arrnotation MATHOPR arrnotation MATHOPR arrnotation SQ | arrnotation ASSIGN arrnotation MATHOPR arrnotation SQ; 

arrnotation: ID OBB ID CBB OBB ID CBB

mainblk: ID OSB CSB SQ | ID OSB CSB {yyerror("missing ;");} | {yyerror("invalid calling of function");};

dclrs: dclrs dclr | ;
dclr : TYPE f  SQ | TYPE f ASSIGN NUM SQ |arrdclr | TYPE f {yyerror("missing ;");} | TYPE {yyerror("forgot something");};
arrdclr: TYPE f OBB NUM CBB OBB NUM CBB SQ |TYPE f OBB NUM CBB OBB NUM {yyerror("missing ]");} 
f : ID {if (ifDecl($1)) {printf("%s already declared\n"); yyerror("redeclaration of variable");} else decl($1);}
%%

extern int lineno;

int yyerror(char *s){
        printf("ERROR: %s \n%s \nLineno: %d\n", s, yytext, lineno);
        exit(0);
}

int ifDecl(char *var){
        for (int i=0;i<declrCount;i++){
                if (strcmp(declrs[i], var)==0){
                        return 1;
                }
        }
        return 0;
}

void decl(char *var){
        strcpy(declrs[declrCount], var);
        declrCount++;
}

int main(){
        extern FILE *yyin;
        yyin=fopen("code.cpp", "r");
        yyparse();
        return 0;
}