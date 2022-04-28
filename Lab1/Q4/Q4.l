%{
    int c = 0;
    int w = 0;
    int l = 0;  
%}
%%
[" "] {c++; w++;}
[\n] {w++; l++;}
. {c++;}
%%
  
main()
{
printf("Enter string: ");
yylex();
printf("No.of characters: %d\n", c);
printf("No.of words: %d\n", w);
printf("No.of lines: %d\n", l);
return 0;
}