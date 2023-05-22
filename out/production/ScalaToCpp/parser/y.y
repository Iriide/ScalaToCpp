%{
#include <stdio.h>
%}

%token CLASS OBJECT TRAIT DEF LPAREN RPAREN LBRACE RBRACE EQ SEMICOLON
%token IF ELSE WHILE FOR ARROW EQEQ NEQ LT GT LTEQ GTEQ AND OR PLUS MINUS
%token ASTERISK SLASH BANG TRUE FALSE INT_LITERAL STRING_LITERAL IDENTIFIER DOT

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

def : DEF IDENTIFIER LPAREN parameterList RPAREN returnType EQ block
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
              | LPAREN parameter RPAREN
              ;

parameter : IDENTIFIER /* assuming ':' token */ IDENTIFIER
          ;

returnType : /* empty */
           | /* assuming ':' token */ IDENTIFIER
           ;

block : LBRACE statementList RBRACE
      ;

statementList : /* empty */
              | statement statementList
              ;

statement : block
          | ifStatement
          | whileStatement
          | forStatement
          | expressionStatement
          ;

ifStatement : IF LPAREN expression RPAREN block ELSE block
            ;

whileStatement : WHILE LPAREN expression RPAREN block
               ;

forStatement : FOR LPAREN enumeration RPAREN block
             ;

enumeration : IDENTIFIER ARROW expression
            ;

expressionStatement : expression SEMICOLON
                    ;

expression : primaryExpression
           | expression binaryOperator expression
           | unaryOperator expression
           | ifExpression
           ;

primaryExpression : literal
                  | IDENTIFIER
                  | LPAREN expression RPAREN
                  | functionCall
                  | objectMethodAccess
                  ;

ifExpression : IF LPAREN expression RPAREN expression ELSE expression
             ;

functionCall : IDENTIFIER argumentList
             ;

objectMethodAccess : IDENTIFIER /* assuming '.' token */ IDENTIFIER argumentList
                   ;

argumentList : /* empty */
             | LPAREN expressionList RPAREN
             ;

expressionList : expression
               | expression /* assuming ',' token */ expressionList
               ;

binaryOperator : PLUS
               | MINUS
               | ASTERISK
               | SLASH
               | EQEQ
               | NEQ
               | LT
               | GT
               | LTEQ
               | GTEQ
               | AND
               | OR
               ;

unaryOperator : PLUS
              | MINUS
              | BANG
              ;

literal : booleanLiteral
        | integerLiteral
        | stringLiteral
        ;

booleanLiteral : TRUE
               | FALSE
               ;

integerLiteral : INT_LITERAL
               ;

stringLiteral : STRING_LITERAL
              ;
%%

int main()
{
   yyparse();
   return 0;
}

void yyerror(const char *s)
{
   fprintf(stderr, "error: %s\n", s);
}
