%{
    #include<stdio.h>
    int single=0, multi=0;    
    
%}
%%
"//".* {single++;}
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {multi++;}
.
\n
%%
int main()
{
    FILE *fp = fopen("sum.c","r");
    yyin = fp;
    yylex();
    printf("No.of Single Comments: %d\n",single);
    printf("No.of Multiple Comments: %d\n",multi);
    printf("Total No.of Commented lines: %d\n",multi+single);

}