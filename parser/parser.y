%{
#include <stdio.h>
#include <stdlib.h>
%}

%token CLASS OBJECT TRAIT DEF LPAREN RPAREN LBRACE RBRACE EQ SEMICOLON IF ELSE WHILE FOR
%token ARROW EQEQ NEQ LT GT LTEQ GTEQ AND OR PLUS MINUS ASTERISK SLASH BANG TRUE FALSE
%token INT_LITERAL STRING_LITERAL IDENTIFIER

%%

program : compilationUnit
        ;

compilationUnit : topLevelDef compilationUnit
                | /* empty */
                ;

topLevelDef : classDef
            | objectDef
            | traitDef
            | def
            ;

classDef : CLASS IDENTIFIER LBRACE classBody RBRACE
         ;

objectDef : OBJECT IDENTIFIER LBRACE classBody RBRACE
          ;

traitDef : TRAIT IDENTIFIER LBRACE traitBody RBRACE
         ;

def : DEF IDENTIFIER LPAREN parameterList RPAREN EQ block
    ;

classBody : /* empty */
          | classMember classBody
          ;

traitBody : /* empty */
          | traitMember traitBody
          ;

classMember : classDef
            | def
            ;

traitMember : traitDef
            | def
            ;

parameterList : /* empty */
              | IDENTIFIER COLON IDENTIFIER /* assuming type and parameter name are identifiers */
              ;

block : LBRACE statementList RBRACE
      ;

statementList : /* empty */
              | statement statementList
              ;

// ...

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
