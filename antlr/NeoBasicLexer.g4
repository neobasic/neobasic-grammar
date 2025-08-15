/*
The MIT License (MIT)
Copyright (c) 2025 [WE THE DEVS].

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

/*
 * Project      : ANTLR4 lexer grammar for NeoBASIC programming language.
 *                https://github.com/neobasic
 * Developed by : Raul Bras, @teknolista.
 */

lexer grammar NeoBasicLexer;

import NeoBasicKeywords;

options {
    superClass = NeoBasicLexerBase;
}

channels {
    COMMENT,
    ERROR_CHANNEL
}

/*
 *  Default Lexer Mode
 */

// --- PUNCTUATION --------------------------------------------------

LEFT_PARENTHESIS  : '(';    // 
RIGHT_PARENTHESIS : ')';    // 
LEFT_BRACKET      : '[';    // 
RIGHT_BRACKET     : ']';    // 
LEFT_CURLY        : '{';    // 
RIGHT_CURLY       : '}';    // 
LEFT_ANGLE        : '<';    // Less Than
RIGHT_ANGLE       : '>';    // Greater Than
DOT               : '.';    // Dot
COMMA             : ',';    // Comma
SEMICOLON         : ';';    // 
COLON             : ':';    // Pair mapping
EXCLAMATION       : '!';    // Error
QUESTION          : '?';    // Optional
APOSTROPHE        : '\'';   // Character lieral, template string literal
QUOTE             : '"';    // Verbatim String literal
BACKTICK          : '`';    // Backtick
AT                : '@';    // Atoms, Annotations/Decorators
HASH              : '#';    // Comment, Directive (Interpreter, Pragma, Testing)
DOLLAR            : '$';    // 
AMPERSAND         : '&';    // 
ASTERISK          : '*';    // Multiplication
SLASH             : '/';    // Real Division, Regular expression literal
DIVISION          : '÷';    // Integer Division
PERCENT           : '%';    // Modulo, Integer Division, Percentage
BACKSLASH         : '\\';   // 
TILDE             : '~';    // 
CARET             : '^';    // 
PIPE              : '|';    // 
UNDERSCORE        : '_';    // Wildcard, Anonymous variable
EQUAL             : '=';    // Assignment, Equality
PLUS              : '+';    // 
MINUS             : '-';    // 

ELLIPSIS          : '...';  // 
LAMBDA            : '(\\';  // 

DOUBLE_LEFT_BRACKET  : '[[';    // 
DOUBLE_RIGHT_BRACKET : ']]';    // 

DOUBLE_LEFT_CURLY    : '{{';    // 
DOUBLE_RIGHT_CURLY   : '}}';    // 

DOUBLE_LEFT_ANGLE    : '<<';   // 
DOUBLE_RIGHT_ANGLE   : '>>';   // 

DOUBLE_EXCLAMATION   : '!!';   // 
DOUBLE_QUESTION      : '??';   // 

DOUBLE_COLON         : '::';   // 
DOUBLE_SEMICOLON     : ';;';   // 


// --- UNARY OPERATORS ----------------------------------------------

// Arithmetic Operators

INCREMENT     : '++';
DECREMENT     : '--';
SQUARE_POWER  : '**';
SQUARE_ROOT   : '*/';
FACTORIAL     : '*!';

// Bitwise Operators

BIT_NEGATION  : '~~';

// Miscellaneous Operators

DEEP_CLONING : '===';

SORTING : '^^';


// --- BINARY OPERATORS ---------------------------------------------

// Arithmetic operators

QUOTIENT : '%%';

// Financial Operators

PERCENTAGE_RATE      : '%/';
PERCENTAGE_AMOUNT    : '%*';
PERCENTAGE_INCREASE  : '%+';
PERCENTAGE_DECREASE  : '%-';
PERCENTAGE_VARIATION : '%^';

// Bitwise Operators

BIT_CLEAR            : '&~';
UNSIGNED_RIGHT_SHIFT : '>>>';

// Conditional Operators

DIVISIBLE_BY          : '?%';
NOT_DIVISIBLE_BY      : '!%';

// Comparison Operators

ELVIS_TEST            : '?:';
THREE_WAY_TEST        : '<=>';

// Relational Operators

