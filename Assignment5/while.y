%{
#include <stdio.h>
#include <stdlib.h>
int flag=0;
%}
%token ID NUM WHILE LE GE EQ NE OR AND
%right '='
%left AND OR
%left '<' '>' LE GE EQ NE
%left '+''-'
%left '*''/'
%right UMINUS
%left '!'
%%
S : ST1 {printf("Input accepted.\n");flag=1;};
ST1 : WHILE'(' E2 ')' '{' ST '}'
ST : ST ST
| E';'
;
E : ID'='E
| E'+'E
| E'-'E
| E'*'E
| E'/'E
| E'<'E
| E'>'E
| E LE E
| E GE E
| E EQ E
| E NE E
| E OR E
| E AND E
| ID
| NUM
;
E2 : E'<'E
| E'>'E
| E LE E
| E GE E
| E EQ E
| E NE E
| E OR E
| E AND E
| ID
| NUM
;
%%
int main()
{
printf("Enter the exp: ");
yyparse();
}

yyerror()
{
	if(flag==0)
		printf("Input Rejected");
	else
		printf("Input Accepted");		
}
