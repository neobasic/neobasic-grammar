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

tokens {
    // INDENT, DEDENT,
    XML_CONTENT
}

channels {
    COMMENT,
    ERROR_CHANNEL
}

// DELETE ME
INDENT : '>>>>';
DEDENT : '<<<<';

// --- KEYWORDS -----------------------------------------------------

// IDENTIFICATION DIVISION

MODULE : 'module';
APPLET : 'applet';
NOTABENE : 'notabene';

// ENVIRONMENT DIVISION

DEFINE : 'define';
UNDEF : 'undef';
USE : 'use';
AS : 'as';
OF : 'of';
INCLUDE : 'include';
INTERFACE : 'interface';

// ACCESS SPECIFIERS

PUBLIC : 'public';
PROTECTED : 'protected';
PRIVATE : 'private';

// TOP LEVEL SENTENCES

TYPE : 'type';
CONST : 'const';
LET : 'let';
VAR : 'var';
CAST : 'cast';
FACT : 'fact';
FUNC : 'func';
FEED : 'feed';
SUB : 'sub';
OUT : 'out';
REF : 'ref';
RAISES : 'raises';
NOPANIC : 'nopanic';
DELETE : 'delete';
MACRO : 'macro';
VAL : 'val';
OPERATOR : 'operator';
EVENT : 'event';
ENUM : 'enum';
STRUCT : 'struct';
PROTO : 'proto';
TRAIT : 'trait';
CLASS : 'class';
OBJECT : 'object';
EXTENDS : 'extends';
IMPLEMENTS : 'implements';
MIXES : 'mixes';
CONSTRUCT : 'construct';
DESTRUCT : 'destruct';
PROPERTY : 'property';
GETTER : 'get';
SETTER : 'set';

// STATEMENTS AND BLOCKS

IF : 'if';
THEN : 'then';
ELIF : 'elif';
ELSE : 'else';
MATCH : 'match';
CASE : 'case';
FALLTHROUGH : 'fallthrough';
TRY : 'try';
CATCH : 'catch';
OTHERWISE : 'otherwise';
UNLESS : 'unless';
TILL  : 'till';
DEFER : 'defer';
WITH : 'with';
DO : 'do';
LOOP : 'loop';
FOR : 'for';
EACH : 'each';
STEP : 'step';
WHILE : 'while';
UNTIL : 'until';
UPTO : 'upto';
NEXT : 'next';
CONTINUE : 'continue';
BREAK : 'break';
RETURN : 'return';
YIELD : 'yield';
RAISE : 'raise';
PANIC : 'panic';
GO : 'go';
INTO : 'into';
GOSUB : 'gosub';
FORK : 'fork';
AWAIT : 'await';
SWITCH : 'switch';
WHEN : 'when';
DEFAULT : 'default';
BEGIN : 'begin';
END : 'end';

// CONSOLE STATEMENTS

AT    : 'at';
SCAN  : 'scan';
ECHO  : 'echo';
ALERT : 'alert';
ENTRY : 'entry';
PLAY  : 'play';

// PREDECLARED VALUES AND VARIABLES

THIS : 'this';
IOTA : 'iota';
NTH : 'nth';
IT : 'it';
SELF : 'self';
SUPER : 'super';
PARENT : 'parent';

// FACT SCOPES

ALL : 'all';
ANY : 'any';
LOT : 'lot';
NIL : 'nil';
ONE : 'one';
TWO : 'two';

// EXPRESSIONS

LAMBDA : 'lambda';

// META OPERATORS'

TYPEOF : 'typeof';
SIZEOF : 'sizeof';
INSTANCEOF : 'instanceof';
ANCESTOROF : 'ancestorof';

// CONDITIONAL OPERATORS

IS : 'is';
IN : 'in';
BETWEEN : 'between';
LIKE : 'like';

// LOGICAL OPERATORS

AND : 'and';        // Short-circuit: stops evaluating as soon as the result is known
NSC_AND : 'AND';    // Non-short-circuit: always evaluates both expressions
AND_NOT : 'andn';   // X AND NOT Y
NOT_AND : 'nand';   // NOT (X AND Y)
OR : 'or';          // Short-circuit: stops evaluating as soon as the result is known
NSC_OR : 'OR';      // Non-short-circuit: always evaluates both expressions
NOT_OR : 'nor';     // NOT (X OR Y)
XOR : 'xor';
NOT_XOR : 'nxor';   // NOT (X XOR Y)
NOT : 'not';

