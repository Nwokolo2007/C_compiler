/*** Definition section ***/

%{
#include "y.tab.h"
#include <string.h>

int yyerror(char *errormsg);

int countn =0;

%}


%option noyywrap



space [ \t]
spaces {space}+
letter [a-zA-Z]
digit [0-9]
digits {digit}+
addition "+"
substraction "-"
multiplication "*"
division "/"

character "'"[^’]"'"
string \"(\\.|[^"\\])*\"


number [-]?{digits}("."{digits})?("E"[+-]?{digits})?

identifier {letter}({letter}|{digit}|"_")*
integer 	int
real	float
boolean	boolean
char		char
string_type		string
void		void

true true
false false




equal ==
notEqual !=
lessthan <
lessthanorequl <=
greaterthan >
greaterthanorequal >=
and	&&
or		||
not	!

function 	function
start	begin
end		end
return	return
if		if
then	then
else	else
while	while
do		do
read	read
write	write


%%
    /*** Rules section ***/
	


{character}	{strcpy(yylval.node_object.name,(yytext)); return(CHARACTER);}	
{string}	{strcpy(yylval.node_object.name,(yytext)); return(STRING);}	



{integer}		{strcpy(yylval.node_object.name,(yytext)); return(INTEGER);}		
{real}		{strcpy(yylval.node_object.name,(yytext)); return(REAL);}
{boolean}	{strcpy(yylval.node_object.name,(yytext)); return(BOOLEAN);}
{char}		{strcpy(yylval.node_object.name,(yytext)); return(CHARACTER_TYPE);}
{void}		{strcpy(yylval.node_object.name,(yytext)); return(VOID);}

{true}		{strcpy(yylval.node_object.name,(yytext)); return(TRUE);}
{false}		{strcpy(yylval.node_object.name,(yytext)); return(FALSE);}


{addition}			{strcpy(yylval.node_object.name,(yytext)); return(ADDITION);}	
{substraction}		{strcpy(yylval.node_object.name,(yytext)); printf("SUB OPERATOR");return(SUBSTRACTION);}	
{multiplication}	{strcpy(yylval.node_object.name,(yytext)); return(MULTIPLICATION);}	
{division}			{strcpy(yylval.node_object.name,(yytext)); return(DIVISION);}	

{number}	{strcpy(yylval.node_object.name,(yytext)); return(NUMBER);}		

{equal}			{strcpy(yylval.node_object.name,(yytext)); return(EQUAL_COMPARE);}	
{notEqual}		{strcpy(yylval.node_object.name,(yytext)); return(NOTEQUAL_OPERATOR);}	
{lessthan}			{strcpy(yylval.node_object.name,(yytext)); return(LESS_OPERATOR);}	
{lessthanorequl}	{strcpy(yylval.node_object.name,(yytext)); return(LESSTHANOREQ_OPERATOR);}	
{greaterthan}			{strcpy(yylval.node_object.name,(yytext)); return(GREATER_THAN);}	
{greaterthanorequal}	{strcpy(yylval.node_object.name,(yytext)); return(GREATEROREQ);}	



{function}	{strcpy(yylval.node_object.name,(yytext)); return(FUNCTION);}		
{start} 	{strcpy(yylval.node_object.name,(yytext)); return(START);}		
{end}		{strcpy(yylval.node_object.name,(yytext)); return(END);}	
{return}	{strcpy(yylval.node_object.name,(yytext)); return(RETURN);}		
{if}		{strcpy(yylval.node_object.name,(yytext)); return(IF);}		
{then}		{strcpy(yylval.node_object.name,(yytext)); return(THEN);}		
{else}		{strcpy(yylval.node_object.name,(yytext)); return(ELSE);}		
{while}		{strcpy(yylval.node_object.name,(yytext)); return(WHILE);}		
{do}		{strcpy(yylval.node_object.name,(yytext)); return(DO);}		
{read}		{strcpy(yylval.node_object.name,(yytext)); return(READ);}		
{write}		{strcpy(yylval.node_object.name,(yytext)); return(WRITE);}			

{identifier}	{strcpy(yylval.node_object.name,(yytext)); return(IDENTIFIER);}

\/\/.*	{ ; }
\/\*(.*\n)*.*\*\/	{ ; } 
[ \t]*	{ ; }

[\n]    {   countn++; return *yytext;   }
.		{   return *yytext;   }
%%