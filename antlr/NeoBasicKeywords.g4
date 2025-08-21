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

lexer grammar NeoBasicKeywords;

// --- KEYWORDS -----------------------------------------------------

// IDENTIFICATION DIVISION

MODULE : 'module';
ALGORITHM : 'algorithm';
NOTABENE : 'notabene';

// ENVIRONMENT DIVISION

USE : 'use';
AS : 'as';
OF : 'of';
INCLUDE : 'include';
INTERFACE : 'interface';
EXTERN : 'extern';

// TOP LEVEL SENTENCES

CONST : 'const';
VAL : 'val';
VAR : 'var';
FUNC : 'func';
FEED : 'feed';
FMAP : 'fmap';
SUB : 'sub';
TYPE : 'type';
DIM : 'dim';
FACT : 'fact';
ENUM : 'enum';
STRUCT : 'struct';
PROTO : 'proto';
TRAIT : 'trait';
CLASS : 'class';
GET : 'get';
SET : 'set';
OPER : 'oper';
EVENT : 'event';
DEF : 'def';
DEFN : 'defn';
UNDEF : 'undef';

// ACCESS SPECIFIERS

PUBLIC : 'public';
PROTECTED : 'protected';
PRIVATE : 'private';

// DECLARATION SPECIFIERS

LINEAR : 'linear';
SHARED : 'shared';
VOLATILE : 'volatile';
LOCAL : 'local';
ATOMIC : 'atomic';
STATIC : 'static';
COMPTIME : 'comptime';
MUTABLE : 'mutable';
TRANSIENT : 'transient';
INLINE : 'inline';
SYNCHRO : 'synchro';
VIRTUAL : 'virtual';
OVERRIDE : 'override';
FINAL : 'final';
ASYNC : 'async';
ABSTRACT : 'abstract';
SINGLETON : 'singleton';
RECORD : 'record';
MONAD : 'monad';
MEASURE : 'measure';
INFIX : 'infix';
EXPLICIT : 'explicit';


// STATEMENTS AND BLOCKS

IF : 'if';
THEN : 'then';
ELIF : 'elif';
ELSE : 'else';
UNLESS : 'unless';
ORELSE : 'orelse';
MATCH : 'match';
CASE : 'case';
FALLTHROUGH : 'fallthrough';
TRY : 'try';
CATCH : 'catch';
RETRY : 'retry';
LOOP : 'loop';
STEP : 'step';
TIMES : 'times';
FOR : 'for';
EACH : 'each';
WHILE : 'while';
UNTIL : 'until';
NEXT : 'next';
REDO : 'redo';
BREAK : 'break';
RETURN : 'return';
YIELD : 'yield';
DEFER : 'defer';
GO : 'go';
TO : 'to';
AWAIT : 'await';
SWITCH : 'switch';
WHEN : 'when';
DEFAULT : 'default';
CONTINUE : 'continue';
WITH : 'with';
DO : 'do';
INVAR : 'invar';

// PREDECLARED VALUES AND VARIABLES

THIS : 'this';
IOTA : 'iota';
NTH : 'nth';
TOP : 'top';
END : 'end';
IT : 'it';
SELF : 'self';
SUPER : 'super';
PARENT : 'parent';

// FACT SCOPES

ALL : 'all';
ANY : 'any';
ONE : 'one';
TWO : 'two';
NIL : 'nil';

// EXPRESSIONS

LET : 'let';
OWN : 'own';
MUT : 'mut';

// META OPERATORS'

TYPEOF : 'typeof';
INSTANCEOF : 'instanceof';
SIZEOF : 'sizeof';

// CONDITIONAL OPERATORS

IS : 'is';
IN : 'in';
BETWEEN : 'between';
LIKE : 'like';

// LOGICAL OPERATORS

NOT : 'not';
AND : 'and';
OR : 'or';
XOR : 'xor';
NAND : 'nand';
NOR : 'nor';
NXOR : 'nxor';

// ARRAY OPERATORS

NEW : 'new';
DEL : 'del';

// META DATA TYPES

ATOM : 'atom';
AUTO : 'auto';
VOID : 'void';

// BOOLEAN DATA TYPES

BOOL8 : 'Bool8';
BOOL16 : 'Bool16';
BOOL32 : 'Bool32';
BOOL64 : 'Bool64';
BOOL128 : 'Bool128';
BOOL : 'Bool';

// NUMERIC DIGITS

DIG : 'Dig';
BIT : 'Bit';
OCT : 'Oct';
HEX : 'Hex';
ROMAN : 'Roman';
NIBBLE : 'Nibble';
BYTE : 'Byte';
NUMBER : 'Number';

// NATURAL NUMBERS

NAT8 : 'Nat8';
NAT16 : 'Nat16';
NAT32 : 'Nat32';
NAT64 : 'Nat64';
NAT128 : 'Nat128';
NAT : 'Nat';
BIGNAT : 'Bignat';

// NUMERIC INTEGERS

