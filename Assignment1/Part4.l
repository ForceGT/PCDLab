%{ 
#include<stdio.h> 
#include<string.h> 
char replace_with[20]; 
char replace[20]; 

%} 
%% 
[a-zA-Z]+    {if(strcmp(yytext, replace)==0) 
			fprintf(yyout, "%s", replace_with); 
                      else
			fprintf(yyout, "%s", yytext);} 
.             fprintf(yyout, "%s", yytext); 
%% 
int yywrap() 
{ 
	return 1; 
} 
int main() 
{ 
	printf("Enter the string to replace\n");
	scanf("%s",replace);
	printf("Enter the string to replace with\n");
	scanf("%s",replace_with);
	extern FILE *yyin, *yyout; 
	yyin=fopen("file1.txt", "r"); 
	yyout=fopen("file2.txt", "w"); 
	yylex(); 
} 
