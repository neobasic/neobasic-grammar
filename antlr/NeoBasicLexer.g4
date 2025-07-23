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

import NeoBasicKeywords_en;

options {
    superClass = NeoBasicLexerBase;
}

channels {
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
HASH              : '#';    // Shebang, Pragma, Canary testing
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


// --- OPERATORS ----------------------------------------------------

// Unary Arithmetic Operators (Prefix Notation)

POSITIVE      : PLUS;
NEGATIVE      : MINUS;
INCREMENT     : PLUS PLUS;
DECREMENT     : MINUS MINUS;
BIT_NOT       : TILDE;
BIT_NEGATION  : TILDE TILDE;
SQUARE_POWER  : ASTERISK ASTERISK;
SQUARE_ROOT   : ASTERISK SLASH;
FACTORIAL     : ASTERISK EXCLAMATION;

// Binary Arithmetic operators (Infix Notation)

ADDITION          : PLUS;
SUBTRACTION       : MINUS;
MULTIPLICATION    : ASTERISK;
REAL_DIVISION     : SLASH;
INTEGER_DIVISION  : PERCENT PERCENT | DIVISION ;
MODULO            : PERCENT;
NTH_POWER         : SQUARE_POWER;
NTH_ROOT          : SQUARE_ROOT;

// Financial Operators

PERCENTAGE_RATE      : PERCENT SLASH;
PERCENTAGE_AMOUNT    : PERCENT ASTERISK;
PERCENTAGE_INCREASE  : PERCENT PLUS;
PERCENTAGE_DECREASE  : PERCENT MINUS;
PERCENTAGE_VARIATION : PERCENT CARET;

//  Bitwise Operators (Strict Evaluation = Eager Evaluation)

BIT_AND              : AMPERSAND;
BIT_CLEAR            : AMPERSAND CARET;
BIT_XOR              : CARET;
BIT_OR               : PIPE;
LEFT_SHIFT           : LEFT_ANGLE LEFT_ANGLE;
SIGNED_RIGHT_SHIFT   : RIGHT_ANGLE RIGHT_ANGLE;
UNSIGNED_RIGHT_SHIFT : RIGHT_ANGLE RIGHT_ANGLE RIGHT_ANGLE;

// Textual Operators
// INTERPOLATION : POSITIVE;
// REPETITION    : MULTIPLICATION;

// Comparison Operators

IDENTITY              : IS;                            // Identity Operator (RETURNS BOOLEAN)
NOT_IDENTITY          : IS NOT;                        // Negation of Identity Operator (RETURNS BOOLEAN)
MEMBERSHIP            : IN;
NOT_MEMBERSHIP        : NOT IN;
BETWEEN_RANGE         : BETWEEN;                       // Interval Comparison (RETURNS BOOLEAN)
NOT_BETWEEN_RANGE     : NOT BETWEEN;                   // Negation of Interval Comparison (RETURNS BOOLEAN)
MATCHING              : LIKE;                          // Matching Operator (RETURNS BOOLEAN)
NOT_MATCHING          : NOT LIKE;                      // Negation of Matching Operator (RETURNS BOOLEAN)
DIVISIBLE_BY          : QUESTION PERCENT;              // Evenly Divisible by (RETURNS BOOLEAN)  
NOT_DIVISIBLE_BY      : EXCLAMATION PERCENT;           // Not Divisible by (RETURNS BOOLEAN)   
ELVIS_TEST            : QUESTION COLON;                // Elvis Operator (RETURNS -1, 0, OR 1)
THREE_WAY_TEST        : LEFT_ANGLE EQUAL RIGHT_ANGLE;  // Three-way comparison (RETURNS -1, 0, OR 1)

// Relational Operators

EQUALS            : EQUAL EQUAL;
NOT_EQUALS        : EXCLAMATION EQUAL;
LESS              : LEFT_ANGLE;
LESS_OR_EQUALS    : LEFT_ANGLE EQUAL;
GREATER           : RIGHT_ANGLE;
GREATER_OR_EQUALS : RIGHT_ANGLE EQUAL;

// Logical Operators (Non-Strict Evaluation = Short-circuit Evaluation) 

LOGICAL_AND  : AND;   // CONJUNCTION
LOGICAL_XOR  : XOR;   // EXCLUSIVE DISJUNCTION
LOGICAL_OR   : OR;    // DISJUNCTION
LOGICAL_NOT  : NOT;   // NEGATION
// Universal gates
LOGICAL_NAND : NAND;  // NEGATION OF CONJUNCTION: NOT (X AND B)
LOGICAL_NXOR : NXOR;  // NEGATION OF EXCLUSIVE DISJUNCTION: NOT (X OR B)
LOGICAL_NOR  : NOR;   // NEGATION OF DISJUNCTION: NOT (X OR B)

// Coalescing Operators

ERROR_PROPAGATION                 : EXCLAMATION;
ERROR_COALESCING                  : EXCLAMATION EXCLAMATION;
ERROR_PROPAGATION_NONE_COALESCING : EXCLAMATION QUESTION;
ERROR_TO_NONE_CONVERTION          : QUESTION;
EXCEPTION_COALESCING              : QUESTION QUESTION;
EXCEPTION_STATEMENT               : ORELSE; 

// Single Assignment Operators
        
BASIC_ASSIGNMENT         : EQUAL;
DESTRUCTURING_ASSIGNMENT : COLON EQUAL;
MACRO_ASSIGNMENT         : COLON COLON;

// Compound Assignment Operators

ADDITION_ASSIGNMENT             : PLUS EQUAL;
SUBTRACTION_ASSIGNMENT          : MINUS EQUAL;
MULTIPLICATION_ASSIGNMENT       : ASTERISK EQUAL;
REAL_DIVISION_ASSIGNMENT        : SLASH EQUAL;
INTEGER_DIVISION_ASSIGNMENT     : DIVISION EQUAL | PERCENT PERCENT EQUAL;
MODULO_ASSIGNMENT               : PERCENT EQUAL;
NTH_POWER_ASSIGNMENT            : ASTERISK ASTERISK EQUAL;
NTH_ROOT_ASSIGNMENT             : ASTERISK SLASH  EQUAL;
PERCENTAGE_RATE_ASSIGNMENT      : PERCENT SLASH EQUAL;
PERCENTAGE_AMOUNT_ASSIGNMENT    : PERCENT ASTERISK EQUAL;
PERCENTAGE_INCREASE_ASSIGNMENT  : PERCENT PLUS EQUAL;
PERCENTAGE_DECREASE_ASSIGNMENT  : PERCENT MINUS EQUAL;
PERCENTAGE_VARIATION_ASSIGNMENT : PERCENT CARET EQUAL;
BIT_AND_ASSIGNMENT              : AMPERSAND EQUAL;
BIT_OR_ASSIGNMENT               : PIPE EQUAL;
BIT_XOR_ASSIGNMENT              : CARET EQUAL;
BIT_CLEAR_ASSIGNMENT            : AMPERSAND CARET EQUAL;
BIT_NOT_ASSIGNMENT              : TILDE EQUAL;
LEFT_SHIFT_ASSIGNMENT           : LEFT_ANGLE LEFT_ANGLE EQUAL;
SIGNED_RIGHT_SHIFT_ASSIGNMENT   : RIGHT_ANGLE RIGHT_ANGLE EQUAL;
UNSIGNED_RIGHT_SHIFT_ASSIGNMENT : RIGHT_ANGLE RIGHT_ANGLE RIGHT_ANGLE EQUAL;
NONE_COALESCING_ASSIGNMENT      : QUESTION QUESTION EQUAL;

// Composite Operators

INTERVAL : RIGHT_ANGLE? DOT DOT LEFT_ANGLE?;
ELLIPSIS : DOT DOT DOT;
FRACTION : SLASH SLASH;


// --- LITERALS -----------------------------------------------------

// Numeric values and literals

NUMBER_VAL : LEFT_PARENTHESIS NUMBER_LIT RIGHT_PARENTHESIS;

NUMBER_LIT : INTEGER_NUMBER
           | DECIMAL_NUMBER
           | REAL_NUMBER
           | RATIONAL_NUMBER
           | IMAGINARY_NUMBER
           ;

// Decimal literals (Fixed Point Numbers)

fragment DECIMAL_NUMBER
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

fragment REAL_NUMBER
    : DEC_REAL
    | HEX_REAL
    ; 

fragment DEC_REAL : DEC_DECIMAL DEC_EXPONENT?;
fragment DEC_EXPONENT : [eE] [+-]? DEC_GROUPS;

fragment HEX_REAL : HEX_DECIMAL HEX_EXPONENT?;
fragment HEX_EXPONENT: [pP] [+-]? DEC_GROUPS;

// Rational literals

fragment RATIONAL_NUMBER : INTEGER_NUMBER FRACTION INTEGER_NUMBER;

// Imaginary literals

fragment IMAGINARY_NUMBER : ( INTEGER_NUMBER | REAL_NUMBER ) [ijk];

// Integer literals

fragment INTEGER_NUMBER
    : DEC_INTEGER
    | HEX_INTEGER
    | OCT_INTEGER
    | BIN_INTEGER
    ;

fragment DEC_INTEGER : '0' | DEC_GROUPS;
fragment DEC_GROUPS  : DEC_DIGIT ('_'? DEC_DIGIT)*;

fragment HEX_INTEGER : '0' [xX] HEX_GROUPS;
fragment HEX_GROUPS  : HEX_DIGIT ('_'? HEX_DIGIT)*;

fragment OCT_INTEGER : '0' [oO] OCT_GROUPS;
fragment OCT_GROUPS  : OCT_DIGIT ('_'? OCT_DIGIT)*;

fragment BIN_INTEGER : '0' [bB] BIN_GROUPS;
fragment BIN_GROUPS  : BIN_DIGIT ('_'? BIN_DIGIT)*;

// Computer number formats

fragment DEC_DIGIT : UNICODE_DIGIT;
fragment HEX_DIGIT : [0-9a-fA-F];
fragment OCT_DIGIT : [0-7];
fragment BIN_DIGIT : [01];

// Temporal values

TIME_VAL : LEFT_PARENTHESIS TIME_LIT RIGHT_PARENTHESIS;

TIME_LIT : ATOM_DOT_LIT
         | NUMBER_LIT
         | TOMORROW
         | TODAY
         | NOW
         | YESTERDAY
         | EON
         | EPOCH
         ;

// Sequence literals

SEQUENCE_VAL : LEFT_PARENTHESIS SEQUENCE_LIT RIGHT_PARENTHESIS;

SEQUENCE_LIT : STRING_LIT
             | REGULAR_EXPRESSION_LIT
             | ATOM_DOT_LIT
             | BINARY_LIT
             ;

// HereDoc Literals

HEREDOC_LITERAL : LEFT_ANGLE LEFT_ANGLE HEREDOC_CONTENT ;

HEREDOC_CONTENT : IDENTIFIER EOL VERBATIM_STRING_CONTENT EOL IDENTIFIER
                | '"' EOL VERBATIM_STRING_CONTENT EOL '"'
                | '"""' EOL VERBATIM_STRING_CONTENT EOL '"""'
                | '\'' EOL TEMPLATE_STRING_CONTENT EOL '\''
                | '\'\'\'' EOL TEMPLATE_STRING_CONTENT EOL '\'\'\''
                | '/' EOL REGULAR_EXPRESSION_CONTENT EOL '/' REGEX_FLAG*
                | '0' [xX] EOL HEX_DIGIT* EOL '0' [xX]
                | '0' [oO] EOL OCT_DIGIT* EOL '0' [oO]
                | '0' [bB] EOL BIN_DIGIT* EOL '0' [bB]
                ;

// Binary literals

BINARY_LIT : '0' [xX] HEX_DIGIT*
           | '0' [oO] OCT_DIGIT*
           | '0' [bB] BIN_DIGIT*;

// Regular expression literals 

REGULAR_EXPRESSION_LIT : '/' REGULAR_EXPRESSION_CONTENT '/' REGEX_FLAG*;

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

// String values and literals

STRING_VAL : BLANK
           | NONBLANK
           ;

STRING_LIT : VERBATIM_STRING_LIT
           | TEMPLATE_STRING_LIT
           ;

VERBATIM_STRING_LIT
    : '"' VERBATIM_STRING_CONTENT '"'
    | '"""' VERBATIM_STRING_CONTENT '"""'
    ;

fragment VERBATIM_STRING_CONTENT : ~["]* ;

TEMPLATE_STRING_LIT
    : '\'' TEMPLATE_STRING_CONTENT '\''
    | '\'\'\'' TEMPLATE_STRING_CONTENT '\'\'\''
    ;

fragment TEMPLATE_STRING_CONTENT : ( ASCII_ESCAPED_VALUE
                                   | UNICODE_ESCAPED_VALUE
                                   | '{' STRING_PLACEHOLDER '}'
                                   | ~['\\] )* ; 

STRING_PLACEHOLDER : ~['\\];

// Character literals

CHAR_VAL : LEFT_PARENTHESIS CHAR_LIT RIGHT_PARENTHESIS;

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

// Maybe values

MAYBE_VAL : NONE | SOME;

// Result values

RESULT_VAL : OKAY | FAIL;

// Range Literals

RANGE_LIT
    : INTEGER_NUMBER? INTERVAL INTEGER_NUMBER?
    | CHAR_LIT INTERVAL CHAR_LIT
    ;


// --- SYMBOLS ------------------------------------------------------

// Identifier Names

KEYWORD : LETTER+;

IDENTIFIER : LETTER ALPHANUMERIC*;

ATOM_IDENTIFIER : '@' IDENTIFIER; 

fragment LETTER: UNICODE_LETTER | '_';

fragment ALPHANUMERIC : UNICODE_ALPHANUMERIC | '_';

// MUSICAL ALPHABET

MUSIC_NOTE     : MUSIC_ALPHABET (PITCH_FLAT | PITCH_SHARP)? OCTAVE_DIGIT?;

MUSIC_ALPHABET : [A-G];
OCTAVE_DIGIT   : [0-8];
PITCH_FLAT     : 'f';
PITCH_SHARP    : 's';


// --- COMMENTS -----------------------------------------------------

// Magic Comments

SHEBANG : HASH EXCLAMATION ;

SHEBANG_LINE : {this.IsStartOfFile()}? BOM? SHEBANG ~[\n\r\u0085\u2028\u2029]*; // only allowed at start

//DIRECTIVE_LINE : {this.IsNotStartOfFile()}? SHEBANG ~[\n\r\u0085\u2028\u2029]*;

WOODSTOCK : HASH QUESTION ;

//CANARY_TESTING_LINE  : WOODSTOCK ~[\n\r\u0085\u2028\u2029]*;

// Rubber Duck Debugging

RUBBERDUCK : AT ALPHANUMERIC* EQUAL;

// Tracer Bird Logging

TRACERBIRD : AT (LOGGING_LEVEL | ALPHANUMERIC*)? RIGHT_ANGLE;

LOGGING_LEVEL : TRACE | DEBUG | INFO | WARN | ERROR | FATAL;

// Hashtags

HASHTAG : HASH ALPHANUMERIC* WSP? ~[\n\r\u0085\u2028\u2029]*;


// --- UNICODE CHARACTERS -------------------------------------------

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


// --- SPECIAL TOKENS -----------------------------------------------

// Emit an EOS token for any newlines, semicolon, multiline comments or the EOF
// and return to normal lexing

EOS : EOL
    | LINE_COMMENT
    | EOF
    ;

// End of Line (EOL) characters

EOL : '\n'       /* Unix, Linux, macOS */
    | '\r' '\n'  /* Windows, DOS */
    | '\r'       /* Classic Mac OS (pre-OS X) */
    | '\u0085'   /* IBM Mainframes (EBCDIC) */
    | '\u2028'   /* Unicode Line Separator */
    | '\u2029'   /* Unicode Paragraph Separator */
    ;

BOM : '\ufeff';  // Byte Order Mark


// --- HIDDEN TOKENS ------------------------------------------------

// White Spaces (WSP) characters

WSP : [\u0009\u000B\u000C\u0020\u00A0\p{Zs}]+ -> channel(HIDDEN);

// Two or more physical lines may be joined into logical lines

EXPLICIT_LINE_JOINING : '\\' EOL -> channel(HIDDEN);
  
// Comment Body

LINE_COMMENT          : '#' ~[#$!?>] ~[\n\r\u0085\u2028\u2029]* -> channel(HIDDEN);
BLOCK_COMMENT         : '##' ~[#>] .*? '##'                     -> channel(HIDDEN);
DOCUMENTATION_COMMENT : '###' .*? '###'                         -> channel(HIDDEN);


// --- ERROR HANDLING -----------------------------------------------

UnexpectedCharacter : . -> channel(ERROR_CHANNEL);
