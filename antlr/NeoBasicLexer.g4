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
 *  DEFAULT LEXER MODE
 */

// Punctuation

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
BACKTICK          : '`';    // Backtick
QUOTE             : '"';    // Verbatim String literal
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


// POSFIX TYPE MODIFIERS

OPTIONAL_MODIFIER
    : EXCLAMATION                   // ResultOption wrapper declaration
    | QUESTION                      // MaybeOption wrapper declaration
    | EXCLAMATION QUESTION          // ResultOption wrapper of MaybeOption wrapper declaration
    ;

POSFIX_TYPE_MODIFIER
    : OPTIONAL_MODIFIER
    ;


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
RATIONAL_FRACTION : SLASH SLASH;
INTEGER_DIVISION  : PERCENT PERCENT | DIVISION ;
MODULO            : PERCENT;
EXPONENTIATION    : SQUARE_POWER;
NTH_ROOT          : SQUARE_ROOT;


// Financial Operators

PERCENTAGE_RATE      : PERCENT SLASH;
PERCENTAGE_AMOUNT    : PERCENT ASTERISK;
PERCENTAGE_INCREASE  : PERCENT PLUS;
PERCENTAGE_DECREASE  : PERCENT MINUS;
PERCENTAGE_VARIATION : PERCENT CARET;


//  Bitwise Operators (Strict Evaluation = Eager Evaluation)

BIT_AND              : AMPERSAND;
BIT_OR               : PIPE;
BIT_XOR              : CARET;
BIT_CLEAR            : AMPERSAND CARET;
LEFT_SHIFT           : LEFT_ANGLE LEFT_ANGLE;
SIGNED_RIGHT_SHIFT   : RIGHT_ANGLE RIGHT_ANGLE;
UNSIGNED_RIGHT_SHIFT : RIGHT_ANGLE RIGHT_ANGLE RIGHT_ANGLE;


// Comparison Operators

DIVISIBLE_BY_TEST     : QUESTION PERCENT;              // Evenly Divisible by (RETURNS BOOLEAN)  
NOT_DIVISIBLE_BY_TEST : EXCLAMATION PERCENT;           // Not Divisible by (RETURNS BOOLEAN)   
THREE_WAY_TEST        : LEFT_ANGLE EQUAL RIGHT_ANGLE;  // Three-way comparison (RETURNS -1, 0, OR 1)
ELVIS_TEST            : QUESTION COLON;                // Elvis Operator (RETURNS -1, 0, OR 1)
IDENTITY              : IS;                            // Identity Operator (RETURNS BOOLEAN)
NOT_IDENTITY          : IS NOT;                        // Negation of Identity Operator (RETURNS BOOLEAN)
BETWEEN_RANGE         : BETWEEN;                       // Interval Comparison (RETURNS BOOLEAN)
NOT_BETWEEN_RANGE     : NOT BETWEEN;                   // Negation of Interval Comparison (RETURNS BOOLEAN)


// Relational Operators

EQUALS            : EQUAL EQUAL;
NOT_EQUALS        : EXCLAMATION EQUAL;
LESS              : LEFT_ANGLE;
LESS_OR_EQUALS    : LEFT_ANGLE EQUAL;
GREATER           : RIGHT_ANGLE;
GREATER_OR_EQUALS : RIGHT_ANGLE EQUAL;


// Logical Operators (Non-Strict Evaluation = Short-circuit Evaluation) 

LOGICAL_AND  : AND;   // CONJUNCTION
LOGICAL_OR   : OR;    // DISJUNCTION
LOGICAL_XOR  : XOR;   // EXCLUSIVE DISJUNCTION
LOGICAL_NOT  : NOT;   // NEGATION
// UNIVERSAL GATES
LOGICAL_NAND : NAND;  // NEGATION OF CONJUNCTION: NOT (X AND B)
LOGICAL_NOR  : NOR;   // NEGATION OF DISJUNCTION: NOT (X OR B)
LOGICAL_NXOR : NXOR;  // NEGATION OF EXCLUSIVE DISJUNCTION: NOT (X OR B)


// Textual Operators

INTERPOLATION : POSITIVE;
REPETITION    : MULTIPLICATION;
MATCHING      : LIKE;         // Matching Operator (RETURNS BOOLEAN)
NOT_MATCHING  : NOT LIKE;     // Negation of Matching Operator (RETURNS BOOLEAN)


// Coalescing Operators

ERROR_PROPAGATION                 : EXCLAMATION;
ERROR_COALESCING                  : EXCLAMATION EXCLAMATION;
ERROR_PROPAGATION_NONE_COALESCING : EXCLAMATION QUESTION;
ERROR_TO_NONE_CONVERTION          : QUESTION;
EXCEPTION_COALESCING              : QUESTION QUESTION;
EXCEPTION_STATEMENT               : ORELSE; 

// Single Assignment Operators
        
BASIC_ASSIGNMENT        : EQUAL;
DESTRUCTURING_ASSIGNMENT : COLON EQUAL;
INLINE_ASSIGNMENT        : COLON COLON;

// Compound Assignment Operators

ADDITION_ASSIGNMENT             : PLUS EQUAL;
SUBTRACTION_ASSIGNMENT          : MINUS EQUAL;
MULTIPLICATION_ASSIGNMENT       : ASTERISK EQUAL;
REAL_DIVISION_ASSIGNMENT        : SLASH EQUAL;
INTEGER_DIVISION_ASSIGNMENT     : DIVISION EQUAL | PERCENT PERCENT EQUAL;
MODULO_ASSIGNMENT               : PERCENT EQUAL;
EXPONENTIATION_ASSIGNMENT       : ASTERISK ASTERISK EQUAL;
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


