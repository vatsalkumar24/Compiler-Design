%{
    int vowels = 0;
    int consonents = 0;   
%}

%%
[aeiouAEIOU] {vowels++;}
[a-zA-Z] {consonents++;}
%%
main()
{
printf("Enter string: ");
yylex();
printf("Vowels Count: %d \n",vowels);
printf("Consonents Count: %d\n",consonents);
return 0;
}