%{
    #include<stdio.h>
    int cnt=0;
    int cond1=0,cond2=0,cond3=0;
    //cond1 for case to check // /* scenario
    //cond2 for case to check /* // scenario
    //cond3 for case to check // // scenarion
    
    
%}

%%

[ \t]+      {;}
"//"        {if(cond1==0&&cond2==0&&cond3==0){cnt++;cond1=1;}}
"/*"        {if(cond1==0&&cond2==0){cond2=1;if(cond3==0)cnt++;}}
"*/"        {if(cond1==0&&cond2==1){cond3=1;cond2=0;}}
\n          {if(cond2==1){cnt++;}cond1=0;cond3=0;}
.           {;}
%%

int main( )
{
   printf("entre the code\n");
   yylex();
   printf("no of lines commented:%d\n",cnt);
}
