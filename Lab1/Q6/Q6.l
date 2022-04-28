%{
    int words = 0;
    int c = 0;
%}
%%
[ \n] {
    if(c>=3 && c<=5)
    {
        words++;
    }
    c=0;
}
[a-zA-Z] {c++;}
%%
  
main()
{
printf("Enter string: ");
yylex();
printf("No.of strings having 3 to 5 alphabets: %d\n",words);
return 0;
}