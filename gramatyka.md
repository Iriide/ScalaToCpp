# Gramatyka
### zbiór tokenów (symboli terminalnych):

| Element | Symbol |
|---------|--------|
| Dodaj     | `+`    |
| Odejmij | `-`    |
| Prawo   | `>`    |
| Lewo    | `<`    |
| Wczytaj   | `,`    |
| Wypisz  | `.`    |
| RozpocznijPętlę | `[` |
| Zakończ pętlę | `]`   |

### zbiór symboli nieterminalnych:
| Rule |
|------|
| `SymbolStartowy` |
| `Operator` |
| `Składnik` |
| `Pętla` |

### Produkcja:
| Rule | Definition |
|------|------------|
| `"SymbolStartowy"` | `"Składnik"` \| `"Operator"` |
| `"Operator"` | `'+'` \| `'-'` \| `'>'` \| `'<'` \| `','` \| `'.'` \| `'['` \| `']'` |
| `"Składnik"` | `"Pętla"` \| `"Operator"` \| `"Składnik"` `"Operator"` |
| `"Pętla"` | `'['` `"Składnik"` `']'` |
