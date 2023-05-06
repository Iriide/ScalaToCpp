# Gramatyka
### Zbiór tokenów (symboli terminalnych):

| Token          | Symbol      |
|----------------|-------------|
| CLASS          | "class"     |
| OBJECT         | "object"    |
| TRAIT          | "trait"     |
| DEF            | "def"       |
| LPAREN         | "("         |
| RPAREN         | ")"         |
| LBRACE         | "{"         |
| RBRACE         | "}"         |
| EQ             | "="         |
| SEMICOLON      | ";"         |
| IF             | "if"        |
| ELSE           | "else"      |
| WHILE          | "while"     |
| FOR            | "for"       |
| ARROW          | "<-"        |
| EQEQ           | "=="        |
| NEQ            | "!="        |
| LT             | "<"         |
| GT             | ">"         |
| LTEQ           | "<="        |
| GTEQ           | ">="        |
| AND         | "&&"        |
| OR           | "&#124;&#124;"        |
| PLUS           | "+"         |
| MINUS          | "-"         |
| ASTERISK       | "*"         |
| SLASH          | "/"         |
| BANG           | "!"         |
| TRUE           | "true"      |
| FALSE          | "false"     |
| INT_LITERAL    | [0-9]+      |
| STRING_LITERAL | "&#34;.*&#34;"    |
| IDENTIFIER     | identifier  |


### Zbiór symboli nieterminalnych:

| Non-terminal symbol |
| --- |
| `<initialize>` |
| `<program>` |
| `<instruction>` |
| `<pointerOperation>` |
| `<valueOperation>` |
| `<readOperation>` |
| `<writeOperation>` |
| `<loop>` | 

There are a total of 8 non-terminal symbols in the Brainfuck grammar.

### Produkcja:
| Non-terminal symbol | Production rule |
| --- | --- |
| `<initialize>` | `<program>` |
| `<program>` | `<instruction>` <br> \| `<instruction>` `<program>` |
| `<instruction>` | `<pointerOperation>` <br> \| `<valueOperation>` <br> \| `<readOperation>` <br> \| `<writeOperation>` <br> \| `<loop>` |
| `<pointerOperation>` | ">" <br> \| "<" |
| `<valueOperation>` | "+" <br> \| "-" |
| `<readOperation>` | "," |
| `<writeOperation>` | "." |
| `<loop>` | "[" `<program>` "]" |
