%{
#include "y.tab.h"
%}

%%

"class"          return CLASS;
"object"         return OBJECT;
"trait"          return TRAIT;
"def"            return DEF;
"("              return LPAREN;
")"              return RPAREN;
"{"              return LBRACE;
"}"              return RBRACE;
"="              return EQ;
"."              return DOT;
";"              return SEMICOLON;
"if"             return IF;
"else"           return ELSE;
"while"          return WHILE;
"for"            return FOR;
"<-"             return ARROW;
"=="             return EQEQ;
"!="             return NEQ;
"<="             return LTEQ;
">="             return GTEQ;
"<"              return LT;
">"              return GT;
"&&"             return AND;
"||"             return OR;
"+"              return PLUS;
"-"              return MINUS;
"*"              return ASTERISK;
"/"              return SLASH;
"!"              return BANG;
"true"           return TRUE;
"false"          return FALSE;

\"[^\"]*\"          { yylval = strdup(yytext); return STRING_LITERAL; }
[a-zA-Z][a-zA-Z0-9]*   { yylval = strdup(yytext); return IDENTIFIER; }
[0-9]+           { yylval = strdup(yytext); return INT_LITERAL; }
[ \t\n]          ; /* ignore whitespace */
.                return yytext[0]; /* return any other character as is */

%%

int yywrap(void) {
    return 1;
}