// COMPOUND OPERATORS

NEW : 'new';
NAB : 'nab';

// ARRAY OPERATORS

DEL   : 'del';

// META DATA TYPES

ATOM : 'atom';
AUTO : 'auto';
SPAN : 'span';
VIEW : 'view';
VOID : 'void';

// BOOLEAN DATA TYPES

BOOL8 : 'bool8';
BOOL16 : 'bool16';
BOOL32 : 'bool32';
BOOL64 : 'bool64';
BOOL128 : 'bool128';
BOOL : 'bool';

// NATURAL NUMBERS

BYTE : 'byte';
NAT8 : 'nat8';
NAT16 : 'nat16';
NAT32 : 'nat32';
NAT64 : 'nat64';
NAT128 : 'nat128';
NATURAL : 'natural';
BIGNATURAL : 'bignatural';

// NUMERIC INTEGERS

INT8 : 'int8';
INT16 : 'int16';
INT32 : 'int32';
INT64 : 'int64';
INT128 : 'int128';
INT : 'int';
BIGINT : 'bigint';

// NUMERIC REALS

REAL8 : 'real8';
REAL16 : 'real16';
REAL32 : 'real32';
REAL64 : 'real64';
REAL128 : 'real128';
REAL : 'real';
BIGREAL : 'bigreal';

// NUMERIC DECIMALS

DEC8 : 'dec8';
DEC16 : 'dec16';
DEC32 : 'dec32';
DEC64 : 'dec64';
DEC128 : 'dec128';
DECIMAL : 'decimal';
MONEY : 'money';

// NUMERIC RATIOS

RATIO8 : 'ratio8';
RATIO16 : 'ratio16';
RATIO32 : 'ratio32';
RATIO64 : 'ratio64';
RATIO128 : 'ratio128';
RATIO : 'ratio';

// NUMERIC COMPLEXES

COMPLEX32 : 'complex32';
COMPLEX64 : 'complex64';
COMPLEX128 : 'complex128';
COMPLEX : 'complex';

// NUMERIC QUATERNIONS

QUATERN32 : 'quatern32';
QUATERN64 : 'quatern64';
QUATERN128 : 'quatern128';
QUATERN : 'quatern';

// TEMPORAL DATA TYPES

DATE : 'date';
ELAPSE : 'elapse';

// CHARACTER DATA TYPES

ASCII : 'ascii';
WCHAR : 'wchar';
UNICODE : 'unicode';
CHAR8 : 'char8';
CHAR16 : 'char16';
CHAR32 : 'char32';
CHAR : 'char';

// SEQUENCE DATA TYPES

ANSI : 'ansi';
WSTR : 'wstr';
STRING8 : 'string8';
STRING16 : 'string16';
STRING32 : 'string32';
STRING : 'string';
REGEX : 'regex';
BINARY : 'binary';

// SHELL DATA TYPES

INET : 'inet';
PATH : 'path';
URI : 'uri';

// COMPOSITE DATA TYPES

RANGE : 'range';
PAIR : 'pair';
TUPLE : 'tuple';

// ARRAY DATA TYPES

ARRAY : 'Array';
LIST : 'List';
MAP : 'Map';
CHANNEL : 'Channel';
VECTOR : 'Vector';
MATRIX : 'Matrix';
SET : 'Set';
QUEUE : 'Queue';
DEQUE : 'Deque';
XML : 'Xml';
TABLE : 'Table';
MEMO : 'Memo';

// MONAD LOGIC VALUE CONSTRUCTORS

TRUE : 'True';
FALSE : 'False';

// MONAD NUMERIC VALUE CONSTRUCTORS

NONZERO : 'Nonzero';
ZERO : 'Zero';
MINVALUE : 'MinValue';
MAXVALUE : 'MaxValue';
NAN : 'NaN';
POSITIVEINFINITY : 'PositiveInfinity';
NEGATIVEINFINITY : 'NegativeInfinity';

// MONAD TEMPORAL VALUE CONSTRUCTORS

