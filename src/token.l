%{
#include <stdio.h>

#define SAVE_TOKEN  yylval.string = new std::string(yytext, yyleng)
//#define TOKEN(t)    (yylval.token = t)
%}

%%

[ \t\r\n]				;
"if"                    puts("TIF");
.						printf("Unknown token:%s\n", yytext); yyterminate();

%%