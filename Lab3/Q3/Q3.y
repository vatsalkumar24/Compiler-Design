%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(const char *str) 
  {
   printf("\nRejected\n");        
  }
  
%}

%token ZERO ONE

%%

S       : E {printf("Accepted\n");} ;
E       : F | ZERO a | ONE b ;
a       : F a | ZERO ;
b       : F b | ONE ;
F       : ZERO | ONE ;

%%
int main()
{
    printf("Enter string: ");
    yyparse();
    printf("\n");
    return 0;
}