LOCALDATE : 'LocalDate';
LOCALDATETIME : 'LocalDateTime';
OFFSETDATE : 'OffsetDate';
OFFSETDATETIME : 'OffsetDateTime';
ZONEDDATE : 'ZonedDate';
ZONEDDATETIME : 'ZonedDateTime';
TOMORROW : 'Tomorrow';
TODAY : 'Today';
NOW : 'Now';
YESTERDAY : 'Yesterday';
EON : 'Eon';
EPOCH : 'Epoch';

// MONAD CHARACTER VALUE CONSTRUCTORS

LETTER : 'Letter';
MARK : 'Mark';
DIGIT : 'Digit';
PUNCTUATION : 'Punctuation';
SYMBOL : 'Symbol';
SEPARATOR : 'Separator';
NONPRINTABLE : 'NonPrintable';
NULL : 'Null';

// MONAD SEQUENCE VALUE CONSTRUCTORS

BLANK : 'Blank';
NONBLANK : 'Nonblank';

// MONAD PATH VALUE CONSTRUCTORS

FOLDER : 'Folder';
FILE : 'File';
LINKLINKFILE : 'LinkFile';
PIPEFILE : 'PipeFile';
SOCKETFILE : 'SocketFile';
BLOCKDEVICE : 'BlockDevice';
CHARDEVICE : 'charDevice';
NULLDEVICE : 'NullDevice';

// MONAD URI VALUE CONSTRUCTORS

URL : 'Url';
URN : 'Urn';

// MONAD INET VALUE CONSTRUCTORS

IPV4 : 'Ipv4';
IPV6 : 'Ipv6';

// MONAD RESULT ! VALUE CONSTRUCTORS

RESULT : 'Result';
OKAY : 'Okay';
FAIL : 'Fail';

// MONAD MAYBE ? VALUE CONSTRUCTORS

MAYBE : 'Maybe';
SOME : 'Some';
NONE : 'None';

// MONAD EITHER ?? VALUE CONSTRUCTORS

EITHER : 'Either';
YEA : 'Yea';
NAY : 'Nay';

// MONAD STREAM |> VALUE CONSTRUCTORS

STREAM : 'Stream';
DATUM : 'Datum';
EOT   : 'EoT';

// MAGIC COMMENT: TEST

ASSERT : 'assert';
UNIT   : 'unit';
FROM   : 'from';
ONCE   : 'once';
DATA   : 'data';
CALL   : 'call';
HIDE   : 'hide';
SHOW   : 'show';
STAY   : 'stay';
PASS   : 'pass';
PAST   : 'past';
TFAIL  : 'fail';


// --- UNARY OPERATORS ----------------------------------------------

// Arithmetic Operators

CARET         : '^';    // 
SQUARE_ROOT   : '^/';
FACTORIAL     : '*!';
INCREMENT     : '++';
DECREMENT     : '--';
PLUS          : '+';    // 
HYPHEN        : '-';    // 

// Miscellaneous operators

ELLIPSIS      : '...';   // 

LIFETIME      : '::';   // 

NAMED_ARGUMENTS : '**';  //
NAMED_OPTIONS   : '~~';  //


// --- BINARY OPERATORS ---------------------------------------------

// Arithmetic operators

ASTERISK   : '*';    // Multiplication
SLASH      : '/';    // Real Division, Regular expression literal
DIVISION   : '÷';    // Integer Division
PERCENT    : '%';    // Modulo, Integer Division, Percentage
QUOTIENT   : '%%';


// Financial Operators

PERCENTAGE_RATE      : '%/';
PERCENTAGE_AMOUNT    : '%*';
PERCENTAGE_INCREASE  : '%+';
PERCENTAGE_DECREASE  : '%-';
PERCENTAGE_VARIATION : '%^';

// Bitwise Operators

DOUBLE_LEFT_ANGLE    : '<<';   // 
DOUBLE_RIGHT_ANGLE   : '>>';   // 
UNSIGNED_RIGHT_SHIFT : '>>>';

// Comparison Operators

ELVIS_TEST            : '?:';
THREE_WAY_TEST        : '<=>';

// Relational Operators

STRICT_EQUALITY   : '==';
STRICT_INEQUALITY : '!=';
LOOSE_EQUALITY    : '~==';  // ???
LOOSE_INEQUALITY  : '~!=';  // ???
LEFT_ANGLE        : '<';    // Less Than
LESS_OR_EQUALS    : '<=';
RIGHT_ANGLE       : '>';    // Greater Than
GREATER_OR_EQUALS : '>=';

// Conditional Operators

