%{
#include<stdio.h>
int flag=0;
%}

%token IF OPBR CLBR RELOP EQU ID NUM AND

%%
S: IF OPBR E1 CLBR {printf("accepted"); flag=1;}
| IF OPBR E1 AND E2 CLBR {printf("Accepted");flag=1;}
;
E1:ID RELOP ID
|ID RELOP NUM
;
E2:ID RELOP ID
|ID RELOP NUM
;
%%
int main()
{
yyparse();
}
yyerror(const char *msg)
{
if(flag==0){
printf("Not Accepted!");
}
else
{
printf("Accepted");
}
}
