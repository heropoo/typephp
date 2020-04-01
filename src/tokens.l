%{

#include <string>
#include "node.h"
#include "parser.hpp"

#define SAVE_TOKEN  yylval.string = new std::string(yytext, yyleng)
#define TOKEN(t)    (yylval.token = t)
}%

%%

[ \t\n]                 ;
[a-zA-Z_][a-zA-Z0-9_]*  SAVE_TOKEN; return T_IDENTIFIER;
[0-9]+.[0-9]*           SAVE_TOKEN; return T_DOUBLE;
[0-9]+                  SAVE_TOKEN; return T_INTEGER;
"="                     return TOKEN(T_EQUAL);
"=="                    return TOKEN(T_CEQ);
"!="                    return TOKEN(T_CNE);
"<"                     return TOKEN(T_CLT);
"<="                    return TOKEN(T_CLE);
">"                     return TOKEN(T_CGT);
">="                    return TOKEN(T_CGE);
"("                     return TOKEN(T_L_PAREN);
")"                     return TOKEN(T_R_PAREN);
"{"                     return TOKEN(T_L_BRACE);
"}"                     return TOKEN(T_R_BRACE);
"."                     return TOKEN(T_DOT);
","                     return TOKEN(T_COMMA);
"+"                     return TOKEN(T_PLUS);
"-"                     return TOKEN(T_MINUS);
"*"                     return TOKEN(T_MUL);
"/"                     return TOKEN(T_DIV);
.                       printf("Unknown token!n"); yyterminate();

%%