INT8 : 'Int8';
INT16 : 'Int16';
INT32 : 'Int32';
INT64 : 'Int64';
INT128 : 'Int128';
INT : 'Int';
BIGINT : 'Bigint';

// NUMERIC REALS

REAL16 : 'Real16';
REAL32 : 'Real32';
REAL64 : 'Real64';
REAL128 : 'Real128';
REAL : 'Real';
BIGREAL : 'Bigreal';

// NUMERIC DECIMALS

DEC1 : 'Dec1';
DEC2 : 'Dec2';
DEC3 : 'Dec3';
DEC4 : 'Dec4';
DEC5 : 'Dec5';
DEC6 : 'Dec6';
DEC7 : 'Dec7';
DEC8 : 'Dec8';
DECIMAL : 'Decimal';
MONEY : 'Money';
BIGDECIMAL : 'Bigdecimal';

// NUMERIC RATIOS

RATIO8 : 'Ratio8';
RATIO16 : 'Ratio16';
RATIO32 : 'Ratio32';
RATIO64 : 'Ratio64';
RATIO128 : 'Ratio128';
RATIO : 'Ratio';

// NUMERIC COMPLEXES

COMPLEX16 : 'Complex16';
COMPLEX32 : 'Complex32';
COMPLEX64 : 'Complex64';
COMPLEX128 : 'Complex128';
COMPLEX : 'Complex';

// NUMERIC QUATERNIONS

QUATERN16 : 'Quatern16'; 
QUATERN32 : 'Quatern32';
QUATERN64 : 'Quatern64';
QUATERN128 : 'Quatern128';
QUATERN : 'Quatern';

// TEMPORAL DATA TYPES

DATE : 'Date';
ELAPSE : 'Elapse';

// CHARACTER DATA TYPES

ASCII : 'Ascii';
CHAR8 : 'Char8';
CHAR16 : 'Char16';
CHAR32 : 'Char32';
CHAR : 'Char';
WCHAR : 'wchar';

// SEQUENCE DATA TYPES

ANSI : 'Ansi';
STR8 : 'Str8';
STR16 : 'Str16';
STR32 : 'Str32';
STR : 'Str';
REGEX : 'Regex';
BINARY : 'Binary';

// SHELL DATA TYPES

PATH : 'Path';
URI : 'Uri';
INET : 'Inet';

// COMPOSITE DATA TYPES

RANGE : 'Range';
MAP : 'Map';

// ARRAY DATA TYPES

ARRAY : 'Array';
TUPLE : 'Tuple';
LIST  : 'List';
DICT  : 'Dict';
CHAN  : 'Chan';
VEC   : 'Vec';
MAT   : 'Mat';
TSET  : 'Set';
QUEUE : 'Queue';
DEQUE : 'Deque';
XML   : 'Xml';
TABLE : 'Table';
MEMO  : 'Memo';

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
CHARDEVICE : 'CharDevice';
NULLDEVICE : 'NullDevice';

// MONAD URI VALUE CONSTRUCTORS

URL : 'Url';
URN : 'Urn';

// MONAD INET VALUE CONSTRUCTORS

IPV4 : 'Ipv4';
IPV6 : 'Ipv6';

// MONAD RESULT ! VALUE CONSTRUCTORS

OKAY : 'Okay';
FAIL : 'Fail';

// MONAD MAYBE ? VALUE CONSTRUCTORS

SOME : 'Some';
NONE : 'None';

// MONAD EITHER ?? VALUE CONSTRUCTORS

YEA : 'Yea';
NAY : 'Nay';

// MONAD STREAM |> VALUE CONSTRUCTORS

DATA : 'Data';
EOT : 'EoT';

// -------------------------------------------------------------------------

// BUILT-IN CONSOLE MACROS

AT    : 'at';
SCAN  : 'scan';
ECHO  : 'echo';
ALERT : 'alert';
ENTRY : 'entry';
TILL  : 'till';
SINCE : 'since';
TIMELY : 'timely';
CANCEL : 'cancel';
PLAY  : 'play';
CLS   : 'cls';

// BUILT-IN SHELL MACROS

CD : 'cd';
PWD : 'pwd';
LS : 'ls';
MKDIR : 'mkdir';
RMDIR : 'rmdir';
TOUCH : 'touch';
RM : 'rm';
CP : 'cp';
MV : 'mv';
RENAME : 'rename';
CHMOD : 'chmod';
CHOWN : 'chown';
CHGRP : 'chgrp';

// BUILT-IN ERROR-HANDLING MACROS

RAISE : 'raise';
PANIC : 'panic';

// MAGIC COMMENT: TEST

UNIT : 'unit';
FROM : 'from';
ONCE : 'once';
TDATA : 'data';
CALL : 'call';
HIDE : 'hide';
SHOW : 'show';
INTO : 'into';
PASS : 'pass';
PAST : 'past';
TFAIL : 'fail';

// MAGIC STATEMENT: TRACING

TRACE : 'trace';
DEBUG : 'debug';
INFO  : 'info';
WARN  : 'warn';
ERROR : 'error';
FATAL : 'fatal';
