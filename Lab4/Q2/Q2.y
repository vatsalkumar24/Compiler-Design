%{
	#include <stdio.h>
	#include <string>
	#include <stdlib.h>
	#include <iterator>
	#include<map>
	using namespace std;
	map<string, bool> idt;
     int yylex();
     int yyerror(char* s) {
	     return 1;
     }
	bool check(string word);
%}
%union {
    char* word;
}

%start S
%token TYPE SC NL
%token <word> ID

%%
S : lines {}
lines : line lines | ;
line : TYPE f SC NL;
f : ID {
     string word($1); 
     if(check(word))
     {    
          printf("Variable name cant be keyword error: %s\n",word.c_str());
          exit(1);
     }
     if(idt[word])
          printf("\nVariable already declared error: %s", word.c_str()); 
     else idt[word]=true;
     }; 
%%


int main()
{
	extern FILE *yyin;
     yyin = fopen("sum.c", "r");
	yyparse();
	return 0;
}
bool check(string word){
	string keyword[5];
	keyword[0]="read"; keyword[1]="int"; keyword[2]="double";keyword[3]="true"; keyword[4]="false";

	for (int i=0;i<5;i++){
		if (word==keyword[i]) 
               return true;
	}
	return false;
}