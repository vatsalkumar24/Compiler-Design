%{
    int len = 0;  
%}
%%
. {len++;}
%%
  
main()
{
printf("Enter string: ");
yylex();
printf("length of given string: %d\n", len);
return 0;
}