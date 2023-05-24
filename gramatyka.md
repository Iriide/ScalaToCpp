# Gramatyka
### Zbiór tokenów (symboli terminalnych):

| Token          | Symbol      |
|----------------|-------------|
| CLASS          | `"class"`|
| OBJECT         | `"object"`   |
| TRAIT          | `"trait"`  |
| DEF            | `"def"` |
| LPAREN         | `"(" `|
| RPAREN         | `")"`|
| LBRACE         |` "{"`       |
| RBRACE         |` "}" `        |
| COMMA         |` "," `        |
| DOT         |` "." `        |
| EQ             |` "=" `      |
| SEMICOLON      |` ";" `       |
| COLON      |` ":" `       |
| IF             |` "if" `       |
| ELSE           |` "else" `    |
| WHILE          |` "while" `  |
| FOR            | `"for" `    |
| ARROW          |` "<-" `      |
| EQEQ           | `"==" `      |
| NEQ            |` "!=" `     |
| LT             |` "<" `      |
| GT             | `">" `      |
| LTEQ           | `"<="`      |
| GTEQ           |` ">=" `      |
| AND         |` "&&"  `    |
| OR           |`"\|\|"`   |
| PLUS           |` "+"`       |
| MINUS          |` "-" `      |
| ASTERISK       | `"*"`       |
| SLASH          | `"/" `        |
| BANG           | `"!"`         |
| BOOLEAN_LITERAL    | `"true"\|"false"` |
| INT_LITERAL    | `[0-9]+`    |
| STRING_LITERAL | `"\""(^["]\|(\"))*"\"" `   |
| IDENTIFIER     | `[a-zA-Z][a-zA-Z0-9]* ` |


### Zbiór symboli nieterminalnych:

| Production Name   | Productions                                                   |
|-------------------|---------------------------------------------------------------|
| program           | `compilationUnit`                                               |
| compilationUnit   | `topLevelDef compilationUnit` \| `ε`                               |
| topLevelDef       | `classDef` \| `objectDef` \| `traitDef` \| `def`                       |
| classDef          | `"CLASS" "IDENTIFIER" classBody`                                    |
| objectDef         | `"OBJECT" "IDENTIFIER" classBody`                                  |
| traitDef          | `"TRAIT" "IDENTIFIER" traitBody`                                    |
| def               | `"DEF" "IDENTIFIER" parameterList returnType "EQ" block`            |
| classBody         | `"LBRACE" classMember* "RBRACE"`                                           |
| traitBody         | `"LBRACE" traitMember* "RBRACE"`                                           |
| classMember       | `classDef` \| `def`                                               |
| traitMember       | `traitDef` \| `def`                                               |
| parameterList     | `"LPAREN" parameter ("COMMA" parameter)* "RPAREN"` \| `ε`                       |
| parameter         | `"IDENTIFIER" "COLON" "IDENTIFIER"`                                        |
| returnType        | `"COLON" "IDENTIFIER"` \| `ε`                                              |
| block             | `"LBRACE" statement* "RBRACE"`                                             |
| statement         | `block` \| `ifStatement` \| `whileStatement` \| `forStatement` \| `expressionStatement` |
| ifStatement       | `"IF" "LPAREN" expression "RPAREN" block ("ELSE" block)?`                  |
| whileStatement    | `"WHILE" "LPAREN" expression "RPAREN" block`                               |
| forStatement      | `"FOR" "LPAREN" enumeration "RPAREN" block`                                |
| enumeration       | `"IDENTIFIER" "ARROW" expression`                                   |
| expressionStatement | `expression "SEMICOLON"`                                                |
| expression        | `primaryExpression` \| `expression binaryOperator expression` \| `unaryOperator expression` \| `ifExpression` |
| primaryExpression | `literal` \| `"IDENTIFIER"` \| `"LPAREN" expression "RPAREN"` \| `functionCall` \| `objectMethodAccess` |
| ifExpression      | `"IF" "LPAREN" expression "RPAREN" expression ("ELSE" expression)?`        |
| functionCall      | `"IDENTIFIER" argumentList`                                        |
| objectMethodAccess | `"IDENTIFIER" "DOT" "IDENTIFIER" argumentList?`                        |
| argumentList      | `"LPAREN" (expression ("COMMA" expression)*)? "RPAREN"`                        |
| binaryOperator    | `"PLUS"` \| `"MINUS"` \| `"ASTERISK"` \| `"SLASH"` \| `"EQEQ "` \| `"NEQ"` \| `"LT"` \| `"GT"` \| `"LTEQ"` \| `"GTEQ"` \| `"AND"` \| `"OR"` | |
| unaryOperator     | `"PLUS" \| "MINUS" \| "BANG"`                                             |
| literal           | `BOOLEAN_LITERAL` \| `INT_LITERAL` \| `STRING_LITERAL`              |
