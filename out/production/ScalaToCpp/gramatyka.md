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
| EQ             |` "=" `      |
| SEMICOLON      |` ";" `       |
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
| TRUE           | `"true"`    |
| FALSE          | `"false" `    |
| INT_LITERAL    | `[0-9]+`    |
| STRING_LITERAL | `"\""(^["]\|(\"))*"\"" `   |
| IDENTIFIER     | `identifier ` |


### Zbiór symboli nieterminalnych:

| Production Name   | Productions                                                   |
|-------------------|---------------------------------------------------------------|
| program           | `compilationUnit`                                               |
| compilationUnit   | `topLevelDef compilationUnit` \| `ε`                               |
| topLevelDef       | `classDef` \| `objectDef` \| `traitDef` \| `def`                       |
| classDef          | `"class" className classBody`                                    |
| objectDef         | `"object" objectName classBody`                                  |
| traitDef          | `"trait" traitName traitBody`                                    |
| def               | `"def" methodName parameterList returnType "=" block`            |
| classBody         | `"{ classMember* }"`                                           |
| traitBody         | `"{ traitMember* }"`                                           |
| classMember       | `classDef` \| `def`                                               |
| traitMember       | `traitDef` \| `def`                                               |
| parameterList     | `"(" parameter ("," parameter)* ")"` \| `ε`                       |
| parameter         | `identifier ":" typeName`                                        |
| returnType        | `":" typeName` \| `ε`                                              |
| block             | `"{ statement* }"`                                             |
| statement         | `block` \| `ifStatement` \| `whileStatement` \| `forStatement` \| `expressionStatement` |
| ifStatement       | `"if" "(" expression ")" block ("else" block)?`                  |
| whileStatement    | `"while" "(" expression ")" block`                               |
| forStatement      | `"for" "(" enumeration ")" block`                                |
| enumeration       | `identifier " <- " expression`                                   |
| expressionStatement | `expression ";"`                                                |
| expression        | `primaryExpression` \| `expression binaryOperator expression` \| `unaryOperator expression` \| `ifExpression` |
| primaryExpression | `literal` \| `identifier` \| `"(" expression ")"` \| `functionCall` \| `objectMethodAccess` |
| ifExpression      | `"if" "(" expression ")" expression ("else" expression)?`        |
| functionCall      | `identifier argumentList`                                        |
| objectMethodAccess | `identifier "." identifier argumentList?`                        |
| argumentList      | `"(" (expression ("," expression)*)? ")"`                        |
| binaryOperator    | `"+"` \| `"-"` \| `"*"` \| `"/"` \| `"=="` \| `"!="` \| `"<"` \| `">"` \| `"<="` \| `">="` \| `"&&"` \| `"\|\|"` | |
| unaryOperator     | `"+" \| "-" \| "!"`                                             |
| literal           | `booleanLiteral` \| `integerLiteral` \| `stringLiteral`              |
| booleanLiteral    | `"true" \| "false"`                                             |
| integerLiteral    | `[0-9]+`                                                        |
| stringLiteral     |  `"\""(^["]\|(\"))*"\"" `                                                   |
| className         | `identifier`                                                    |
| objectName        | `identifier`                                                    |
| traitName         | `identifier`                                                    |
| methodName        | `identifier`                                                    |
| typeName          | `identifier`                                                    |
| identifier        | `[a-zA-Z][a-zA-Z0-9]*`                                          |
