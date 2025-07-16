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

// SOURCE CODE ORGANIZATION OF NEO PROGRAM

neoProgram : oneLinerProgram | sourceFileProgram ;

oneLinerProgram : statement;

sourceFileProgram : identificationDivision? processingDivision ;

// IDENTIFICATION DIVISION

identificationDivision : shebangInterpreter EOL ;

shebangInterpreter : SHEBANG_LINE ;

// PROCESSING DIVISION

processingDivision : (processingStatement EOL)+ ;

processingStatement
    : magicComment
    | topLevelSentence 
    | statement
    ;

// MAGIC COMMENTS

magicComment
    : pragmaStatement
    | testStatement
    ;

pragmaStatement : PRAGMA pragmaAttribute+ ;

pragmaAttribute : IDENTIFIER (EQUAL expression)? ;

testStatement : assertionTest ;

assertionTest : CANARY_TESTING assertionExpression ;

assertionExpression : expressions (EXCLAMATION expression)? ;

// TOP LEVEL SENTENCES

topLevelSentence
    : constSentence
    | valSentence
    | varSentence
    ;

// CONST SENTENCE

constSentence : CONST varDeclares ;

// VAL SENTENCE

valSentence : VAL varDeclares ;

// VAR SENTENCE

varSentence : VAR varDeclares;

varDeclares : varDeclare (COMMA varDeclare)* ;

varDeclare : symbolIdentifiers type? (singleAssignmentOperator expressions)? ;

// OPERATORS

singleAssignmentOperator
    : BASIC_ASSIGNMENT
    | DESTRUCTURING_ASSIGNMENT
    | INLINE_ASSIGNMENT
    ;

compoundAssignmentOperators
    : ADDITION_ASSIGNMENT
    | SUBTRACTION_ASSIGNMENT
    | MULTIPLICATION_ASSIGNMENT
    | REAL_DIVISION_ASSIGNMENT
    | INTEGER_DIVISION_ASSIGNMENT
    | MODULO_ASSIGNMENT
    | EXPONENTIATION_ASSIGNMENT
    | NTH_ROOT_ASSIGNMENT
    | PERCENTAGE_RATE_ASSIGNMENT
    | PERCENTAGE_AMOUNT_ASSIGNMENT
    | PERCENTAGE_INCREASE_ASSIGNMENT
    | PERCENTAGE_DECREASE_ASSIGNMENT
    | PERCENTAGE_VARIATION_ASSIGNMENT
    | BIT_AND_ASSIGNMENT
    | BIT_OR_ASSIGNMENT
    | BIT_XOR_ASSIGNMENT
    | BIT_CLEAR_ASSIGNMENT
    | BIT_NOT_ASSIGNMENT
    | LEFT_SHIFT_ASSIGNMENT
    | SIGNED_RIGHT_SHIFT_ASSIGNMENT
    | UNSIGNED_RIGHT_SHIFT_ASSIGNMENT
    | NONE_COALESCING_ASSIGNMENT
    ;









// IDENTIFIERS

symbolIdentifiers : symbolIdentifier (COMMA symbolIdentifier)* ;

symbolIdentifier : IDENTIFIER ;

// NEOBASIC NATIVE DATA TYPES

type
    : neoNativeType POSFIX_TYPE_MODIFIER?
    | neoNativeType (AMPERSAND | PIPE) type
    | neoNativeType ;

neoNativeType : escalarType | miscellaneousType ;

escalarType : booleanType | numericType | temporalType | sequenceType ;

miscellaneousType : TANY ;

// BOOLEAN DATA TYPES

booleanType : BOOL8 | BOOL16 | BOOL32 | BOOL64 | BOOL128 | BOOL ;

// NUMERIC DATA TYPES

numericType : numericDigit | naturalNumber | numericInteger
            | numericDecimal | numericReal | numericRatio
            | numericComplex | numericQuaternion | NUMBER ;

numericDigit : DIG | BIT | OCT | HEX | NIBBLE ;

naturalNumber : NAT8 | NAT16 | NAT32 | NAT64 | NAT128 | BYTE | NAT | ASCII | CHAR ;

numericInteger : INT8 | INT16 | INT32 | INT64 | INT128 | INT | BIGINT ;

numericDecimal : DEC1 | DEC2 | DEC3 | DEC4 | DEC5 | DEC6 | DEC7 | DEC8 | DEC | MONEY | BIGDEC ;

numericReal : REAL8 | REAL16 | REAL32 | REAL64 | REAL128 | REAL | BIGREAL ;

numericRatio : RATIO16 | RATIO32 | RATIO64 | RATIO128 | RATIO ;

numericComplex : COMPLEX16 | COMPLEX32 | COMPLEX64 | COMPLEX128 | COMPLEX ;

numericQuaternion : QUATERN32 | QUATERN64 | QUATERN128 | QUATERN256 | QUATERN ;

// TEMPORAL DATA TYPES

temporalType : DATE | ELAPSE ;

// SEQUENTIAL DATA TYPES

sequenceType : STRING | REGEX | BINARY ;











































// EXPRESSIONS

expressions : expression (COMMA expression)* ;

expression
    : unaryExpression
    | binaryExpression
    | assignmentExpression
    | factExpression
    | eagerEvaluateExpression
    | condicionalExpression
    | functorExpression
    ;

unaryExpression
    : prefixUnaryOperator unaryExpression 
    | unaryExpression posfixUnaryOperator
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

literal : escalarLiteral ;
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





























commentedStatement : ;

statement: ;





