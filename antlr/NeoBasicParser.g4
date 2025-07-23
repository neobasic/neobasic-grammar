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

statement : LEFT_PARENTHESIS statement RIGHT_PARENTHESIS
          | labeledStatement
          | debugingStatement
          | loggingStatement
          | emptyStatement
          | expressionStatement
          | ifStatement
          | unlessStatement
          ;

// Simple statements

labeledStatement : ATOM_IDENTIFIER statement?;

debugingStatement : RUBBERDUCK statement?;

loggingStatement : TRACERBIRD statement?;

emptyStatement : ELLIPSIS;

expressionStatement : expressions;

// Conditional statement: if

ifStatement : IfThenClause;

IfThenClause : IF expression THEN statement;

// Conditional statement modifier: unless

unlessStatement : UnlessClause;

UnlessClause : statement UNLESS expression;


// --- UNARY OPERATORS ----------------------------------------------

prefixUnaryOperator : unaryArithmeticOperator
                    | unaryBitwiseOperator
                    | unaryMiscellaneousOperator
                    | unarySpreadOperator
                    | unarySortOperator
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

//  Bitwise Operators

unaryBitwiseOperator : BIT_NOT
                     | BIT_NEGATION
                     ;

// Miscellaneous operators

unaryMiscellaneousOperator : TYPEOF
                           | SIZEOF
                           ;

unarySpreadOperator : ELLIPSIS;

unarySortOperator : CARET        // Sort ascending or descending a data structure
                  | CARET CARET  // Sort ascending or descending a var
                  ;

unaryCloneOperator : EQUAL              // Shallow copy
                   | EQUAL EQUAL EQUAL  // Deepp copy
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

// Relational Operators

binaryRelationalOperator : EQUALS
                         | NOT_EQUALS
                         | LESS
                         | LESS_OR_EQUALS
                         | GREATER
                         | GREATER_OR_EQUALS
                         ;

// Comparison operators

binaryComparisonOperator : IDENTITY
                         | NOT_IDENTITY
                         | MEMBERSHIP
                         | NOT_MEMBERSHIP
                         | BETWEEN_RANGE
                         | NOT_BETWEEN_RANGE
                         | MATCHING
                         | NOT_MATCHING
                         | DIVISIBLE_BY
                         | NOT_DIVISIBLE_BY
                         | ELVIS_TEST
                         | THREE_WAY_TEST
                         ;

// Logical Operators (Non-Strict Evaluation = Short-circuit Evaluation)

boolConjunctionOperator : LOGICAL_AND
                        | LOGICAL_NAND
                        ;

boolExclusiveDisjunctionOperator : LOGICAL_XOR
                                 | LOGICAL_NXOR
                                 ;

boolDisjunctionOperator : LOGICAL_OR
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

symbolIdentifiers : symbolIdentifier (COMMA symbolIdentifier)* ;

symbolIdentifier : IDENTIFIER ;


// --- DATA TYPES ---------------------------------------------------

type : prefixTypeModifier? nativeType
     | nativeType posfixTypeModifier?
     | nativeType PIPE type
     | nativeType AMPERSAND nativeType
     | nativeType
     ;

nativeType : escalarType
           | compositeType
           | miscellaneousType
           ;

posfixTypeModifier : EXCLAMATION                   // ResultOption wrapper declaration
                   | QUESTION                      // MaybeOption wrapper declaration
                   | EXCLAMATION QUESTION          // ResultOption wrapper of MaybeOption wrapper declaration
                   | QUESTION QUESTION             // EitherOption wrapper declaration
                   | PIPE RIGHT_ANGLE              // StreamOption warpper declaration
                   | EXCLAMATION PIPE RIGHT_ANGLE  // StreamOption warpper declaration
                   ;

prefixTypeModifier : ELLIPSIS;  // Variadic parameter declaration

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
            | numericDecimal
            | numericReal
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
               | ASCII
               | CHAR
               ;

numericInteger : INT8
               | INT16
               | INT32
               | INT64
               | INT128
               | INT
               | BIGINT
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

numericReal : REAL8
            | REAL16
            | REAL32
            | REAL64
            | REAL128
            | REAL
            | BIGREAL
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

// Miscellaneous data types

