  /* This is the declaration section */

%{
  /* We declare symbols for counting the symbol types */
    int reservedSymbol,puntuationSymbol,relationalSymbol,arithmeticlogicSymbol,assignmentSymbol,numberSymbol,identifierSymbol,commentSymbol,multiCommentSymbol,errorSymbol;
%}

  /* This is the rule definition */

%%
  /* All of the expresions have similar instructions after the token is recognized. The counter for the symbol is incremented by one and the symbol is printed with the table format */

  /* These are the definitions for reserved symbols, we could combine them in one with various | but I decided to seperate them. */
int					{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
float				{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
if					{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
then				{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
else				{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
while				{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
read				{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
write				{reservedSymbol++;printf("Reserved\t\t\t%s\n",yytext);}
  /* These are the definitions for puntuation symbols, we could combine them in one with various | but I decided to seperate them. */
\(					{puntuationSymbol++;printf("Puntuation\t\t\t%s\n",yytext);}						
\)					{puntuationSymbol++;printf("Puntuation\t\t\t%s\n",yytext);}						
\{					{puntuationSymbol++;printf("Puntuation\t\t\t%s\n",yytext);}	
\}					{puntuationSymbol++;printf("Puntuation\t\t\t%s\n",yytext);}	
,					{puntuationSymbol++;printf("Puntuation\t\t\t%s\n",yytext);}
;					{puntuationSymbol++;printf("Puntuation\t\t\t%s\n",yytext);}
  /* These are the definitions for relational symbols, we could combine them in one with various | but I decided to seperate them. */
\<					{relationalSymbol++;printf("Relational\t\t\t%s\n",yytext);}
=					{relationalSymbol++;printf("Relational\t\t\t%s\n",yytext);}
\<=					{relationalSymbol++;printf("Relational\t\t\t%s\n",yytext);}
\>=					{relationalSymbol++;printf("Relational\t\t\t%s\n",yytext);}
!=					{relationalSymbol++;printf("Relational\t\t\t%s\n",yytext);}
  /* These are the definitions for arithmetic and logical symbols, we could combine them in one with various | but I decided to seperate them. */
\+					{arithmeticlogicSymbol++;printf("Arithmetic&Logic\t\t%s\n",yytext);}						
-					{arithmeticlogicSymbol++;printf("Arithmetic&Logic\t\t%s\n",yytext);} 						
\*					{arithmeticlogicSymbol++;printf("Arithmetic&Logic\t\t%s\n",yytext);} 						
\/					{arithmeticlogicSymbol++;printf("Arithmetic&Logic\t\t%s\n",yytext);}
  /* These are the definitions for assignment symbols, we could combine them in one with various | but I decided to seperate them. */ 							
:=					{assignmentSymbol++;printf("Assignment\t\t\t%s\n",yytext);}
  /* These are the definitions for number symbols, we could combine them in one with various | but I decided to seperate them. */
[0-9][0-9]*			{numberSymbol++;printf("Number (I)\t\t\t%s\n",yytext);}
0(c|C)[0-7]+		{numberSymbol++;printf("Number (O)\t\t\t%s\n",yytext);}
0(x|X)[0-9A-Fa-f]+  {numberSymbol++;printf("Number (H)\t\t\t%s\n",yytext);}
[+-]?[0-9]*"."[0-9]+([eE][-+]?[0-9]+)?		{numberSymbol++;printf("Number (F)\t\t\t%s\n",yytext);}
  /* These are the definitions for Identifier symbols, we could combine them in one with various | but I decided to seperate them. */
[A-Za-z_][A-Za-z0-9_]*						{identifierSymbol++;printf("Identifier\t\t\t%s\n",yytext);}
  /* These are the definitions for comment symbols, we could combine them in one with various | but I decided to seperate them. */
"/*"((("*"[^/])?)|[^*])*"*/"				{commentSymbol++;printf("Comment (M)\t\t\t%s\n",yytext);}
"//".*										{commentSymbol++;printf("Comment (S)\t\t\t%s\n",yytext);} 
  /* Expresions for blank spaces in the files*/
\n
\t
\r
\v
\f
" "
  /* Last rule that indicates no other rule was met and thus the token is an error */
. 											{errorSymbol++;printf("Error\t\t\t\t%s\n",yytext);}

%%

  /* This is the main program */

int main(void) {
	printf("Token/Symbol\t\t\tValue\n"); /* Creation of the header for table formed */
    yylex();       /* Defined by flex */
    printf("Final Symbol Count\n"); /*We print the final symbol count header*/
    printf("Reserved\tPuntuation\tRelational\tArith/Logic\tAssignment\tNumber\tComment\tErrors\n"); /* We print the name of each column */
    printf("%d\t\t%d\t\t%d\t\t%d\t\t%d\t\t%d\t%d\t%d\n", reservedSymbol, puntuationSymbol, relationalSymbol, arithmeticlogicSymbol,assignmentSymbol,numberSymbol,commentSymbol+multiCommentSymbol,errorSymbol); 
    /*We print the number of symbols found per symbol category*/
    return 0;
}