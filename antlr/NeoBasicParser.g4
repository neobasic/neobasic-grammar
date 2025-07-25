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
    superClass = NeoBasicParserBase;
}


// --- SOURCE CODE ORGANIZATION OF NEO PROGRAM ----------------------

neoProgram : oneLinerProgram
           | scriptFileProgram;

oneLinerProgram : instructionSentence;

scriptFileProgram : BOM? (instructionSentence EOS)*;

instructionSentence : directive 
                    | declaration
                    | statement
                    ;


// --- INSTRUCTION SENTENCE: DIRECTIVE ------------------------------

directive : shebangDirective
          | pragmaDirective
          | canaryTestDirective
          ; 

// Shebang directive

shebangDirective : SHEBANG_LINE;

// Pragma directive

pragmaDirective : SHEBANG IDENTIFIER expressions?; 

// Canary testing directive

canaryTestDirective : WOODSTOCK expression (EXCLAMATION expression)?;


// --- INSTRUCTION SENTENCE: DECLARATION ----------------------------

declaration : constDeclaration
            | valDeclaration
            | varDeclaration
            ;

// Constant declaration

constDeclaration : constClause;

constClause : CONST constants;

constants : constant (COMMA constant)*;

constant : symbolIdentifiers singleAssignmentOperator expressions;

// Value declaration

valDeclaration : valClause;

valClause : VAL variables;

// Variable declaration

varDeclaration : varClause;

varClause : VAR variables;

variables : variable (COMMA variable)*;

variable : symbolIdentifiers type? (singleAssignmentOperator expressions)?;


// --- INSTRUCTION SENTENCE: STATEMENT ------------------------------

statement : labeledStatement
          | debugingStatement
          | loggingStatement
          | sExpressionStatement
          | simpleStatement 
          | compoundStatement
          ;

labeledStatement : ATOM_IDENTIFIER statement?;

debugingStatement : RUBBERDUCK statement?;

loggingStatement : TRACERBIRD statement?;

sExpressionStatement : LEFT_PARENTHESIS statement RIGHT_PARENTHESIS;

// Simple statements

simpleStatement : emptyStatement
                | expressionStatement
                | assignmentStatement
                ;

emptyStatement : ELLIPSIS;

expressionStatement : expressions;

assignmentStatement : primaryExpressions assignmentOperator expressions;

// Compound statements

compoundStatement : conditionalStatement;

conditionalStatement : ifStatement
                     | unlessStatement
                     ;

// Conditional statement if

ifStatement : ifThenClause;

ifThenClause : IF expression THEN simpleStatement;

// Conditional statement unless

unlessStatement : unlessClause;

unlessClause : simpleStatement UNLESS expression;


// --- UNARY OPERATORS ----------------------------------------------

prefixUnaryOperator : unaryArithmeticOperator
                    | unaryBitwiseOperator
                    | unaryLogicalOperator
                    | unarySpreadOperator
                    | unarySortOperator
                    | unaryMetaOperator
                    ;

posfixUnaryOperator : unarySortOperator
                    | unaryCloneOperator
                    ;

// Arithmetic Operators (Prefix Notation)

unaryArithmeticOperator : POSITIVE
                        | NEGATIVE
                        | INCREMENT
                        | DECREMENT
                        | SQUARE_POWER
                        | SQUARE_ROOT
                        | FACTORIAL
                        ;

//  Bitwise and Logical Operators

unaryBitwiseOperator : BIT_NOT
                     | BIT_NEGATION
                     ;

unaryLogicalOperator : LOGICAL_NOT;

// Miscellaneous operators

unarySpreadOperator : ELLIPSIS;

unarySortOperator : CARET        // Sort ascending or descending a data structure
                  | CARET CARET  // Sort ascending or descending a var
                  ;

unaryCloneOperator : EQUAL              // Shallow copy
                   | EQUAL EQUAL EQUAL  // Deepp copy
                   ;

unaryMetaOperator : TYPEOF
                  | SIZEOF
                  ;

// --- BINARY OPERATORS ---------------------------------------------

// Arithmetic Operators (Infix Notation)

binaryExponentialOperator : NTH_POWER
                          | NTH_ROOT
                          ;

binaryMultiplicativeOperator : MULTIPLICATION
                             | REAL_DIVISION
                             | INTEGER_DIVISION
                             | MODULO
                             | PERCENTAGE_RATE
                             | PERCENTAGE_AMOUNT
                             | PERCENTAGE_INCREASE
                             | PERCENTAGE_DECREASE
                             | PERCENTAGE_VARIATION
                             ;