miscellaneousType : TANY
                  | ATOM
                  ;

// --- EXPRESSION ---------------------------------------------------

expressions : expression (COMMA expression)*;

expression : unaryExpression
           | binaryExpression
           | assignmentExpression
           ;

unaryExpression : prefixUnaryOperator primaryExpression 
                | primaryExpression posfixUnaryOperator
                | primaryExpression 
                ;

primaryExpression
    : operand
    | operand SEMICOLON modifier  
    | consoleCmd
    | conversion
    | methodExpression
    | primaryExpression selector
    | primaryExpression indexing
    | primaryExpression slicing
    | primaryExpression functionArguments [ errorHandling ]
    | primaryExpression [ functionArguments ] lambdaLiteral [ errorHandling ]
    ;

Operand : Literal
        | PredeclaredValue
        | OperandName [ GenericTypes ]
        | ShellExpression
        | "(" Expression ")"
        ;








































binaryExpression : expression binaryOperator expression;

assignmentExpression : expressions singleAssignmentOperator expressions ;





factExpression
    : [ factModifier BACKTICK ] Identifier expressions
    | expression IS [NOT] [ factModifier BACKTICK ] Identifier
    ;

factModifier : ALL | ANY | ONE | TWO | NIL ;




eagerEvaluateExpression : unaryEvaluate LEFT_PARENTHESIS expression RIGHT_PARENTHESIS ;





condicionalExpression : guardsExpressions ;

guardsExpressions : PIPE guardExpression { PIPE guardExpression  } [ PIPE expression ] ;

guardExpression : expressions lambdaImpliesOperator expression ; 







predeclaredValue : THIS | IOTA ;

factIdentifier  : Identifier | namespaceIdentifier ; 

operand : literal | predeclaredValue | operandName [ GenericTypes ] | LEFT_PARENTHESIS expression RIGHT_PARENTHESIS ; 

operandName [ GenericTypes ] | LEFT_PARENTHESIS expression RIGHT_PARENTHESIS 
; : Identifier | namespaceIdentifier ;

modifier : Identifier ;

conversion : expression SEMICOLON Type ;

methodExpression : receiverType DOTMethodName ;

receiverType : Type ;

methodName : Identifier ;

selector : DOT Identifier ;

indexing : LEFT_BRACKET expression [ COMMA ] RIGHT_BRACKET ;

slicing : LEFT_BRACKET slicingRange [ SEMICOLON expression ] RIGHT_BRACKET ;

slicingRange : [ expression [ RIGHT_ANGLE ] ] DOT DOT [ [ LEFT_ANGLE ] expression ] ;

functionArguments : LEFT_PARENTHESIS [ namedExpressionList [ COMMA ] ] RIGHT_PARENTHESIS ;

namedExpressionList : [ Identifier = ] expression { COMMA [ Identifier = ] expression } ;

errorHandling : "!"  [ expression ] 
              | "!!" expression
              | "!?" expression
              | "?"
              | "??" expression ;











// LITERALS ---------------------------------------------------------

literal : escalarLiteral
        | compositeLiteral
        ;

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
               | NONZERO NUMBER_VAL
               | ZERO
               | MINVALUE
               | MAXVALUE
               | NAN
               | POSITIVEINFINITY
               | NEGATIVEINFINITY
               ;

temporalLiteral : TIME_LIT
                | LOCALDATE TIME_VAL?
                | LOCALDATETIME TIME_VAL?
                | OFFSETDATE TIME_VAL?
                | OFFSETDATETIME TIME_VAL?
                | ZONEDDATE TIME_VAL?
                | ZONEDDATETIME TIME_VAL?
                ;

characterLiteral : CHAR_LIT
                 | LETTER CHAR_VAL
                 | DIGIT CHAR_VAL
                 | PUNCTUATION CHAR_VAL
                 | SYMBOL CHAR_VAL
                 | SEPARATOR CHAR_VAL
                 | NONPRINTABLE CHAR_VAL
                 | OTHER CHAR_VAL
                 ;

sequenceLiteral : HEREDOC_LITERAL
                | SEQUENCE_LIT
                | NONBLANK SEQUENCE_VAL
                | BLANK
                ;

// Composite literals

compositeLiteral : RANGE_LIT;
