%{
    int check = 0;
    char *c;
%}
%%
[\n] {
    if(check == 0)
        printf("\nNo Other characters are detected apart from alphabets\n");
    else { printf("\nOther Characters are detected!\n"); check = 0; }
}
[^a-zA-Z] { check = 1;}
%%
  
main()
{
printf("Enter string: ");
yylex();
return 0;
}