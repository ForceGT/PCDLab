%{
#include<stdio.h> #include<stdlib.h>
%}

%%

[0-9]+	{printf("%s is a digit\n",yytext);}
[A-Za-z]+	{printf("%s is a letter\n",yytext);}
.	;

%%

int yywrap()
{
return 0;
}






int main()
{
printf("Enter the input\n"); yylex();
return 0;
}