EQUALS            : '==';
NOT_EQUALS        : '!=';
LESS_OR_EQUALS    : '<=';
GREATER_OR_EQUALS : '>=';

// Coalescing Operators

ERROR_PROPAGATION_NONE_COALESCING : '!?';

// Single Assignment Operators

DESTRUCTURING_ASSIGNMENT : ':=';
COMPUTED_ASSIGNMENT      : '~=';
POP_ONE_ASSIGNMENT       : '<-';
PULL_ALL_ASSIGNMENT      : '<<-'; 
PIPE_ASSIGNMENT          : '<|'; 

// Compound Assignment Operators

ADDITION_ASSIGNMENT             : '+=';
SUBTRACTION_ASSIGNMENT          : '-=';
MULTIPLICATION_ASSIGNMENT       : '*=';
REAL_DIVISION_ASSIGNMENT        : '/=';
INTEGER_DIVISION_ASSIGNMENT     : '÷=';
QUOTIENT_ASSIGNMENT             : '%%=';
MODULO_ASSIGNMENT               : '%=';
NTH_POWER_ASSIGNMENT            : '**=';
NTH_ROOT_ASSIGNMENT             : '*/=';
PERCENTAGE_RATE_ASSIGNMENT      : '%/=';
PERCENTAGE_AMOUNT_ASSIGNMENT    : '%*=';
PERCENTAGE_INCREASE_ASSIGNMENT  : '%+=';
PERCENTAGE_DECREASE_ASSIGNMENT  : '%-=';
PERCENTAGE_VARIATION_ASSIGNMENT : '%^⁼';
BIT_AND_ASSIGNMENT              : '&=';
BIT_OR_ASSIGNMENT               : '|=';
BIT_XOR_ASSIGNMENT              : '^=';
BIT_CLEAR_ASSIGNMENT            : '&^=';
LEFT_SHIFT_ASSIGNMENT           : '<<=';
SIGNED_RIGHT_SHIFT_ASSIGNMENT   : '>>=';
UNSIGNED_RIGHT_SHIFT_ASSIGNMENT : '>>>=';
NONE_COALESCING_ASSIGNMENT      : '??=';

// Range Operators

INTERVAL_INCLUSIVE       : '..';
INTERVAL_LEFT_EXCLUSIVE  : '>..';
INTERVAL_RIGHT_EXCLUSIVE : '..<';
INTERVAL_EXCLUSIVE       : '>..<';

INTERVAL
    : INTERVAL_INCLUSIVE
    | INTERVAL_LEFT_EXCLUSIVE
    | INTERVAL_RIGHT_EXCLUSIVE
    | INTERVAL_EXCLUSIVE
    ;

INTERVAL_LEFT
    : INTERVAL_INCLUSIVE
    | INTERVAL_LEFT_EXCLUSIVE
    ;

INTERVAL_RIGHT
    : INTERVAL_INCLUSIVE
    | INTERVAL_RIGHT_EXCLUSIVE
    ;

// Composite Operators

MIXIN   : '<>';
EXTENDS : '->';

// Imply Operators

NECK_RULE : ':-';

IMPLICIT_RETURN : '=>';

MONAD_BIND : '=>>';

// Pipeline Operator

PIPELINE : '|>';

// Command Execution Operators

COMMAND_SEQUENCE : '&&';

COMMAND_SEQUENCE_OKAY : '?&';
COMMAND_SEQUENCE_FAIL : '!&';

COMMAND_BACKGROUND : '|&';

// Input/Output Redirection Operators

OUTPUT_REDIRECTION : '&>';
APPEND_OUTPUT_REDIRECTION : '&>>';

STDOUT_REDIRECTION : '&1>';
APPEND_STDOUT_REDIRECTION : '&1>>';

STDERR_REDIRECTION : '&2>';
APPEND_STDERR_REDIRECTION : '&2>>';


// --- LITERALS -----------------------------------------------------

// Decimal literals (Fixed Point Numbers)

DECIMAL_NUMBER
    : DEC_DECIMAL
    | HEX_DECIMAL
    ; 

fragment DEC_DECIMAL : DEC_MANTISSA;
fragment DEC_MANTISSA
    : DEC_GROUPS
    | DEC_GROUPS '.' DEC_GROUPS?
    | '.' DEC_GROUPS
    ;

