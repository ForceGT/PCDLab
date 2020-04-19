%{
%}
letter [a-zA-z]
digit [0-9]
%%
\n yylineno++;
#include<{letter}+(\.{letter}*)?> 		 printf("%d\t%s\tPREPROCESSOR\n",yylineno,yytext);
return|main|for|while|case|switch|if|else|break printf("%d\t%s\t\t\tKEYWORD\n",yylineno,yytext);
int|float|char|struct|void|double		 printf("%d\t%s\t\t\tDATATYPE\n",yylineno,yytext);
\(|\)|\{|\}					 printf("%d\t%s\t\t\tBRACKET\n",yylineno,yytext);
{letter}({letter}|{digit})* 			 printf("%d\t%s\t\t\tIDENTIFIER\n",yylineno,yytext);
{letter}+\(\)					 printf("%d\t%s\t\t\tFUNCTION NAME\n",yylineno,yytext);
{digit}+ 					 printf("%d\t%s\t\t\tCONSTANT\n",yylineno,yytext);
;|, 						 printf("%d\t%s\t\t\tDELIMITER\n",yylineno,yytext);
\"({letter}|{digit}|" ")*\" 			 printf("%d\t%s\t\tSTRING CONSTANT\n",yylineno,yytext);
"="|"+"|"-"|"/"|"*"|"%"|"<"|">"|"<="|">="	 printf("%d\t%s\t\t\tOPERATOR\n",yylineno,yytext);
\%d|\%f|\%c|\%s|\%lf				 printf("%d\t%s\t\t\tFORMAT SPECIFIER\n",yylineno,yytext);
[a-zA-Z ]+"*""/"				 printf("%d\t%s\tIt is an error\n",yylineno,yytext);
;[^\t\n]					 printf("%d\t%s\t\t\tIt is an error\n",yylineno,yytext);
{digit}+({letter}|{digit}|_)*			 printf("%d\t%s\t\t\tInvalid Identifier\n",yylineno,yytext);
\t ;
" " ;
\" ;
%%
int yywrap(){
    return 1;
}
int main(){
    yyin=fopen("file.c","r");;
    printf("LINE\tLEXME\t\t\tTOKEN\n");
    yylex();
    fclose(yyin);
    return 0;
}

 



 


