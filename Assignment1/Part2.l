%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
is |
am |
are |
was |
were |
has |
have |
will |
shall |
had |
can |
could |
would |
should |
do |
does |
did {printf("%s is a verb\n",yytext);}
he |
she |
it |
they |
you |
we |
I {printf("%s is a pronoun\n",yytext);}
to |
from |
behind |
in |
into |
above |
below |
between {printf("%s is a preposition\n",yytext);}
[a-zA-Z]+ {printf("Can't recognize, %s might be a noun\n",yytext);}
%%









int yywrap()
{
return 0;
}
int main()
{
printf("Enter the input\n");
yylex();
return 0;
}

