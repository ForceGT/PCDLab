/*
Given grammar is assumed to be 
E -> TE'
E' -> +TE' | ε
T -> FT'
T' -> *FT' | ε
F -> (E) | id
*/

#include<stdio.h>
#include<string.h>
#include<ctype.h> // Used for isalnum function below .isalnum checks if character is alphanumeric or not

char input[10];
int i,error;
void E();
void T();
void Eprime();
void Tprime();
void F(); 
main()
     {
	i=0;
	error=0;
        printf("Enter an arithmetic expression   :  "); // Eg: a+a*a is accepted and ++a is not accepted
        gets(input);
        E();
        if(strlen(input)==i && error==0)//Checking for faulty types
           printf("\n Accepted..!!!\n");
        else printf("\n Rejected..!!!\n");
      }
         
         
 
void E()
{
     T();
     Eprime();//Eprime is just another name for E'
}
void Eprime()
{
     if(input[i]=='+')
     {
     i++;
     T();
     Eprime();
     }
     }
void T()
{
     F();
     Tprime();
}
void Tprime()
{
     if(input[i]=='*')
     {
         i++;
         F();
         Tprime();
     }
}
void F()
{
     if(isalnum(input[i]))i++;
     	else if(input[i]=='(')
     	{
     	   i++;
     	   E();
      	  if(input[i]==')')
        	i++;

          else error=1;
      	}
        
     else error=1;
}



