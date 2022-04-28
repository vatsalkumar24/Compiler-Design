%{
    #include <stdio.h>
    #include <string.h>   
    #include <stdlib.h>
    extern int lineno;
    char *yytext;
    void yyerror(char *s) 
    {
        printf("\nERROR: %s encountered at %s in line %d\n", s, yytext, lineno);
        exit(0);        
    }
%}
%start S  
%token INC INT VOID ID RETURN IF ELSE NUM FOR WHILE ASN SC
%token OPR UNOP UNSPC COUT CIN OUT IN STRNG STRUCT DOUBLE FLOAT CHAR OP CP OCB CCB OSB CSB

%%
S               : include UNSPC struct function {printf("Correct CPP Code.\n");} ;
include         : INC include | ;
struct          : STRUCT ID OCB dclrs nested_struct CCB struct_dclr SC struct | ;
nested_struct   : STRUCT ID OCB dclrs nested_struct CCB struct_dclr SC nested_struct | STRUCT ID ID SC | ;
struct_dclr     : ID | ID OSB NUM CSB | ;
dclrs           : type ID SC dclrs | type ID OSB NUM CSB SC dclrs | ;
function        : type ID args OCB stmts RETURN NUM SC CCB function | ;
args            : OP arg CP ;
arg             : type ID ',' arg | type ID |  ;
type         : INT | VOID | FLOAT | CHAR | DOUBLE ;
stmts      :    | conditional stmts | declaration stmts | forloop stmts | whileloop stmts | assignment stmts | expr stmts 
                | output stmts | input stmts | STRUCT ID ID SC stmts
input           : CIN input_stat ; 
output          : COUT OUT STRNG SC | COUT OUT ID SC ;
input_stat      : IN ID input_stat SC | ;
declaration     : type ID SC ;
conditional     : IF OP expr CP OCB stmts CCB ELSE conditional | IF OP expr CP OCB stmts CCB ELSE OCB stmts CCB ;
forloop         : FOR OP assignment_for SC expr SC assignment_for CP OCB stmts CCB
                | FOR OP assignment_for SC expr SC expr CP OCB stmts CCB
whileloop       : WHILE OP expr CP OCB stmts CCB
assignment_for  : type ID ASN ID | type ID ASN NUM | ID ASN ID | ID ASN NUM | ID ASN expr | expr | ;
assignment      : type ID ASN ID SC | type ID ASN NUM SC | ID ASN ID SC | ID ASN NUM SC | ID ASN expr SC | expr SC ;
expr            : ID OPR ID | ID OPR NUM | ID OPR exp |ID UNOP | ID ;
exp             : ID OPR ID | NUM OPR ID | NUM OPR NUM ;
%% 

int main()
{
    extern FILE *yyin;
    yyin = fopen("code.cpp","r");
    yyparse();
    return 0;
}