binaryAdditiveOperator : ADDITION
                       | SUBTRACTION
                       ;

// Bitwise Operators (Non-Strict Evaluation = Short-circuit Evaluation)

bitShiftOperator : LEFT_SHIFT
                 | SIGNED_RIGHT_SHIFT
                 | UNSIGNED_RIGHT_SHIFT
                 ;

bitConjunctionOperator : BIT_AND
                       | BIT_CLEAR
                       ;

bitExclusiveDisjunctionOperator : BIT_XOR;

bitDisjunctionOperator : BIT_OR;

// Comparison Operators

binaryComparisonOperator : ELVIS_TEST
                         | THREE_WAY_TEST
                         ;

// Relational Operators

binaryRelationalOperator : EQUALS
                         | NOT_EQUALS
                         | LESS
                         | LESS_OR_EQUALS
                         | GREATER
                         | GREATER_OR_EQUALS
                         ;

// Conditional operators

binaryConditionalOperator : IDENTITY
                          | NOT_IDENTITY
                          | MEMBERSHIP
                          | NOT_MEMBERSHIP
                          | BETWEEN_RANGE
                          | NOT_BETWEEN_RANGE
                          | MATCHING
                          | NOT_MATCHING
                          | DIVISIBLE_BY
                          | NOT_DIVISIBLE_BY
                          ;

// Logical Operators (Non-Strict Evaluation = Short-circuit Evaluation)

binaryConjunctionOperator : LOGICAL_AND
                          | LOGICAL_NAND
                          ;

binaryExclusiveDisjunctionOperator : LOGICAL_XOR
                                   | LOGICAL_NXOR
                                   ;

binaryDisjunctionOperator : LOGICAL_OR
                          | LOGICAL_NOR
                          ;

// Coalescing Operators

binaryCoalescingOperator : ERROR_PROPAGATION
                         | ERROR_COALESCING
                         | ERROR_PROPAGATION_NONE_COALESCING
                         | ERROR_TO_NONE_CONVERTION
                         | EXCEPTION_COALESCING
                         | EXCEPTION_STATEMENT
                         ; 


// --- ASSIGNMENT OPERATORS -----------------------------------------

assignmentOperator : singleAssignmentOperator
                   | compoundAssignmentOperator
                   ;

singleAssignmentOperator : BASIC_ASSIGNMENT
                         | DESTRUCTURING_ASSIGNMENT
                         | MACRO_ASSIGNMENT
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
                           | BIT_AND_ASSIGNMENT
                           | BIT_CLEAR_ASSIGNMENT
                           | BIT_XOR_ASSIGNMENT
                           | BIT_OR_ASSIGNMENT
                           | BIT_NOT_ASSIGNMENT
                           | LEFT_SHIFT_ASSIGNMENT
                           | SIGNED_RIGHT_SHIFT_ASSIGNMENT
                           | UNSIGNED_RIGHT_SHIFT_ASSIGNMENT
                           | NONE_COALESCING_ASSIGNMENT
                           ;


// --- IDENTIFIERS --------------------------------------------------

// Single identifier

symbolIdentifier : IDENTIFIER;

qualifiedIdentifier : IDENTIFIER (DOT IDENTIFIER)*;

// Identifiers list

identifiers : IDENTIFIER (COMMA IDENTIFIER)*;

symbolIdentifiers : symbolIdentifier (COMMA symbolIdentifier)* ;

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
             | BYTE
             ;

numericNatural : NAT8
               | NAT16
               | NAT32
               | NAT64
               | NAT128
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

numericDecimal : DEC1
               | DEC2
               | DEC3
               | DEC4
               | DEC5
               | DEC6
               | DEC7
               | DEC8
               | DEC
               | MONEY
               | BIGDEC
               ;

numericRatio : RATIO16
             | RATIO32
             | RATIO64
             | RATIO128
             | RATIO
             ;

numericComplex : COMPLEX16
               | COMPLEX32
               | COMPLEX64
               | COMPLEX128
               | COMPLEX
               ;

numericQuaternion : QUATERN32
                  | QUATERN64
                  | QUATERN128
                  | QUATERN256
                  | QUATERN
                  ;

temporalType : DATE
             | ELAPSE
             ;

characterType : ASCII
              | CHAR
              ;

sequenceType : STRING
             | REGEX
             | BINARY
             ;

// Composite data types

compositeType : RANGE;

// Meta data types

