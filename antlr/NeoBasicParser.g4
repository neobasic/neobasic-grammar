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

parser grammar NeoBasicParser;

// Insert here @header.

options {
    tokenVocab = NeoBasicLexer;
//     superClass = NeoBasicParserBase;
}


// --- SOURCE CODE ORGANIZATION OF NEOBASIC PROGRAM -----------------

neoBasic : oneLinerProgram
         | sourceCodeProgram
         ;

oneLinerProgram : instructionSentence;

sourceCodeProgram : (instructionSentence EOS)+;

instructionSentence : directive
                    | declaration
                    | statement
                    ;
// access specifiers as 'labeled suite' enters here.

// --- INSTRUCTION SENTENCE: DIRECTIVE ------------------------------

directive : interpreterDirective
          | pragmaDirective
          | canaryTestingDirective
          ; 

// Interpreter directive

interpreterDirective : SHEBANG expression expression; 

// Pragma directive

pragmaDirective : SHEBANG IDENTIFIER expressions?;

// Canary-testing directive

canaryTestingDirective : WOODSTOCK expression (EXCLAMATION | EXCLAMATION expression)?;


// --- INSTRUCTION SENTENCE: DECLARATION ----------------------------

declaration : accessSpecifier declaration
            | constSentence
            | ivalSentence
            | varSentence
            ;

accessSpecifier : PUBLIC
                | PROTECTED
                | PRIVATE
                ;

// Constant declaration

constSentence : constSpecifier* constClause;

constSpecifier : COMPTIME
               | INLINE
               ;

constClause : CONST constDeclare;

constDeclare : constDeclareSingle
             | constDeclareMultiple
             | constDeclareParallel
             ;

constDeclareSingle : symbolIdentifier type? singleAssignmentOperator expression;

constDeclareMultiple : constDeclareSingle (COMMA constDeclareSingle)+;

constDeclareParallel : symbolIdentifiers multipleAssignmentOperator expressions;

// Immutable Value declaration

ivalSentence : ivalSpecifier* ivalClause;

ivalSpecifier : COMPTIME
              | STATIC
              | LINEAR
              | INLINE
              ;

ivalClause : IVAL ivalDeclare;

ivalDeclare : ivalDeclareSingle
            | ivalDeclareMultiple
            | ivalDeclareParallel
            ;

ivalDeclareSingle : symbolIdentifier type? (singleAssignmentOperator expression)?;

ivalDeclareMultiple : ivalDeclareSingle (COMMA ivalDeclareSingle)+;

ivalDeclareParallel : symbolIdentifiers singleAssignmentOperator expressions;

// Variable declaration

varSentence : varSpecifier* varClause;

varSpecifier : COMPTIME
             | STATIC
             | VOLATILE
             | SHARED
             | LOCAL
             | ATOMIC
             | LINEAR
             | INLINE
             ;

varClause : VAR varDeclare;

varDeclare : varDeclareSingle
           | varDeclareMultiple
           | varDeclareParallel
           ;

varDeclareSingle : symbolIdentifier type? (singleAssignmentOperator expression)?;

varDeclareMultiple : varDeclareSingle (COMMA varDeclareSingle)+;

varDeclareParallel : symbolIdentifiers singleAssignmentOperator expressions;


// --- INSTRUCTION SENTENCE: STATEMENT ------------------------------

statement : labelIdentifier COLON
          | labelIdentifier COLON statement
          | RUBBERDUCK statement
          | SONGBIRD statement
          | simpleStatement 
          | compoundStatement
          ;

// Simple statements

simpleStatement : emptyStatement
                | expressionStatement
                | assignmentStatement
                | consoleStatement
                ;

emptyStatement : ELLIPSIS;

expressionStatement : expressions;

// Assignment statements

assignmentStatement : assignmentSingle
                    | assignmentMultiple
                    | assignmentParallel
                    ;

assignmentSingle : primaryExpression singleAssignmentOperator expression;

assignmentMultiple : assignmentSingle (COMMA assignmentSingle)+;

assignmentParallel : primaryExpressions multipleAssignmentOperator expressions;

// Console statements

consoleStatement : echoCommand
                 | scanCommand
                 ;

echoCommand : ECHO expression? COMMA?;

scanCommand : SCAN escalarType? expression? COMMA?;

// Compound statements

compoundStatement : controlFlowStatement
                  | conditionalStatement
                  ;

controlFlowStatement : otherwiseSentence;

conditionalStatement : ifStatement
                     | unlessStatement
                     ;

// Control flow statement otherwise

otherwiseSentence : simpleStatement OTHERWISE statement;

// Conditional statement if

ifStatement : ifThenClause;

ifThenClause : IF expression THEN simpleStatement;