// Option Literals

OPTION_LIT : NONE | SOME;


// Result Literals

RESULT_LIT : OKAY | FAIL;


// Range Literals

RANGE_LIT
    : INTEGER_NUMBER? INTERVAL INTEGER_NUMBER?
    | CHAR_LIT INTERVAL CHAR_LIT
    ;

INTERVAL : RIGHT_ANGLE? DOT DOT LEFT_ANGLE?;


// Boolean Literals

BOOLEAN_LIT: TRUE | FALSE;


// Numeric literals

NUMBER_LIT
    : DECIMAL_NUMBER
    | REAL_NUMBER
    | RATIONAL_NUMBER
    | IMAGINARY_NUMBER
    | INTEGER_NUMBER
    | NONZERO
    | ZERO
    | MINIMUM
    | MAXIMUM
    | NAN
    | POSITIVEINFINITY
    | NEGATIVEINFINITY
    ;


// Temporal literals

TIME_LIT
    : LOCALDATE
    | LOCALDATETIME
    | OFFSETDATE
    | OFFSETDATETIME
    | ZONEDDATE
    | ZONEDDATETIME
    | TOMORROW
    | NOW
    | TODAY
    | YESTERDAY
    | EON
    | EPOCH
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

fragment FRACTION : SLASH SLASH;


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


// Regular expression literals 

REGULAR_EXPRESSION_LIT : '/' REGEX_FIRST_CHAR REGEX_CHAR* '/' REGEX_FLAG*;

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


// HereDoc Literals

HEREDOC_LITERAL : LEFT_ANGLE LEFT_ANGLE HEREDOC_CONTENT ;

HEREDOC_CONTENT
   : '\'' EOL? TEMPLATE_STRING_CONTENT EOL? '\''
   | '"' EOL? VERBATIM_STRING_CONTENT EOL? '"'
   | IDENTIFIER EOL? VERBATIM_STRING_CONTENT EOL? IDENTIFIER
   ;


// String and Character literals

STRING_LIT
    : VERBATIM_STRING_LIT
    | TEMPLATE_STRING_LIT
    | CHAR_LIT
    | ASCII_LIT
    | BLANK
    | NONBLANK
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


// Identifier Names

KEYWORD : LETTER+;

IDENTIFIER : LETTER ALPHANUMERIC*;

ATOM_IDENTIFIER : '@' IDENTIFIER; 

fragment LETTER: UNICODE_LETTER | '_';

fragment ALPHANUMERIC : UNICODE_ALPHANUMERIC | '_';


// ATOM LITERAL

ATOM_DOT_LIT : '@' DOT_FRACTION ('.' DOT_FRACTION)*;

DOT_FRACTION : [+-] (INTEGER_NUMBER | MUSIC_NOTE | IDENTIFIER);


// MUSICAL ALPHABET

MUSIC_NOTE     : MUSIC_ALPHABET (PITCH_FLAT | PITCH_SHARP)? OCTAVE_DIGIT?;

MUSIC_ALPHABET : [A-G];
OCTAVE_DIGIT   : [0-8];
PITCH_FLAT     : 'f';
PITCH_SHARP    : 's';


// UNICODE CHARACTERS

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


// Magic Comments

SHEBANG : HASH EXCLAMATION ;

SHEBANG_LINE : {this.IsStartOfFile()}? BOM? SHEBANG ~[\n\r\u0085\u2028\u2029]*; // only allowed at start

DIRECTIVE_LINE : {this.IsNotStartOfFile()}? SHEBANG ~[\n\r\u0085\u2028\u2029]*;

WOODSTOCK : HASH QUESTION ;

CANARY_TESTING_LINE  : WOODSTOCK ~[\n\r\u0085\u2028\u2029]*;

// RUBBER DUCK DEBUGGING
RUBBERDUCK : AT ALPHANUMERIC* EQUAL;

// TWEETER TRACING
TWEETER : AT (LOGGING_LEVEL | ALPHANUMERIC*)? RIGHT_ANGLE;

LOGGING_LEVEL : TRACE | DEBUG | INFO | WARN | ERROR | FATAL;

// HASHTAGS

HASHTAG : HASH ALPHANUMERIC* WSP? ~[\n\r\u0085\u2028\u2029]*;


// SPECIAL TOKENS

// End of Line (EOL) characters
EOL : '\n'       /* Unix, Linux, macOS */
    | '\r' '\n'  /* Windows, DOS */
    | '\r'       /* Classic Mac OS (pre-OS X) */
    | '\u0085'   /* IBM Mainframes (EBCDIC) */
    | '\u2028'   /* Unicode Line Separator */
    | '\u2029'   /* Unicode Paragraph Separator */
    ;

BOM : '\ufeff';  // Byte Order Mark.


// HIDDEN TOKENS:

// White Spaces (WSP) characters
WSP : [\u0009\u000B\u000C\u0020\u00A0\p{Zs}]+ -> channel(HIDDEN);

// Two or more physical lines may be joined into logical lines
EXPLICIT_LINE_JOINING : '\\' EOL -> channel(HIDDEN);

// Comment Body
LINE_COMMENT          : '#' ~[#$!?>] ~[\n\r\u0085\u2028\u2029]* -> channel(HIDDEN);
BLOCK_COMMENT         : '##' ~[#>] .*? '##'                     -> channel(HIDDEN);
DOCUMENTATION_COMMENT : '###' .*? '###'                    -> channel(HIDDEN);


// ERROR HANDLING

UnexpectedCharacter : . -> channel(ERROR_CHANNEL);