fragment HEX_DECIMAL : '0' [xX] HEX_MANTISSA;
fragment HEX_MANTISSA
    : HEX_GROUPS
    | HEX_GROUPS '.' HEX_GROUPS?
    | '.' HEX_GROUPS
    ;

// Real literals (Floating Point Numbers)

REAL_NUMBER
    : DEC_REAL
    | HEX_REAL
    ; 

fragment DEC_REAL     : DEC_DECIMAL DEC_EXPONENT?;
fragment DEC_EXPONENT : [eE] [+-]? DEC_GROUPS;

fragment HEX_REAL     : HEX_DECIMAL HEX_EXPONENT?;
fragment HEX_EXPONENT : [pP] [+-]? DEC_GROUPS;

// Rational literals

RATIONAL_NUMBER : INTEGER_NUMBER '//' INTEGER_NUMBER;

// Imaginary literals

IMAGINARY_NUMBER : ( INTEGER_NUMBER | REAL_NUMBER ) [ijk];

// Integer literals

INTEGER_NUMBER
    : DEC_VALUE
    | HEX_VALUE
    | OCT_VALUE
    | BIN_VALUE
    | ROM_VALUE
    ;

fragment DEC_VALUE  : '0' | DEC_GROUPS;
fragment DEC_GROUPS : DEC_DIGIT ('_'? DEC_DIGIT)*;

fragment HEX_VALUE  : HEX_UNIT HEX_GROUPS;
fragment HEX_UNIT   : '0' [xX];
fragment HEX_GROUPS : HEX_DIGIT ('_'? HEX_DIGIT)*;

fragment OCT_VALUE  : OCT_UNIT OCT_GROUPS;
fragment OCT_UNIT   : '0' [oO];
fragment OCT_GROUPS : OCT_DIGIT ('_'? OCT_DIGIT)*;

fragment BIN_VALUE  : BIN_UNIT BIN_GROUPS;
fragment BIN_UNIT   : '0' [bB];
fragment BIN_GROUPS : BIN_DIGIT ('_'? BIN_DIGIT)*;

fragment ROM_VALUE  : ROM_UNIT ROM_GROUPS;
fragment ROM_UNIT   : '0' [rR];
fragment ROM_GROUPS : ROM_DIGIT ('_'? ROM_DIGIT)*;

// Computer number formats

fragment DEC_DIGIT : UNICODE_DIGIT;
fragment HEX_DIGIT : [0-9a-fA-F];
fragment OCT_DIGIT : [0-7];
fragment BIN_DIGIT : [01];
fragment ROM_DIGIT : [IVXLCDM];

// Binary literals

BINARY_LIT
    : HEX_VALUE
    | OCT_VALUE
    | BIN_VALUE
    ;

// HereDoc Literals

HEREDOC_LITERAL : '<<' HEREDOC_CONTENT ;

HEREDOC_CONTENT
    : IDENTIFIER EOL VERBATIM_STRING_CONTENT EOL IDENTIFIER
    | '"' EOL VERBATIM_STRING_CONTENT EOL '"'
    | '"""' EOL VERBATIM_STRING_CONTENT EOL '"""'
    | '\'' EOL TEMPLATE_STRING_CONTENT EOL '\''
    | '\'\'\'' EOL TEMPLATE_STRING_CONTENT EOL '\'\'\''
    | '/' EOL REGULAR_EXPRESSION_CONTENT EOL '/' REGEX_FLAG*
    | HEX_UNIT EOL HEX_DIGIT* EOL HEX_UNIT
    | OCT_UNIT EOL OCT_DIGIT* EOL OCT_UNIT
    | BIN_UNIT EOL BIN_DIGIT* EOL BIN_UNIT
    ;


// Regular expression literals 

REGULAR_EXPRESSION_LIT     : '/' REGULAR_EXPRESSION_CONTENT '/' REGEX_FLAG*;

REGULAR_EXPRESSION_CONTENT : REGEX_FIRST_CHAR REGEX_CHAR*;