// Conditional statement unless

unlessStatement : unlessClause;

unlessClause : simpleStatement UNLESS expression;


// --- UNARY OPERATORS ----------------------------------------------

prefixUnaryOperator : unaryArithmeticOperator
                    | unaryLogicalOperator
                    | unarySpreadOperator
                    | unarySortOperator
                    | unaryMetaOperator
                    ;

posfixUnaryOperator : unarySortOperator
                    | unaryCloneOperator
                    ;

// Arithmetic Operators (Prefix Notation)

unaryArithmeticOperator : PLUS
                        | MINUS
                        | INCREMENT
                        | DECREMENT
                        | CARET
                        | SQUARE_ROOT
                        | FACTORIAL
                        ;

//  Bitwise and Logical Operators

unaryLogicalOperator : NOT;

// Miscellaneous operators

unarySpreadOperator : ELLIPSIS;

unarySortOperator : SORTING    // Sort ascending or descending a data structure
                  ;

unaryCloneOperator : EQUAL         // Shallow copy
                   | DEEP_CLONING  // Deepp copy
                   ;

unaryMetaOperator : TYPEOF
                  | SIZEOF
                  ;

// --- BINARY OPERATORS ---------------------------------------------

// Arithmetic Operators (Infix Notation)

binaryExponentialOperator : CARET
                          | SQUARE_ROOT
                          ;

binaryMultiplicativeOperator : ASTERISK
                             | SLASH
                             | DIVISION
                             | QUOTIENT
                             | PERCENT
                             | PERCENTAGE_RATE
                             | PERCENTAGE_AMOUNT
                             | PERCENTAGE_INCREASE
                             | PERCENTAGE_DECREASE
                             | PERCENTAGE_VARIATION
                             ;

binaryAdditiveOperator : PLUS
                       | MINUS
                       ;

// Bitwise Operators (Non-Strict Evaluation = Short-circuit Evaluation)
// shl  <<  shift left 
// shr  >>  signed shift right
// ushr >>> unsigned shift right

bitShiftOperator : DOUBLE_LEFT_ANGLE
                 | DOUBLE_RIGHT_ANGLE
                 | UNSIGNED_RIGHT_SHIFT
                 ;

// Comparison Operators

binaryComparisonOperator : ELVIS_TEST
                         | THREE_WAY_TEST
                         ;

// Relational Operators

binaryRelationalOperator : STRICT_EQUALITY
                         | STRICT_INEQUALITY
                         | LOOSE_EQUALITY
                         | LOOSE_INEQUALITY
                         | LEFT_ANGLE
                         | LESS_OR_EQUALS
                         | RIGHT_ANGLE
                         | GREATER_OR_EQUALS
                         ;

// Conditional operators

binaryConditionalOperator : IS
                          | IS NOT
                          | IN
                          | NOT IN
                          | BETWEEN
                          | NOT BETWEEN
                          | LIKE
                          | NOT LIKE
                          | DIVISIBLE_BY
                          | NOT_DIVISIBLE_BY
                          ;

// Logical Operators (Non-Strict Evaluation = Short-circuit Evaluation)

binaryConjunctionOperator : AND
                          | ANDN
                          | NAND
                          ;

binaryExclusiveDisjunctionOperator : XOR
                                   | NXOR
                                   ;

binaryDisjunctionOperator : OR
                          | NOR
                          ;

// Coalescing Operators

binaryCoalescingOperator : EXCLAMATION
                         | DOUBLE_EXCLAMATION
                         | ERROR_PROPAGATION_NONE_COALESCING
                         | QUESTION
                         | DOUBLE_QUESTION
                         ; 


// --- ASSIGNMENT OPERATORS -----------------------------------------

assignmentOperator : singleAssignmentOperator
                   | multipleAssignmentOperator
                   | compoundAssignmentOperator
                   ;

singleAssignmentOperator : EQUAL
                         | DERIVED_ASSIGNMENT
                         | POP_ONE_ASSIGNMENT
                         | PULL_ALL_ASSIGNMENT
                         | PIPE_ASSIGNMENT
                         ;

multipleAssignmentOperator : EQUAL
                           ;

compoundAssignmentOperator : ADDITION_ASSIGNMENT
                           | SUBTRACTION_ASSIGNMENT
                           | MULTIPLICATION_ASSIGNMENT
                           | REAL_DIVISION_ASSIGNMENT
                           | INTEGER_DIVISION_ASSIGNMENT
                           | MODULO_ASSIGNMENT
                           | NTH_POWER_ASSIGNMENT
                           | NTH_ROOT_ASSIGNMENT
                           | PERCENTAGE_RATE_ASSIGNMENT
                           | PERCENTAGE_AMOUNT_ASSIGNMENT
                           | PERCENTAGE_INCREASE_ASSIGNMENT
                           | PERCENTAGE_DECREASE_ASSIGNMENT
                           | PERCENTAGE_VARIATION_ASSIGNMENT
                           | LEFT_SHIFT_ASSIGNMENT
                           | SIGNED_RIGHT_SHIFT_ASSIGNMENT
                           | UNSIGNED_RIGHT_SHIFT_ASSIGNMENT
                           | NONE_COALESCING_ASSIGNMENT
                           ;


