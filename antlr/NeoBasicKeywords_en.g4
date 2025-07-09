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

lexer grammar NeoBasicKeywords_en;

// MAGIC COMMENT: TWEET TRACING

TRACE : 'trace';
DEBUG : 'debug';
INFO  : 'info';
WARN  : 'warn';
ERROR : 'error';
FATAL : 'fatal';

// TOP LEVEL SENTENCES

CONST : 'const';
VAL : 'val';
VAR : 'var';

// CONSOLE COMMANDS

ENTER : 'enter';
PRINT : 'print';
TILL  : 'till';
SINCE : 'since';
PLAY  : 'play';
CLS   : 'cls';

// STATEMENTS AND BLOCKS

DO : 'do';
IF : 'if';
UNLESS : 'unless';
ORELSE : 'orelse';
RAISE : 'raise';

// PREDECLARED VALUES AND VARIABLES

THIS : 'this';
IOTA : 'iota';

// OPERATORS

TYPEOF : 'typeof';
INSTANCEOF : 'instanceof';
IS : 'is';
BYTEOF : 'byteof';
SIZEOF : 'sizeof';
BETWEEN : 'between';
LIKE : 'like';
NOT : 'not';
AND : 'and';
OR : 'or';
XOR : 'xor';
NAND : 'nand';
NOR : 'nor';
NXOR : 'nxor';

// MISCELLANEOUS DATA TYPES

NUMBER_TYPE : 'Number';
ANY_TYPE : 'Any';
ATOM_TYPE : 'Atom';

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
NIBBLE : 'Nibble';

// NATURAL NUMBERS

NAT8 : 'Nat8';
NAT16 : 'Nat16';
NAT32 : 'Nat32';
NAT64 : 'Nat64';
NAT128 : 'Nat128';
BYTE : 'Byte';
NAT : 'Nat';
ASCII : 'Ascii';
CHAR : 'Char';

// NUMERIC INTEGERS

INT8 : 'Int8';
INT16 : 'Int16';
INT32 : 'Int32';
INT64 : 'Int64';
INT128 : 'Int128';
INT : 'Int';
BIGINT : 'Bigint';

// NUMERIC DECIMALS

DEC1 : 'Dec1';
DEC2 : 'Dec2';
DEC3 : 'Dec3';
DEC4 : 'Dec4';
DEC5 : 'Dec5';
DEC6 : 'Dec6';
DEC7 : 'Dec7';
DEC8 : 'Dec8';
DEC : 'Dec';
MONEY : 'Money';
BIGDEC : 'Bigdec';

// NUMERIC REALS

REAL8 : 'Real8';
REAL16 : 'Real16';
REAL32 : 'Real32';
REAL64 : 'Real64';
REAL128 : 'Real128';
REAL : 'Real';
BIGREAL : 'Bigreal';

// NUMERIC RATIOS

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

QUATERN32 : 'Quatern32';
QUATERN64 : 'Quatern64';
QUATERN128 : 'Quatern128';
QUATERN256 : 'Quatern256'; 
QUATERN : 'Quatern';

// TEMPORAL DATA TYPES

DATE : 'Date';
ELAPSE : 'Elapse';

// ELAPSE FRACTIONS

YEAR : 'year';
MONTH : 'month';
DAY : 'day';
WEEK : 'week';
WORKDAY : 'workday';
HOUR : 'hour';
MINUTE : 'minute';
SECOND : 'second';
MILLI : 'milli';
MICRO : 'micro';
NANO : 'nano';
TICK : 'tick';
TZONE : 'tzone';
ZULU : [zZ];

// SEQUENTIAL DATA TYPES

STRING : 'Str';
REGEX : 'Regex';
BINARY : 'Binary';

// COMPOSITE DATA TYPES

RANGE : 'Range';

// MONAD VALUE CONSTRUCTORS

TRUE : 'True';
FALSE : 'False';
NONZERO : 'Nonzero';
ZERO : 'Zero';
MINIMUM : 'Minimum';
MAXIMUM : 'Maximum';
NAN : 'NaN';
POSITIVEINFINITY : 'PositiveInfinity';
NEGATIVEINFINITY : 'NegativeInfinity';
BLANK : 'Blank';
NONBLANK : 'Nonblank';
SOME : 'Some';
NONE : 'None';
OK : 'Ok';
ERR : 'Err';

// -------------------------------------------------------------------------
