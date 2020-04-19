%{
#include "y.tab.h"
extern int yylval;
%}
%%
if {return(IF);}
"(" {return(OPBR);}
")" {return(CLBR);}
"=" {return(EQU);}
"<"|">"|"=="|"!=" {return(RELOP);}
"&&" {return(AND);}
[a-zA-Z]+ {yylval=yytext[0]; return(ID);}
[0-9]+ {yylval=atoi(yytext); return(NUM);}
%%
yywrap()
{
return 1;
}