// --- IDENTIFIERS --------------------------------------------------

// Single identifiers

labelIdentifier : TAG;

symbolIdentifier : IDENTIFIER;

qualifiedIdentifier : IDENTIFIER (DOT IDENTIFIER)*;

// Identifiers list

identifiers : IDENTIFIER (COMMA IDENTIFIER)*;

symbolIdentifiers : symbolIdentifier (COMMA symbolIdentifier)*;

qualifiedIdentifiers : qualifiedIdentifier (COMMA qualifiedIdentifier)*;


// --- DATA TYPES ---------------------------------------------------

type : nativeType
     | nativeType posfixTypeWrapper
     | nativeType AMPERSAND nativeType
     | nativeType PIPE type
     | nativeType
     ;

nativeType : escalarType
           | compositeType
           | metaType
           ;

posfixTypeWrapper : EXCLAMATION                    // ResultOption wrapper declaration
                  | QUESTION                       // MaybeOption  wrapper declaration
                  | QUESTION QUESTION              // EitherOption wrapper declaration
                  | PIPE RIGHT_ANGLE               // StreamOption warpper declaration
                  | EXCLAMATION QUESTION           // ResultOption wrapper of MaybeOption wrapper declaration
                  | EXCLAMATION QUESTION QUESTION  // ResultOption wrapper of EitherOption wrapper declaration
                  | EXCLAMATION PIPE RIGHT_ANGLE   // ResultOption wrapper of StreamOption warpper declaration
                  ;

// Escalar data types

escalarType : booleanType
            | numericType
            | temporalType 
            | characterType
            | sequenceType 
            ;

booleanType : BOOL8
            | BOOL16
            | BOOL32
            | BOOL64
            | BOOL128
            | BOOL
            ;

numericType : numericDigit
            | numericNatural
            | numericInteger
            | numericReal
            | numericDecimal
            | numericRatio
            | numericComplex
            | numericQuaternion
            | NUMBER
            ;

numericDigit : DIG
             | BIT
             | OCT
             | HEX
             | NIBBLE
             ;

numericNatural : NAT8
               | NAT16
               | NAT32
               | NAT64
               | NAT128
               | BYTE
               | NAT
               | BIGNAT
               ;

numericInteger : INT8
               | INT16
               | INT32
               | INT64
               | INT128
               | INT
               | BIGINT
               ;

numericReal : REAL8
            | REAL16
            | REAL32
            | REAL64
            | REAL128
            | REAL
            | BIGREAL
            ;

numericRatio : RATIO8
             | RATIO16
             | RATIO32
             | RATIO64
             | RATIO128
             | RATIO
             ;

numericDecimal : DECIMAL32
               | DECIMAL64
               | DECIMAL128
               | DECIMAL
               | MONEY
               ;

numericComplex : COMPLEX32
               | COMPLEX64
               | COMPLEX128
               | COMPLEX
               ;

numericQuaternion : QUATERN32
                  | QUATERN64
                  | QUATERN128
                  | QUATERN
                  ;

temporalType : DATE
             | ELAPSE
             ;

characterType : ASCII
              | CHAR8
              | CHAR16
              | CHAR32
              | CHAR
              | WCHAR
              ;

sequenceType : ANSI
             | STR8
             | STR16
             | STR32
             | STR
             | CSTR
             | WSTR
             | REGEX
             | BINARY
             ;

// Composite data types

compositeType : RANGE | PAIR | TUPLE;

// Meta data types

metaType : ATOM
         | AUTO
         | SPAN
         | VIEW
         | VOID
         ;


// LITERALS ---------------------------------------------------------

literal : escalarLiteral
        | optionLiteral
        ;

predeclaredValue : THIS
                 | IOTA;

// Escalar literals

escalarLiteral : booleanLiteral
               | numericLiteral
               | elapseLiteral
               | dateLiteral
               | characterLiteral
               | sequenceLiteral
               ;

booleanLiteral : TRUE
               | FALSE
               ;

// Numeric literals

numericLiteral : NATURAL_LIT
               | INTEGER_LIT
               | DEC_LIT
               | REAL_LIT
               | RATIO_LIT
               | IMAGINARY_LIT
               | NONZERO parenthesizedExpression
               | ZERO
               | MINVALUE
               | MAXVALUE
               | NAN
               | POSITIVEINFINITY
               | NEGATIVEINFINITY
               ;