IS_NOT                : IS NOT;
NOT_IS                : NOT IS;
NOT_IN                : NOT IN;
NOT_BETWEEN           : NOT BETWEEN;
NOT_LIKE              : NOT LIKE;
NOT_INSTANCEOF        : NOT INSTANCEOF;
NOT_ANCESTOROF        : NOT ANCESTOROF;
NOT_EXTENDS           : NOT EXTENDS;
NOT_IMPLEMENTS        : NOT IMPLEMENTS;
NOT_MIXES             : NOT MIXES;

DIVISIBLE_BY          : '?%';
NOT_DIVISIBLE_BY      : '!%';

// Coalescing Operators

EXCLAMATION            : '!';    // Error
DOUBLE_EXCLAMATION     : '!!';   // 
QUESTION               : '?';    // Option
DOUBLE_QUESTION        : '??';   // 
ERROR_NONE_COALESCING  : '!?';

// Range Operators

INTERVAL_INCLUSIVE       : '..';
INTERVAL_LEFT_EXCLUSIVE  : '>..';
INTERVAL_RIGHT_EXCLUSIVE : '..<';
INTERVAL_EXCLUSIVE       : '>..<';

// Imply Operators

NECK_RULE : ':-';

FUNCTOR : '->';

IMPLICIT_RETURN : '=>';

MONAD_BIND : '=>>';

// Pipeline Operator

PIPELINE : '|>';

// Flow of Execution Operators

EXECUTE_SEQUENCE : '&&';

EXECUTE_SEQUENCE_OKAY : '?&';
EXECUTE_SEQUENCE_FAIL : '!&';

EXECUTE_BACKGROUND : '||';

// Input/Output Redirection Operators

APPEND_OUTPUT_REDIRECTION : '&>>';
OUTPUT_REDIRECTION : '&>';

APPEND_STDOUT_REDIRECTION : '&1>>';
STDOUT_REDIRECTION : '&1>';

APPEND_STDERR_REDIRECTION : '&2>>';
STDERR_REDIRECTION : '&2>';

// Single Assignment Operators

EQUAL               : '=';    // Assignment, Equality
DERIVED_ASSIGNMENT  : ':=';
LAZY_ASSIGNMENT     : '~=';
POP_ONE_ASSIGNMENT  : '<-';
PULL_ALL_ASSIGNMENT : '<<-'; 
PIPE_ASSIGNMENT     : '<|'; 

// Compound Assignment Operators

NTH_POWER_ASSIGNMENT            : '^=';
NTH_ROOT_ASSIGNMENT             : '^/=';
MULTIPLICATION_ASSIGNMENT       : '*=';
REAL_DIVISION_ASSIGNMENT        : '/=';
INTEGER_DIVISION_ASSIGNMENT     : '÷=';
MODULO_ASSIGNMENT               : '%=';
QUOTIENT_ASSIGNMENT             : '%%=';
PERCENTAGE_RATE_ASSIGNMENT      : '%/=';
PERCENTAGE_AMOUNT_ASSIGNMENT    : '%*=';
PERCENTAGE_INCREASE_ASSIGNMENT  : '%+=';
PERCENTAGE_DECREASE_ASSIGNMENT  : '%-=';
PERCENTAGE_VARIATION_ASSIGNMENT : '%^=';
ADDITION_ASSIGNMENT             : '+=';
SUBTRACTION_ASSIGNMENT          : '-=';
SET_UNION_ASSIGNMENT            : '|=';
SET_INTER_ASSIGNMENT            : '&=';
LEFT_SHIFT_ASSIGNMENT           : '<<=';
SIGNED_RIGHT_SHIFT_ASSIGNMENT   : '>>=';
UNSIGNED_RIGHT_SHIFT_ASSIGNMENT : '>>>=';
NONE_COALESCING_ASSIGNMENT      : '??=';
SHELL_PID_ASSIGNMENT            : '&&=';
SHELL_BKG_PID_ASSIGNMENT        : '||=';


// --- SYMBOLS ------------------------------------------------------

// Identifier Names

IDENTIFIER : ALPHA ALPHANUMERIC*;

ATOM_IDENTIFIER : '@' IDENTIFIER;

ASPECT_IDENTIFIER : '@@' IDENTIFIER;


// --- LITERALS -----------------------------------------------------

// Integer literals

NATURAL_LIT : INTEGER_NUMBER 'N';

