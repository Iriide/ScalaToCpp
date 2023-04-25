# Gramatyka
### Zbiór tokenów (symboli terminalnych):

| Element | Symbol |
|---------|--------|
| Plus     | `+`    |
| Minus | `-`    |
| PtrRight   | `>`    |
| PtrLeft    | `<`    |
| Read   | `,`    |
| Write  | `.`    |
| BeginLoop | `[` |
| EndLoop | `]`   |

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
