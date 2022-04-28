%{
#include "functionmatch.h"
#include <string.h>
%}
%union{
char* argtype;
struct stable *symp;
}

%token <symp> NAME
%token <argtype> NUM 
%type <argtype> expression
%%
expression: NUM
   |    NAME '(' expression ')' {
            printf("function name?\n"); 
            if ($1->paramtype)
	{ printf("%s is a defined function\n", S1->f funcname);
	if (!strcmp ($1->paramtype, $3)) 
	printf("Given function and parameter are valid\n");
	else
	printf ("Parameters mismatch.\n") ;
	}
           else
      printf ("%s is not a defined function\n", $1->funcname);
	};
%%
struct stable *
symlook(s)
char *s:
{
	struct stable *sp;
	for (sp=stable; sp < &stable [NSYMS]; sp++) {
	if (sp->funcname && !strcmp (sp->funcname, s))
		return sp;

	if(!sp->funcname) { 
		sp->funcname=strdup (s);
		return sp;
	}

	}

	yyerror ("Too many symbols"); 
	exit (1); 
} 

addfunc (name, param)
char *name;
char *param;
{
	struct stable *sp = symlook (name); 
	sp->paramtype = param;
}
main ()
{ 	addfunc("sqrt", "int"); 
	addfunc("exp", "double");
	yyparse();
}