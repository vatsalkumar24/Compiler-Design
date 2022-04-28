%{
    #include <stdio.h>
    #include <string.h>
    int yyerror(char* s) {
        printf("error\n");
    }
    int binary[100];
    int num ,size,i;
%}
%token NUM
%%
S: DtoB {return 0;} ;
DtoB : NUM {
        num =$1; 
        while (num) 
        {
            binary[size] = num % 2;
            num = n / 2;
            size++;
        }
        for (i = size - 1; i >= 0; i--)
            printf("%d",binary[i]);
        printf("\n");
        };
%%

int main() {
    printf("Enter decimal number: ");
    yyparse();
    return 0;
}