INTEGER_LIT : [+-]? INTEGER_NUMBER;

fragment INTEGER_NUMBER
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

// Decimal literals (Fixed Point Numbers)

DECIMAL_LIT : [+-]? DECIMAL_NUMBER 'D';

// Real literals (Floating Point Numbers)

REAL_LIT : [+-]? REAL_NUMBER;

fragment REAL_NUMBER
    : DEC_REAL
    | HEX_REAL
    ; 

fragment DEC_REAL : DEC_DECIMAL DEC_EXPONENT?;
fragment DEC_EXPONENT : [eE] [+-]? DEC_GROUPS;

fragment HEX_REAL : HEX_DECIMAL HEX_EXPONENT?;
fragment HEX_EXPONENT : [pP] [+-]? DEC_GROUPS;

fragment DECIMAL_NUMBER
    : DEC_DECIMAL
    | HEX_DECIMAL
    ; 

fragment DEC_DECIMAL : DEC_MANTISSA;
fragment DEC_MANTISSA
    : DEC_GROUPS
    | DEC_GROUPS '.' ~[.] DEC_GROUPS?
    | '.' ~[.] DEC_GROUPS
    ;

fragment HEX_DECIMAL : '0' [xX] HEX_MANTISSA;
fragment HEX_MANTISSA
    : HEX_GROUPS
    | HEX_GROUPS '.' ~[.] HEX_GROUPS?
    | '.' ~[.] HEX_GROUPS
    ;

// Rational literals

RATIO_LIT : [+-]? INTEGER_NUMBER '//' INTEGER_NUMBER;

// Imaginary literals

IMAGINARY_LIT : [+-]? ( INTEGER_NUMBER | REAL_NUMBER ) [ijk];

// Temporal Literals 

ELAPSE_LIT : [+-]? ( INTEGER_NUMBER | REAL_NUMBER ) ( [ymwdhsz] | 'min' | 'ms' | 'us' | 'ns' );

// Temporal Literals 

TERM_LIT : [+-]? ( INTEGER_NUMBER | REAL_NUMBER ) ALPHA+;

// Binary literals

BINARY_LIT
    : HEX_VALUE
    | OCT_VALUE
    | BIN_VALUE
    ;

// Character literals

ASCII_LIT : 'a'? ASCII_CHAR;

UNICODE_LIT : ( 'u' | 'u32' )? UNICODE_CHAR;

CHAR_LIT : CHARS_PREFIX? UNICODE_CHAR;

fragment CHARS_PREFIX : 'a' | 'u' | 'u8' | 'u16' | 'u32' | 'L';

fragment ASCII_CHAR
    : XML_ENTITY_REFERENCE
    | ASCII_ESCAPED_VALUE
    | '\'' ASCII_ESCAPED_VALUE '\''
    | '`'  ASCII_ESCAPED_VALUE '`'
    | '"'  UNICODE_ASCII '"'
    | '\'' UNICODE_ASCII '\''
    | '`'  UNICODE_ASCII '`'
    ;

