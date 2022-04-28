%{
    #include <stdio.h>   
%}

%%

[-+][0-9]+      {printf("Signed integer\n");}
[0-9]+      {printf("Unsigned integer\n");}
[ \t]       ;
\n          {return 0;}
.           {return 0;} 
%%

int main(){
   yylex();
}