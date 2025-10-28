# ANTLR4 Grammar

**ANTLR4** (ANother Tool for Language Recognition) grammars define the syntax of a language, enabling ANTLR to generate a parser, lexer, and other components for processing text in that language. These grammars are written in a .g4 file and typically consist of two main parts:

- **Lexer Rules**: These rules define the individual building blocks (tokens) of the language, such as keywords, identifiers, numbers, operators, and whitespace. Lexer rules are typically written in uppercase and use regular expression-like syntax to match patterns in the input text.

- **Parser Rules**: These rules define the structure and hierarchy of the language using the tokens defined by the lexer. Parser rules are typically written in lowercase and use a combination of tokens, other parser rules, and operators to express the syntax.