fragment UNICODE_CHAR
    : XML_ENTITY_REFERENCE
    | ASCII_ESCAPED_VALUE
    | UNICODE_ESCAPED_VALUE
    | '\'' ASCII_ESCAPED_VALUE '\''
    | '`'  ASCII_ESCAPED_VALUE '`'
    | '\'' UNICODE_ESCAPED_VALUE '\''
    | '`'  UNICODE_ESCAPED_VALUE '`'
    | '"'  ~["] '"'
    | '\'' ~['] '\''
    | '`'  ~[`] '`'
    ;

fragment ASCII_ESCAPED_VALUE
    : '\\' ( [0abcdefnqrstvz'"`\\?]
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

fragment XML_ENTITY_REFERENCE
    : '&amp;'
    | '&apos;'
    | '&bsol;'
    | '&commat;'
    | '&dollar;'
    | '&grave;'
    | '&gt;'
    | '&lbrace;'
    | '&lt;'
    | '&num;'
    | '&percnt;'
    | '&quot;'
    | '&rbrace;'
    | '&semi;'
    | '&sol;'
    ;

// String literals

VERBATIM_SINGLELINE_STRING_LIT     : CHARS_PREFIX? '"' .*? '"';

VERBATIM_MULTILINE_STRING_LIT      : CHARS_PREFIX? '"""' .*? '"""';

TEMPLATE_SINGLELINE_STRING_LIT     : CHARS_PREFIX? '\'' .*? '\'';

TEMPLATE_MULTILINE_STRING_LIT      : CHARS_PREFIX? '\'\'\'' .*? '\'\'\'';

TRANSLATABLE_SINGLELINE_STRING_LIT : CHARS_PREFIX? '`' .*? '`';

TRANSLATABLE_MULTILINE_STRING_LIT  : CHARS_PREFIX? '```' .*? '```';

// HereDoc (Here-Document Type Declaration) Literals

HEREDOC_STRING_LIT : '<<<' IDENTIFIER EOL .*? EOL IDENTIFIER;

// Regular expression literals 

REGULAR_EXPRESSION_LIT : '/' REGULAR_EXPRESSION_CONTENT '/' [digmsuvy]*;

fragment REGULAR_EXPRESSION_CONTENT : REGEX_FIRST_CHAR REGEX_CHAR*;

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

// Atom dot literal

ATOM_DOT_LIT : '@' INTEGER_LIT ('.' INTEGER_LIT)*;

// Atom elapse literal

ATOM_ELAPSE_LIT : '@' DOT_FRACTION ('.' DOT_FRACTION)*;

fragment DOT_FRACTION : INTEGER_LIT ([ymwdhsz] | 'min' | 'ms' | 'us' | 'ns');

// Atom musical literal

ATOM_MUSIC_LIT : '@' RHYTHM;

fragment RHYTHM : DOT_FRACTION '.' MUSIC_NOTE ( ( '.' DOT_FRACTION )? '.' MUSIC_NOTE )*;

fragment MUSIC_NOTE : MUSIC_ALPHABET (PITCH_FLAT | PITCH_SHARP)? OCTAVE_DIGIT?;

fragment MUSIC_ALPHABET : [A-G];
fragment PITCH_FLAT     : 'f';
fragment PITCH_SHARP    : 's';
fragment OCTAVE_DIGIT   : [0-8];

// Shell predefined literals

SHELL_CURRENT_OPTIONS : '$*';

SHELL_EXIT_STATUS : '$?';

SHELL_ERROR_LEVEL : '$!';

SHELL_BKG_EXIT_STATUS : '$$?';

SHELL_BKG_ERROR_LEVEL : '$$!';

SHELL_FILE_DESCRIPTOR : '$:' DEC_VALUE;

SHELL_CMD_ARGUMENT : '$%' DEC_VALUE?;

SHELL_ENV_VARIABLE : '$$' IDENTIFIER;

// File system files and directories

SHELL_STRING_PATH : '$' ( VERBATIM_SINGLELINE_STRING_LIT | TEMPLATE_SINGLELINE_STRING_LIT | TRANSLATABLE_SINGLELINE_STRING_LIT );

SHELL_PATH : '$' ( ABSOLUTE_PATH | RELATIVE_PATH | EXPANSION_PATH | PATH_NAME );

ABSOLUTE_PATH : (DRIVE_LETTER ':')? '/' PATH_NAME?;

fragment RELATIVE_PATH : ('.' | '..') '/' ('..' '/')* PATH_NAME?;

fragment EXPANSION_PATH : ('~' '/'? | '^' '/'? | '/') PATH_NAME?;

fragment PATH_NAME : FILE_NAME ('/' FILE_NAME)*;

fragment FILE_NAME : UNICODE_FILEPATH+;

fragment DRIVE_LETTER : [a-zA-Z];


// --- MAGIC STATEMENTS ---------------------------------------------

// Rubber Duck Debugging

RUBBERDUCK : '@' IDENTIFIER? '=';

// Song Bird Tracing

SONGBIRD : '@' IDENTIFIER? '>';

SONGBIRD_LOG : '@<' .*? '>';


// --- MAGIC COMMENTS -----------------------------------------------

// Pragma Directive

SHEBANG : '#!';

// Shell-lookup Directive

SHERLOCK : '#$';

// Canary-testing Directive

WOODSTOCK_LINE  : '#?';

WOODSTOCK_BLOCK : '##?';


// --- SPECIAL TOKENS -----------------------------------------------

// End Of Sentence (EOS): Emit an EOS token for any newlines,
// line comments or the EOF and return to normal lexing.

EOS : EOL
    | LINE_COMMENT
    | EOF
    ;

// Explicit Line Continuation (ELC) character

ELC : '\\' EOL;

// End Of Line (EOL) characters

EOL : '\n'       // Unix, Linux, macOS
    | '\r' '\n'  // Windows, DOS
    | '\r'       // Classic Mac OS (pre-OS X)
    | '\u0085'   // IBM Mainframes (EBCDIC)
    | '\u2028'   // Unicode Line Separator
    | '\u2029'   // Unicode Paragraph Separator
    ;


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
fragment UNICODE_ASCII : [\u0020-\u007E];

// Unicode code points from U+0000 to U+10FFFF, except categorized as: 
// Cc (Control), Cf (Format), Cs (Surrogate), Co (Private Use), Cn (Unassigned) 
// and except these 15 special chars (punctuation or operators). 
fragment UNICODE_FILEPATH : ~[|/\\<>;:?*#$&"'`\p{Cc}\p{Cf}\p{Cs}\p{Co}\p{Cn}] ;


// --- COMMENTS -----------------------------------------------------

// Hashtags

HASHTAG : '#' ALPHANUMERIC+ ('/' ALPHANUMERIC+)*       -> channel(COMMENT);

// Comments

LINE_COMMENT  : '#' ~[#!?$] ~[\n\r\u0085\u2028\u2029]* -> channel(COMMENT);
BLOCK_COMMENT : '##' ~[#?] .*? '##'                    -> channel(COMMENT);
CELL_COMMENT  : '###' .*? '###'                        -> channel(COMMENT);


// --- HIDDEN TOKENS ------------------------------------------------

// Byte Order Mark (BOM) is a Unicode character used to indicate the endianness of a text file.
// It is often used at the beginning of a file to signal that the file is encoded in

BOM : (UTF8_BOM | UTF16_BOM | UTF32_BOM) -> channel(HIDDEN);

fragment UTF8_BOM  : '\uEFBBBF';
fragment UTF16_BOM : '\uFEFF';
fragment UTF32_BOM : '\u0000FEFF';

// White Spaces (WSP) characters

WSP : [\u0009\u000B\u000C\u0020\u00A0\p{Zs}]+ -> channel(HIDDEN);


// --- PUNCTUATION --------------------------------------------------

LEFT_PARENTHESIS     : '(';    // 
RIGHT_PARENTHESIS    : ')';    // 
LEFT_BRACKET         : '[';    // 
RIGHT_BRACKET        : ']';    // 
LEFT_CURLY           : '{';    // 
RIGHT_CURLY          : '}';    // 
DOT                  : '.';    // Dot
COMMA                : ',';    // Comma
SEMICOLON            : ';';    // 
COLON                : ':';    // Pair mapping
APOSTROPHE           : '\'';   // Character literal, template string literal
QUOTE                : '"';    // Verbatim String literal
BACKTICK             : '`';    // Backtick
AT_SIGN              : '@';    // Atoms, Annotations/Decorators
HASH                 : '#';    // Comment, Directive (Interpreter, Pragma, Testing)
DOLLAR               : '$';    // 
AMPERSAND            : '&';    // 
BACKSLASH            : '\\';   // 
TILDE                : '~';    // 
PIPE                 : '|';    // 
UNDERSCORE           : '_';    // Wildcard, Anonymous variable

LAMBDA_PARENTHESIS   : '(\\';  // 

DOUBLE_LEFT_BRACKET  : '[[';   // 
DOUBLE_RIGHT_BRACKET : ']]';   // 

DOUBLE_LEFT_CURLY    : '{{';   // 
DOUBLE_RIGHT_CURLY   : '}}';   // 

DOUBLE_COMMA         : ',,';   //
DOUBLE_SEMICOLON     : ';;';   // 
DOUBLE_CARET         : '^^';   //


// XML tags

XML_CLOSING_TAG      : '</';   // </ELEMENT>
XML_SELFCLOSING_TAG  : '/>';   // <ELEMENT/>

XML_OPENING_FRAGMENT : '<>';   // <ELEMENT/>
XML_CLOSING_FRAGMENT : '</>';  // </ELEMENT>


// --- ERROR HANDLING -----------------------------------------------
// This has to be the last lexer rule, because it can absorve characers 
// and conflict with the lexical analysis.

UnexpectedCharacter : . -> channel(ERROR_CHANNEL);
