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
APPLET : 'applet';
NOTABENE : 'notabene';

// ENVIRONMENT DIVISION

USE : 'use';
AS : 'as';
OF : 'of';
INCLUDE : 'include';
INTERFACE : 'interface';
EXTERN : 'extern';
RPROC : 'rproc';
FOREIGN : 'foreign';

// TOP LEVEL SENTENCES

CONST : 'const';
VAL : 'val';
VAR : 'var';
TYPE : 'type';
DIM : 'dim';
FACT : 'fact';
OPERATOR : 'operator';
ENUM : 'enum';
FUNC : 'func';
FEED : 'feed';
FMAP : 'fmap';
SUB : 'sub';
STRUCT : 'struct';
PROTO : 'proto';
TRAIT : 'trait';
CLASS : 'class';
OBJECT : 'object';
GETTER : 'getter';
SETTER : 'setter';
EVENT : 'event';
DEF : 'def';
DEFN : 'defn';
UNDEF : 'undef';

// ACCESS SPECIFIERS

PUBLIC : 'public';
PROTECTED : 'protected';
PRIVATE : 'private';

// DECLARATION SPECIFIERS

LAMBDA : 'lambda';
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
OFF : 'off';
ASYNC : 'async';
ABSTRACT : 'abstract';
SEALED : 'sealed';
SINGLETON : 'singleton';
RECORD : 'record';
MONAD : 'monad';
MEASURE : 'measure';
INFIX : 'infix';
EXPLICIT : 'explicit';

// STATEMENTS AND BLOCKS

DEFER : 'defer';
WITH : 'with';
DO : 'do';
IF : 'if';
THEN : 'then';
ELIF : 'elif';
ELSE : 'else';
UNLESS : 'unless';
OTHERWISE : 'otherwise';
MATCH : 'match';
CASE : 'case';
FALLTHROUGH : 'fallthrough';
TRY : 'try';
CATCH : 'catch';
LOOP : 'loop';
FOR : 'for';
EACH : 'each';
STEP : 'step';
WHILE : 'while';
UNTIL : 'until';
UPTO : 'upto';
UPON : 'upon';
REDO : 'redo';
NEXT : 'next';
BREAK : 'break';
RETURN : 'return';
YIELD : 'yield';
GO : 'go';
TO : 'to';
AWAIT : 'await';
SWITCH : 'switch';
WHEN : 'when';
DEFAULT : 'default';
CONTINUE : 'continue';
BEGIN : 'begin';
FINALLY : 'finally';
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
GET : 'get';
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

// NUMERIC DIGITS

DIG : 'dig';
BIT : 'bit';
OCT : 'oct';
HEX : 'hex';
ROMAN : 'roman';
NIBBLE : 'nibble';
BYTE : 'byte';
NUMBER : 'number';

// NATURAL NUMBERS

NAT8 : 'nat8';
NAT16 : 'nat16';
NAT32 : 'nat32';
NAT64 : 'nat64';
NAT128 : 'nat128';
NAT : 'nat';
BIGNAT : 'bignat';

// NUMERIC INTEGERS

INT8 : 'int8';
INT16 : 'int16';
INT32 : 'int32';
INT64 : 'int64';
INT128 : 'int128';
INT : 'int';
BIGINT : 'bigint';

// NUMERIC REALS

REAL16 : 'real16';
REAL32 : 'real32';
REAL64 : 'real64';
REAL128 : 'real128';
REAL : 'real';
BIGREAL : 'bigreal';

// NUMERIC DECIMALS

DECIMAL32 : 'decimal32';
DECIMAL64 : 'decimal64';
DECIMAL128 : 'decimal128';
DECIMAL  : 'decimal';
MONEY    : 'money';
BIGDECIMAL : 'bigdecimal';

// NUMERIC RATIOS

RATIO8 : 'ratio8';
RATIO16 : 'ratio16';
RATIO32 : 'ratio32';
RATIO64 : 'ratio64';
RATIO128 : 'ratio128';
RATIO : 'ratio';

// NUMERIC COMPLEXES

COMPLEX16 : 'complex16';
COMPLEX32 : 'complex32';
COMPLEX64 : 'complex64';
COMPLEX128 : 'complex128';
COMPLEX : 'complex';

// NUMERIC QUATERNIONS

QUATERN16 : 'quatern16'; 
QUATERN32 : 'quatern32';
QUATERN64 : 'quatern64';
QUATERN128 : 'quatern128';
QUATERN : 'quatern';

// TEMPORAL DATA TYPES

DATE : 'date';
ELAPSE : 'elapse';

// CHARACTER DATA TYPES

ASCII : 'ascii';
CHAR8 : 'char8';
CHAR16 : 'char16';
CHAR32 : 'char32';
CHAR : 'char';
WCHAR : 'wchar';

// SEQUENCE DATA TYPES

ANSI : 'ansi';
STR8 : 'str8';
STR16 : 'str16';
STR32 : 'str32';
STR : 'str';
CSTR : 'cstr';
WSTR : 'wstr';
REGEX : 'regex';
BINARY : 'binary';

// SHELL DATA TYPES

PATH : 'path';
URI : 'uri';
INET : 'inet';

// COMPOSITE DATA TYPES

RANGE : 'range';
PAIR : 'pair';
TUPLE : 'tuple';

// ARRAY DATA TYPES

ARRAY : 'array';
LIST  : 'list';
DICT  : 'dict';
CHAN  : 'chan';
VEC   : 'vec';
MAT   : 'mat';
SET   : 'set';
QUEUE : 'queue';
DEQUE : 'deque';
XML   : 'xml';
TABLE : 'table';
MEMO  : 'memo';

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

OKAY : 'Okay';
FAIL : 'Fail';

// MONAD MAYBE ? VALUE CONSTRUCTORS

SOME : 'Some';
NONE : 'None';

// MONAD EITHER ?? VALUE CONSTRUCTORS

YEA : 'Yea';
NAY : 'Nay';

// MONAD STREAM |> VALUE CONSTRUCTORS

DATUM : 'Datum';
EOT   : 'EoT';

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
DATA : 'data';
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
