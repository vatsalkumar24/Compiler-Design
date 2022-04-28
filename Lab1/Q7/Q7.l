%{
    int s = 0; 
    int c = 0;
    int spl = 0;
%}
%%
[a-z] {s++;}
[A-Z] {c++;}
[^\na-zA-Z] {spl++;}
%%
  
main()
{
printf("Enter string: ");
yylex();
printf("No.of Small letters: %d\n",s);
printf("No.of Capital letters: %d\n",c);
printf("No.of Special symbol: %d\n",spl);

return 0;
}