// Temporal literals

elapseLiteral : ATOM_DOT_LIT
              | ELAPSE_LIT
              ;  

dateLiteral : ATOM_DOT_LIT
            | LOCALDATE parenthesizedExpression?
            | LOCALDATETIME parenthesizedExpression?
            | OFFSETDATE parenthesizedExpression?
            | OFFSETDATETIME parenthesizedExpression?
            | ZONEDDATE parenthesizedExpression?
            | ZONEDDATETIME parenthesizedExpression?
            | TOMORROW
            | TODAY
            | NOW
            | YESTERDAY
            | EON
            | EPOCH
            ;

// Character literal

characterLiteral : ASCII_LIT
                 | WCHAR_LIT
                 | CHAR_LIT
                 | LETTER parenthesizedExpression
                 | DIGIT parenthesizedExpression
                 | PUNCTUATION parenthesizedExpression
                 | SYMBOL parenthesizedExpression
                 | SEPARATOR parenthesizedExpression
                 | NONPRINTABLE parenthesizedExpression
                 | NULL
                 ;

// Sequence literals

sequenceLiteral : HEREDOC_LITERAL
                | REGULAR_EXPRESSION_LIT
                | WSTRING_LIT
                | STRING_LIT
                | ATOM_DOT_LIT
                | BINARY_LIT
                | NONBLANK parenthesizedExpression
                | BLANK
                ;

// Wrappers data types

optionLiteral : resultLiteral
              | maybeLiteral
              | eitherLiteral
              | streamLiteral
              ;

resultLiteral : OKAY parenthesizedExpression
              | FAIL parenthesizedExpression
              ;

maybeLiteral : SOME parenthesizedExpression
             | NONE
             ;

eitherLiteral : YEA parenthesizedExpression
              | NAY parenthesizedExpression
              ;

streamLiteral : DATUM parenthesizedExpression
              | EOT
              ;


// --- EXPRESSION ---------------------------------------------------

expressions : expression (COMMA expression)*;

primaryExpressions : primaryExpression (COMMA primaryExpression)*;

primaryExpression : operand
                  | parenthesizedExpression
                  | primaryExpression LEFT_BRACKET expressions RIGHT_BRACKET
                  | primaryExpression LEFT_BRACKET slicingRange RIGHT_BRACKET
                  | primaryExpression DOT primaryExpression
                  | primaryExpression LEFT_PARENTHESIS expressions RIGHT_PARENTHESIS
                  | primaryExpression SEMICOLON primaryExpression
                  | primaryExpression posfixUnaryOperator
                  | prefixUnaryOperator primaryExpression
                  | qualifiedIdentifier expression
                  | factScope FUNCTOR qualifiedIdentifier expressions
                  ;

operand : literal
        | predeclaredValue
        | qualifiedIdentifier
        ;

parenthesizedExpression : LEFT_PARENTHESIS expression RIGHT_PARENTHESIS;

slicingRange : intervalExpression
             | sliceExpression
             ;

intervalExpression : expression INTERVAL expression
                   | INTERVAL_RIGHT expression
                   | expression INTERVAL_LEFT
                   | intervalExpression INTERVAL_INCLUSIVE expression
                   ;

sliceExpression : expression COLON expression
                | COLON expression
                | expression COLON
                | sliceExpression COLON expression
                ;

factScope : ALL
          | ANY
          | LOT
          | NIL
          | ONE
          | TWO
          ;

expression : primaryExpression
           | expression binaryExponentialOperator expression
           | expression binaryMultiplicativeOperator expression
           | expression binaryAdditiveOperator expression
           | expression bitShiftOperator expression
           | expression binaryComparisonOperator expression
           | expression binaryRelationalOperator expression
           | expression binaryConditionalOperator expression
           | expression binaryConjunctionOperator expression
           | expression binaryExclusiveDisjunctionOperator expression
           | expression binaryDisjunctionOperator expression
           | expression binaryCoalescingOperator expression?
           | assignmentExpression
           | condicionalExpression
           | macroExpression
           | sos_Expression
           ;

sos_Expression : LEFT_PARENTHESIS statement RIGHT_PARENTHESIS;

assignmentExpression : primaryExpression assignmentOperator expression;

condicionalExpression : guardsExpression;

guardsExpression : guardClause+ guardDefault?;

guardClause : PIPE expression COLON expression;

guardDefault : PIPE expression;

macroExpression : macroCall+;

macroCall : qualifiedIdentifier expression*;

// Special Tokens

loggingLevel : TRACE | DEBUG | INFO | WARN | ERROR | FATAL;
