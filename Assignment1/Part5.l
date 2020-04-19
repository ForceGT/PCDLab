%{
#include<stdio.h>
#include<stdlib.h>
int ch;
int i;
int flag=1;
%}

%%

[a-z]		{
				if(ch==1)
				{
					printf("%c",yytext[0]-32);
				}
				else if(ch==2)
				{
					printf("%c",yytext[0]);
				}
				else if(ch==3)
				{
					printf("%c",yytext[0]-32);
				}
				else
					flag=0;
			}
[A-Z]		{
				if(ch==1)
				{
					printf("%c",yytext[0]);
				}
				else if(ch==2)
				{
					printf("%c",yytext[0]+32);
				}
				else if(ch==3)
				{
					printf("%c",yytext[0]+32);
				}
				else
					flag=0;
			}
[0-9]		{printf("%c",yytext[0]);		}
[^a-z]&[^A-Z]&[^0-9]	{printf("%c",yytext[0]);}
[\n]		ECHO;

%%

int yywrap()
{
	return 1;
}

int main()
{
	while(flag==1)
	{
		printf("\n");
		printf("1. Upper Case\n");
		printf("2. Lower Case\n");
		//printf("3. Sentence Case\n");
		printf("3. Toggle Case\n");
		printf("4.Exit\n");
		printf("Enter your choice : ");
		scanf("%d",&ch);
		printf("Enter the input\n");
		yylex();
	}
	return 0;
}