fragment REGEX_FIRST_CHAR
    : ~[\n\r\u0085\u2028\u2029*\\/[]
    | REGEX_BACKSLASH_SEQUENCE
    | '[' REGEX_CLASS_CHAR* ']'
    ;

fragment REGEX_CHAR
    : ~[\n\r\u0085\u2028\u2029\\/[]
    | REGEX_BACKSLASH_SEQUENCE
    | '[' REGEX_CLASS_CHAR* ']'
    ;

fragment REGEX_BACKSLASH_SEQUENCE : '\\' ~[\n\r\u0085\u2028\u2029];

fragment REGEX_CLASS_CHAR
    : ~[\n\r\u0085\u2028\u2029\]\\]
    | REGEX_BACKSLASH_SEQUENCE
    ;

fragment REGEX_FLAG : [digmsuvy];

// String literals

STRING_LIT
    : VERBATIM_STRING_LIT
    | TEMPLATE_STRING_LIT
    ;

VERBATIM_STRING_LIT
    : '"' VERBATIM_STRING_CONTENT '"'
    | '"""' VERBATIM_STRING_CONTENT '"""'
    ;

fragment VERBATIM_STRING_CONTENT : ~["]*;

TEMPLATE_STRING_LIT
    : '\'' TEMPLATE_STRING_CONTENT '\''
    | '\'\'\'' TEMPLATE_STRING_CONTENT '\'\'\''
    ;

fragment TEMPLATE_STRING_CONTENT
    : ( ASCII_ESCAPED_VALUE
    | UNICODE_ESCAPED_VALUE
    | '{' PLACEHOLDER_VALUE* '}'
    | ~['] )*
    ; 

PLACEHOLDER_VALUE : ~['}];

// Character literals

CHAR_LIT
    : ASCII_LIT     
    | '\'' UNICODE_ESCAPED_VALUE '\''
    | '"' ~["] '"'
    ;

ASCII_LIT
    : INTEGER_NUMBER     
    | '\'' ASCII_ESCAPED_VALUE '\''
    | '"' ASCII_CHAR '"'
    ;

fragment ASCII_ESCAPED_VALUE
    : '\\' ( [0abcdefnqrstvz'"`\\]
           | DEC_DIGIT DEC_DIGIT? DEC_DIGIT?
           | [xX] HEX_DIGIT HEX_DIGIT?
           | [oO] OCT_DIGIT OCT_DIGIT? OCT_DIGIT?
           | [bB] BIN_DIGIT BIN_DIGIT? BIN_DIGIT? BIN_DIGIT? BIN_DIGIT? BIN_DIGIT? BIN_DIGIT?
           )
    ;

fragment UNICODE_ESCAPED_VALUE
    : '\\' ( 'u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
           | 'U' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT
           )
    ;

// Atom literals

ATOM_DOT_LIT : '@' DOT_FRACTION ('.' DOT_FRACTION)*;

DOT_FRACTION : [+-] (INTEGER_NUMBER | MUSIC_NOTE | IDENTIFIER);

// Shell literals (File system files and directories)

SHELL_LIT
    : '$_'
    | '$' [012]
    | '$%' DEC_VALUE?
    | '$$'
    | SHELL_PATH_LIT
    | SHELL_IDENTIFIER
    ;

SHELL_PATH_LIT : '$' FILESYSTEM_PATH;

FILESYSTEM_PATH : ABSOLUTE_PATH | RELATIVE_PATH | TILDE_PATH; //  | PATH_NAME;

ABSOLUTE_PATH : (DRIVE_LETTER ':')? '/' PATH_NAME?;

RELATIVE_PATH : ('.' | '..') '/' ('..' '/')* PATH_NAME?;

TILDE_PATH : '~' '/'? PATH_NAME?;

PATH_NAME : FILE_NAME ('/' FILE_NAME)*;

FILE_NAME : UNICODE_FILEPATH+;

DRIVE_LETTER : [a-zA-Z];


// --- SYMBOLS ------------------------------------------------------

// Identifier Names

//KEYWORD : ALPHA+;

TAG : ALPHANUMERIC+;

IDENTIFIER : ALPHA ALPHANUMERIC*;

ATOM_IDENTIFIER : '@' IDENTIFIER;

ASPECT_IDENTIFIER : '@@' IDENTIFIER;

SHELL_IDENTIFIER : '$' IDENTIFIER;

// MUSICAL ALPHABET

MUSIC_NOTE     : MUSIC_ALPHABET (PITCH_FLAT | PITCH_SHARP)? OCTAVE_DIGIT?;

MUSIC_ALPHABET : [A-G];
OCTAVE_DIGIT   : [0-8];
PITCH_FLAT     : 'f';
PITCH_SHARP    : 's';


// --- MAGIC COMMENTS -----------------------------------------------

// Pragma Directive

SHEBANG : '#!';

// Canary-testing Directive

WOODSTOCK : '#?';

// Shell-lookup Directive

SHERLOCK : '#$';


// --- MAGIC STATEMENTS ---------------------------------------------

// Rubber Duck Debugging

RUBBERDUCK : '@' IDENTIFIER? '=';

// Songbird Logging

SONGBIRD : '@' IDENTIFIER? '>';

// Label

//LABEL : IDENTIFIER ':';


// --- COMMENTS -----------------------------------------------------

LINE_COMMENT          : '#' ~[#!?$] ~[\n\r\u0085\u2028\u2029]* -> channel(COMMENT);
BLOCK_COMMENT         : '##' ~[#?] .*? '##'                    -> channel(COMMENT);
DOCUMENTATION_COMMENT : '###' .*? '###'                        -> channel(COMMENT);

// Hashtags

HASHTAG : HASH TAG ('/' TAG)* -> channel(COMMENT);


// --- UNICODE CHARACTERS -------------------------------------------

fragment ALPHA: UNICODE_LETTER | '_';

fragment ALPHANUMERIC : UNICODE_ALPHANUMERIC | '_';

fragment UNICODE_ALPHANUMERIC
    : UNICODE_LETTER
    | UNICODE_DIGIT
    | [\p{Mn}]   // Unicode category for Nonspacing Mark
    | [\p{Pc}]   // Unicode category for Connector Punctuation
    ;

// Any unicode code points that are categorized as (L) Letter.
//[\p{L}] matches any kind of letter from any language.
fragment UNICODE_LETTER: [\p{L}];

// Any unicode code points that are categorized as (Nd) Decimal Number.
//[\p{Nd}] matches a digit zero through nine in any script except ideographic scripts
fragment UNICODE_DIGIT: [\p{Nd}];

// Unicode code points from U+0000 to U+007F except categorized as Cc (Control)
fragment ASCII_CHAR : [\u0020-\u007E];

// Unicode code points from U+0000 to U+10FFFF, except categorized as: 
// Cc (Control), Cf (Format), Cs (Surrogate), Co (Private Use), Cn (Unassigned) 
// and except these 15 special chars (punctuation or operators). 
fragment UNICODE_FILEPATH : ~[|/\\<>;:?*#$&"'`\p{Cc}\p{Cf}\p{Cs}\p{Co}\p{Cn}] ;


// --- SPECIAL TOKENS -----------------------------------------------

// End of Sentence (EOS): Emit an EOS token for any newlines, semicolon, 
// multiline comments or the EOF and return to normal lexing.

EOS : EOL
    | LINE_COMMENT
    | EOF
    ;

// End of Line (EOL) characters

EOL : '\n'       // Unix, Linux, macOS
    | '\r' '\n'  // Windows, DOS
    | '\r'       // Classic Mac OS (pre-OS X)
    | '\u0085'   // IBM Mainframes (EBCDIC)
    | '\u2028'   // Unicode Line Separator
    | '\u2029'   // Unicode Paragraph Separator
    ;


// --- HIDDEN TOKENS ------------------------------------------------

// Byte Order Mark (BOM) is a Unicode character used to indicate the endianness of a text file.
// It is often used at the beginning of a file to signal that the file is encoded in

BOM : (UTF8_BOM | UTF16_BOM | UTF32_BOM) -> channel(HIDDEN);

UTF8_BOM  : '\uEFBBBF';
UTF16_BOM : '\uFEFF';
UTF32_BOM : '\u0000FEFF';

// White Spaces (WSP) characters

WSP : [\u0009\u000B\u000C\u0020\u00A0\p{Zs}]+ -> channel(HIDDEN);

// Two or more physical lines may be joined into logical lines,
// But can cause conflict with \\ character.
//EXPLICIT_LINE_JOINING : '\\' EOL -> channel(HIDDEN);


// --- ERROR HANDLING -----------------------------------------------

UnexpectedCharacter : . -> channel(ERROR_CHANNEL);
