%{
    int positives = 0;  
    int negatives = 0;
    int positive_fractions = 0;
    int negative_fractions = 0;
%}
%%
[+]?[0-9]+ {positives++;}
[-][0-9]+ {negatives++;}
[+]?[0-9]*\.[0-9]+ {positive_fractions++;}
[-][0-9]*\.[0-9]+ {negative_fractions++;}
%%
  
main()
{
printf("Enter numbers: ");
yylex();
printf("No.of positive integers: %d\n", positives);
printf("No.of negative integers: %d\n", negatives);
printf("No.of positive fractions: %d\n", positive_fractions);
printf("No.of negative fractions: %d\n", negative_fractions);
return 0;
}