metaType : TANY
         | ATOM
         ;


// --- EXPRESSION ---------------------------------------------------

expressions : expression (COMMA expression)*;

primaryExpressions : primaryExpression (COMMA primaryExpression)*;

expression : primaryExpression
           | prefixUnaryOperator expression 
           | expression posfixUnaryOperator
           | expression binaryExponentialOperator expression
           | expression binaryMultiplicativeOperator expression
           | expression binaryAdditiveOperator expression
           | expression bitShiftOperator expression
           | expression bitConjunctionOperator expression
           | expression bitExclusiveDisjunctionOperator expression
           | expression bitDisjunctionOperator expression
           | expression binaryComparisonOperator expression
           | expression binaryRelationalOperator expression
           | expression binaryConditionalOperator expression
           | expression binaryConjunctionOperator expression
           | expression binaryExclusiveDisjunctionOperator expression
           | expression binaryDisjunctionOperator expression
           | expression binaryCoalescingOperator expression?
           | assignmentExpression
           | condicionalExpression
           ;

primaryExpression
    : operand
    | primaryExpression converter
    | primaryExpression selector
    | primaryExpression indexing
    | primaryExpression slicing
    | primaryExpression arguments
    ;

operand : literal
        | predeclaredValue
        | qualifiedIdentifier
        | qualifiedIdentifier expression
        | factScope BACKTICK qualifiedIdentifier expressions
        | LEFT_PARENTHESIS expressions RIGHT_PARENTHESIS
        ;

factScope : ALL
          | ANY
          | ONE
          | TWO
          | NIL
          ;

converter : SEMICOLON qualifiedIdentifier;

selector : DOT IDENTIFIER;

indexing : LEFT_BRACKET expressions RIGHT_BRACKET;

slicing : LEFT_BRACKET slicingRange RIGHT_BRACKET;

slicingRange : expression? INTERVAL expression?
             | expression? INTERVAL expression COMMA expression;

arguments : LEFT_PARENTHESIS expressions RIGHT_PARENTHESIS;

assignmentExpression : primaryExpression assignmentOperator expression;

condicionalExpression : guardsExpression;

guardsExpression : guardClause+ guardDefault?;

guardClause : PIPE expression IMPLICIT_RETURN expression;

guardDefault : PIPE expression;


// LITERALS ---------------------------------------------------------

literal : escalarLiteral
        | compositeLiteral
        | optionLiteral
        ;

predeclaredValue : THIS
                 | IOTA;

valueConstruct : LEFT_PARENTHESIS expression RIGHT_PARENTHESIS;

// Escalar literals

escalarLiteral : booleanLiteral
               | numericLiteral
               | temporalLiteral
               | characterLiteral
               | sequenceLiteral
               ;

booleanLiteral : TRUE
               | FALSE
               ;

numericLiteral : NUMBER_LIT
               | NONZERO valueConstruct
               | ZERO
               | MINVALUE
               | MAXVALUE
               | NAN
               | POSITIVEINFINITY
               | NEGATIVEINFINITY
               ;

temporalLiteral : TIME_LIT
                | LOCALDATE valueConstruct?
                | LOCALDATETIME valueConstruct?
                | OFFSETDATE valueConstruct?
                | OFFSETDATETIME valueConstruct?
                | ZONEDDATE valueConstruct?
                | ZONEDDATETIME valueConstruct?
                | TOMORROW
                | TODAY
                | NOW
                | YESTERDAY
                | EON
                | EPOCH
                ;

characterLiteral : CHAR_LIT
                 | LETTER valueConstruct
                 | DIGIT valueConstruct
                 | PUNCTUATION valueConstruct
                 | SYMBOL valueConstruct
                 | SEPARATOR valueConstruct
                 | OTHER valueConstruct
                 | NONPRINTABLE valueConstruct
                 | NULL
                 ;

sequenceLiteral : HEREDOC_LITERAL
                | SEQUENCE_LIT
                | NONBLANK valueConstruct
                | BLANK
                ;

// Composite literals

compositeLiteral : RANGE_LIT;

// Wrappers data types

optionLiteral : resultLiteral
              | maybeLiteral
              | eitherLiteral
              | streamLiteral
              ;

resultLiteral : OKAY valueConstruct
              | FAIL valueConstruct
              ;

maybeLiteral : SOME valueConstruct
             | NONE
             ;

eitherLiteral : YEA valueConstruct
              | NAY valueConstruct
              ;

streamLiteral : DATA valueConstruct
              | EOT
              ;
