%{
#include <stdio.h>
#define SAVE_TOKEN yylval.string = new string(yytext)
#define TOKEN(t) ( yylval.token = t)
%}

%option noyywrap

%%
[ \t\r\n]                                   ;

"<?php"                                     printf("<?php\n");

"if"                                        puts("T_IF"); //return TOKEN(T_IF);
"else"                                      puts("T_ELSE"); //return TOKEN(T_ELSE);
"return"                                    puts("T_RETURN"); //return TOKEN(T_RETURN);
"for"                                       puts("T_FOR"); //return TOKEN(T_FOR);
"while"                                     puts("T_WHILE"); //return TOKEN(T_WHILE);

"#".*                                       ;
"\/\/".*                                    ;

";"                                         printf("T_SEMICOLON;\n"); //return TOKEN(T_SEMICOLON);
$[a-zA-Z_][a-zA-Z0-9_]*                     printf("T_IDENTIFIER: %s\t", yytext);

[0-9]+\.[0-9]*			                    printf("T_FLOAT: %s\t", yytext);
[0-9]+  				                    printf("T_INTEGER: %s\t", yytext);

"+"						                    printf(" T_PLUS "); //return TOKEN(T_PLUS);
"-"                                         printf(" T_MINUS "); //return TOKEN(T_EQUAL);
"*"                                         puts("T_MUL"); //return TOKEN(T_MUL);
"/"                                         puts("T_DIV"); //return TOKEN(T_DIV);
"="						                    printf(" T_EQUAL "); //return TOKEN(T_EQUAL);

.                                           printf("UNKNOWN_TOKEN: %s\t", yytext);
%%

int main(int argc, char **argv)
{
    yylex();
    return 0;
}