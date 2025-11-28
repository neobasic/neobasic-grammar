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

options {
    tokenVocab = NeoBasicLexer;
}


// --- STARTING RULES -----------------------------------------------

scriptProgram : shebangInterpreter sourceCodeProgram;

sourceCodeProgram : logicalInstructions;         // from file or eval()

oneLinerProgram : logicalInstruction;            // from interactive REPL

neoBasic : scriptProgram
         | sourceCodeProgram
         | oneLinerProgram
         ;


// --- SOURCE CODE ORGANIZATION OF NEOBASIC PROGRAM -----------------

logicalInstructions : ( logicalInstruction EOS )+;

logicalInstructionSuite : EOS INDENT logicalInstruction ( EOS logicalInstruction )* DEDENT;

logicalInstruction : directiveInstructionLiner
                   | directiveInstructionSuite
                   | instructionSentence
                   ;

directiveInstructionLiner : directiveSentence EOS logicalInstruction;

directiveInstructionSuite : directiveSentence logicalInstructionSuite;

instructionSentence : SONGBIRD_LOG instructionSentence
                    | SONGBIRD instructionSentence
                    | RUBBERDUCK instructionSentence
                    | topLevelSentence
                    | declarationSentence
                    | statementSentence
                    | // empty line
                    ;


// --- NEOBASIC DIRECTIVES ------------------------------------------

shebangInterpreter : SHEBANG ABSOLUTE_PATH expression? EOS;

directiveSentence : compilerPragmaDirective
                  | shellLookupDirective
                  | canaryTestingDirective
                  ; 

// Compiler Pragma directive

compilerPragmaDirective : SHEBANG IDENTIFIER expressions?;

// Shell Lookup directive

shellLookupDirective : SHERLOCK lookupStatement;

lookupStatement : expressions;

// Canary Testing directive

canaryTestingDirective : testingLine
                       | testingBlock
                       ;

testingLine : WOODSTOCK_LINE logicalInstruction;

testingBlock : WOODSTOCK_BLOCK logicalInstructions WOODSTOCK_BLOCK;


// --- SYMBOLIC IDENTIFIERS -----------------------------------------

// Single identifiers

labelIdentifier : IDENTIFIER;

qualifiedIdentifier : IDENTIFIER ( DOT IDENTIFIER )*;

decoratedIdentifier : metadataDecorators? IDENTIFIER;

decoratedType : metadataDecorators? type;

typedDecoratedIdentifier : decoratedIdentifier type;

inferredDecoratedIdentifier : decoratedIdentifier type?;

genericDecoratedIdentifier : decoratedIdentifier genericTypeParameters?;

declarationIdentifier : metadataDecorators? qualifiedIdentifier genericTypeParameters?;

// Identifiers list

identifiers : IDENTIFIER (COMMA IDENTIFIER)*;

qualifiedIdentifiers : qualifiedIdentifier (COMMA qualifiedIdentifier)*;

decoratedIdentifiers : decoratedIdentifier (COMMA decoratedIdentifier)* ;

decoratedTypes : decoratedType (COMMA decoratedType)* ;

typedDecoratedIdentifiers : typedDecoratedIdentifier (COMMA typedDecoratedIdentifier)* ;

inferredDecoratedIdentifiers : inferredDecoratedIdentifier (COMMA inferredDecoratedIdentifier)*;


// --- INSTRUCTION SENTENCE: TOP LEVEL DIVISIONS --------------------

topLevelSentence : identificationSentence
                 | deflagSentence
                 | useSentence
                 | interfaceSentence
                 | includeSentence
                 ;

// Identification-division declaration (translation unit programs)

identificationSentence : appletClause
                       | moduleClause
                       | notabeneClause
                       ;

appletClause : APPLET qualifiedIdentifier?;

moduleClause: MODULE qualifiedIdentifier;

notabeneClause : NOTABENE qualifiedIdentifier;

// Defined Flag (deflag) declarations

deflagSentence : defineClause
               | undefClause
               ;

// DEFINE
defineClause : DEFINE ( defineSuite | defineDeclare );

defineSuite : EOS INDENT defineDeclareBlock DEDENT;

defineDeclareBlock : defineDeclare (EOS defineDeclare)*;

defineDeclare : defineDeclareSingle
              | defineDeclareMultiple
              ;

defineDeclareSingle : defAtom literal?;

defineDeclareMultiple: defineDeclareSingle (COMMA defineDeclareSingle)+;

// UNDEF
undefClause : UNDEF ( undefSuite | undefDeclare );

undefSuite : EOS INDENT undefDeclareBlock DEDENT;

undefDeclareBlock : undefDeclare (EOS undefDeclare)*;

undefDeclare : defAtoms;

defAtom : IDENTIFIER
        | ATOM_IDENTIFIER
        ;

defAtoms : defAtom (COMMA defAtom)*;

// Use declaration

useSentence : useClause;

useClause : USE ( useSuite | useDeclare );

useSuite : EOS INDENT useDeclareBlock DEDENT;

useDeclareBlock : useDeclare (EOS useDeclare)*;

useDeclare : useDeclareSingle
           | useDeclareMultiple
           | useDeclareAs
           | useDeclareOf
           ;

useDeclareSingle : qualifiedIdentifier;

useDeclareMultiple : useDeclareSingle (COMMA useDeclareSingle)+;

useDeclareAs : qualifiedIdentifier AS IDENTIFIER;

useDeclareOf : qualifiedIdentifiers OF qualifiedIdentifier;

// Interface declaration

interfaceSentence : interfaceClause;

interfaceClause : INTERFACE declarationIdentifier mixesClause? interfaceBody;

interfaceBody : logicalInstructionSuite;

// Include declaration

includeSentence : includeClause;

includeClause : INCLUDE ( includeSuite | includeDeclare );

includeSuite : EOS INDENT includeDeclareBlock DEDENT;

includeDeclareBlock : includeDeclare (EOS includeDeclare)*;

includeDeclare : includeDeclareSingle
               | includeDeclareMultiple
               | includeDeclareAs
               ;

includeDeclareSingle : shellPathLiteral;

includeDeclareMultiple: includeDeclareSingle (COMMA includeDeclareSingle)+;

includeDeclareAs : shellPathLiterals AS inferredDecoratedIdentifier;

// --- INSTRUCTION SENTENCE: DECLARATION ----------------------------

declarationSentence : adhocMetadata+ declarationSentence
                    | visibilityLabelSuite
                    | outerDeclareSentence
                    | innerDeclareSentence
                    ;

// Metadata constructs

adhocMetadata : metadataDecorators
              | metadataGenerics
              | visibilityModifier
              ;

// Decorators constructs

metadataDecorators : symbolDecorators ( EOS? symbolDecorators )* EOS?;

// Generics constructs

metadataGenerics : DOUBLE_LEFT_ANGLE typeParameters DOUBLE_RIGHT_ANGLE EOS?;

// Visibility modifiers

visibilityModifier : PUBLIC
                   | PROTECTED
                   | PRIVATE
                   ;

visibilityLabelSuite : visibilityModifier EOS INDENT declarationSentence (EOS declarationSentence)* DEDENT;

// Especial clauses used repeatedly

extendsClause : EXTENDS visibilityModifier? type ( COMMA visibilityModifier? type )*;

implementsClause : IMPLEMENTS types;

mixesClause : MIXES types;

raisesClause : NOPANIC
             | RAISES types
             ;

// Procedure rules used repeatedly

parenthesizedArguments : LEFT_PARENTHESIS namedArguments? RIGHT_PARENTHESIS;

namedArguments : namedArgument ( COMMA namedArgument )*;

namedArgument : ( IDENTIFIER EQUAL )? expression;

parenthesizedParameters : LEFT_PARENTHESIS procParameters? RIGHT_PARENTHESIS;

procParameters : procParameter ( COMMA procParameter )*;

procParameter : modeParameterSpecifier? metadataDecorators? prefixParameterName? IDENTIFIER ( prefixParameterType? type )? ( EQUAL expression )?;

modeParameterSpecifier : VAR                // reference variable parameter
                       | VAL                // default parameter for macros
                       | IN                 // in parâmeter
                       | OUT                // out parâmeter
                       | REF                // in and out parâmeter, can be pointer
                       ;

prefixParameterName : NAMED_ARGUMENTS       // **  dict: named-parameter arguments
                    | NAMED_OPTIONS         // ~~  dict: named macro-options
                    | TILDE                 // ~   lazy call-by-name (evaluated only when used as a zero-argument function: recomputed every time it is accessed)()
                    ;

prefixParameterType : ELLIPSIS              // ... tuple: variadic
                    | INTERVAL_INCLUSIVE    // ..  range: values, slice limits
                    | COLON                 // :   pair: key, value
                    ;

procResultType : type
               | types
               | LEFT_PARENTHESIS types RIGHT_PARENTHESIS
               ;

procBody : procSemex
         | procImplicitReturn
         | procPatternGuards
         | procSuite
         ;

procSuite : logicalInstructionSuite;

procSemex : COLON procSpecifier;

procSpecifier : DEFAULT
              | DELETE
              ;

procImplicitReturn : IMPLICIT_RETURN expression;

procPatternGuards : guardBranchClause+ guardElseClause?;

guardBranchClause : EOS PIPE expressions COLON expression;

guardElseClause : EOS PIPE ( ELSE COLON )? expression;

// Outer declarations

outerDeclareSentence : typeSentence
                     | constSentence
                     | letSentence
                     | varSentence
                     | castSentence
                     | factSentence
                     | macroSentence
                     | funcSentence
                     | feedSentence
                     | subSentence
                     | operatorSentence
                     | eventSentence
                     | enumSentence
                     | structSentence
                     | protoSentence
                     | traitSentence
                     | classSentence
                     | objectSentence
                     ;

// Type declaration

typeSentence : typeClause;

typeClause : TYPE ( typeSuite | typeDeclare );

typeSuite : EOS INDENT typeDeclareBlock DEDENT;

typeDeclareBlock : typeDeclare (EOS typeDeclare)*;

typeDeclare : typeDeclareSingle
            | typeDeclareSubrange
            ;

typeDeclareSingle : genericDecoratedIdentifier ( IS | ANCESTOROF | EXTENDS | IMPLEMENTS | MIXES ) type;

typeDeclareSubrange : genericDecoratedIdentifier type? COLON rangeLiteral;

// Constant declaration

constSentence : constClause;

constClause : CONST ( constSuite | constDeclare );

constSuite : EOS INDENT constDeclareBlock DEDENT;

constDeclareBlock : constDeclare ( EOS constDeclare )*;

constDeclare : constDeclareSingle
             | constDeclareMultiple
             | constDeclareParallel
             ;

constDeclareSingle : inferredDecoratedIdentifier singleAssignmentOperator expression;

constDeclareMultiple : constDeclareSingle ( COMMA constDeclareSingle INDENT)+;

constDeclareParallel : LEFT_PARENTHESIS inferredDecoratedIdentifiers RIGHT_PARENTHESIS unpackingAssignmentOperator expressions;

// Immutable Value declaration

letSentence : letClause;

letClause : LET ( letSuite | letDeclare );

letSuite : EOS INDENT letDeclareBlock DEDENT;

letDeclareBlock : letDeclare (EOS letDeclare)*;

letDeclare : letDeclareSingle
           | letDeclareMultiple
           | letDeclareParallel
           ;

letDeclareSingle : inferredDecoratedIdentifier (singleAssignmentOperator expression)?;

letDeclareMultiple : letDeclareSingle (COMMA letDeclareSingle)+;

letDeclareParallel : LEFT_PARENTHESIS inferredDecoratedIdentifiers RIGHT_PARENTHESIS unpackingAssignmentOperator expressions;

// Variable declaration

varSentence : varClause;

varClause : VAR ( varSuite | varDeclare );

varSuite : EOS INDENT varDeclareBlock DEDENT;

varDeclareBlock : varDeclare (EOS varDeclare)*;

varDeclare : varDeclareSingle
           | varDeclareMultiple
           | varDeclareParallel
           ;

varDeclareSingle : inferredDecoratedIdentifier (singleAssignmentOperator expression)?;

varDeclareMultiple : varDeclareSingle (COMMA varDeclareSingle)+;

varDeclareParallel : LEFT_PARENTHESIS inferredDecoratedIdentifiers RIGHT_PARENTHESIS unpackingAssignmentOperator expressions;

// Cast declaration

castSentence : castClause;

castClause : CAST declarationIdentifier parenthesizedParameters? procResultType raisesClause? castBody;

castBody : COLON stringLiteral
         | procImplicitReturn
         | procPatternGuards
         | procSuite
         ;

// Fact declaration

factSentence : factClause;

factClause : FACT declarationIdentifier parenthesizedParameters raisesClause? procBody;

// Macro declaration

macroSentence : macroClause;

macroClause : MACRO declarationIdentifier parenthesizedParameters mixesClause? raisesClause? procBody;

// Func declaration

funcSentence : funcClause;

funcClause : FUNC declarationIdentifier parenthesizedParameters procResultType raisesClause? procBody?;

// Feed declaration

feedSentence : feedClause;

feedClause : FEED declarationIdentifier parenthesizedParameters procResultType raisesClause? procBody?;

// Sub declaration

subSentence : subClause;

subClause : SUB declarationIdentifier parenthesizedParameters raisesClause? procBody?;

// Operator declaration

operatorSentence : operatorClause;

operatorClause : OPERATOR operatorIdentifier parenthesizedParameters procResultType raisesClause? procBody?;

operatorIdentifier : declarationIdentifier
                   | declarationOperator
                // | ( . )*?                 # charSequenceOperator
                   ;

declarationOperator : metadataDecorators? overloadableOperator genericTypeParameters?;

// Event declaration

eventSentence : eventClause;

eventClause : EVENT declarationIdentifier bracketedParameters procResultType raisesClause? procBody?;

bracketedParameters : LEFT_BRACKET procParameters? RIGHT_BRACKET;

// Enum declaration

enumSentence : enumClause;

enumClause : ENUM declarationIdentifier parenthesizedParameters? enumType? mixesClause? enumBody;

enumType : type;

enumBody : enumSemex
         | enumSuite
         ;

enumSemex : COLON enumFieldMultiple;

enumSuite : EOS INDENT enumMembersBlock DEDENT;

enumMembersBlock : enumMember ( EOS enumMember )*;

enumMember : logicalInstruction
           | enumFieldSingle
           | enumFieldMultiple
           ;

enumFieldSingle : decoratedIdentifier parenthesizedArguments? ( EQUAL expression )?;

enumFieldMultiple : enumFieldSingle ( COMMA enumFieldSingle )*;

// Struct declaration

structSentence : structClause;

structClause : STRUCT declarationIdentifier mixesClause? structBody;

structBody : structSemex
           | structSuite
           ;

structSemex : COLON structFieldMultiple;

structSuite : EOS INDENT structMembersBlock DEDENT;

structMembersBlock : structMember ( EOS structMember )*;

structMember : logicalInstruction
             | structFieldSingle
             | structFieldMultiple
             | structMemberEmbedded
             ;

structFieldSingle : inferredDecoratedIdentifier attributeTag? ( EQUAL expression )?;

attributeTag : stringLiteral;

structFieldMultiple : structFieldSingle ( COMMA structFieldSingle )+;

structMemberEmbedded : decoratedIdentifier STRUCT structSuite;

// Proto declaration

protoSentence : protoClause;

protoClause : PROTO declarationIdentifier extendsClause? protoBody;

protoBody : logicalInstructionSuite;

// Trait declaration

traitSentence : traitClause;

traitClause : TRAIT declarationIdentifier implementsClause? mixesClause? traitBody;

traitBody : logicalInstructionSuite;

// Class declaration

classSentence : classClause;

classClause : CLASS declarationIdentifier extendsClause? implementsClause? mixesClause? classBody;

classBody : classSemex
          | classSuite
          ;

classSemex : COLON classFieldMultiple;

classFieldMultiple : classFieldSimple ( COMMA classFieldSimple )*;

classFieldSimple : inferredDecoratedIdentifier attributeTag? ( EQUAL expression )?;

classSuite : logicalInstructionSuite;

// Object declaration

objectSentence : objectClause;

objectClause : OBJECT declarationIdentifier extendsClause? implementsClause? mixesClause? objectBody;

objectBody : logicalInstructionSuite;


// Inner declarations

innerDeclareSentence : constructSentence
                     | destructSentence
                     | propertySentence
                     | propertyAccessorSentence
                     ;

// Constructor declaration

constructSentence : constructClause;

constructClause : CONSTRUCT parenthesizedParameters classInitializer? raisesClause? procBody;

classInitializer : LEFT_CURLY classInitializingMembers RIGHT_CURLY;

classInitializingMembers : classInitializingMember ( COMMA classInitializingMember )*;

classInitializingMember : ( qualifiedIdentifier COLON )? expression;

// Destructor declaration

destructSentence : destructClause;

destructClause : DESTRUCT parenthesizedParameters? raisesClause? procBody;

// Property declaration

propertySentence : propertyClause;

propertyClause : PROPERTY declarationIdentifier type? attributeTag? ( EQUAL expression )? propertyBody;

propertyBody : logicalInstructionSuite
             ;

// Property Accessor declaration

propertyAccessorSentence : propertyGetterClause
                         | propertySetterClause
                         ;

propertyGetterClause : GETTER declarationIdentifier? parenthesizedParameters? raisesClause? procBody;

propertySetterClause : SETTER declarationIdentifier? parenthesizedParameters? raisesClause? procBody;


// --- INSTRUCTION SENTENCE: STATEMENT ------------------------------

statementSentence : labelIdentifier COLON
                  | labelIdentifier COLON statementSentence
                  | simpleStatement
                  | compoundStatement
                  | testingStatement
                  ;

statementSuite : EOS INDENT statementBlock DEDENT;

statementBlock : statementSentence ( EOS statementSentence )*;

clauseStatement : IMPLICIT_RETURN expression
                | DO simpleStatement
                | statementSuite
                ;


// Simple statements

simpleStatement : simpleStatement executionFlowOperator statementSentence
                | simpleStatement OTHERWISE statementSentence
                | simpleStatement UNLESS expression
                | simpleStatement TILL expression
                | assignmentStatement
                | consoleStatement
                | deterministicStatement
                | nondeterministicStatement
                | expressionStatement
                | emptyStatement
                ;

expressionStatement : expressions;

emptyStatement : ELLIPSIS;
                  
// Assignment statements

assignmentStatement : LET assignmentStatement
                    | assignmentSingle
                    | assignmentMultiple
                    | assignmentParallel
                    ;

assignmentSingle : primaryExpression singleAssignmentOperator expression;

assignmentMultiple : assignmentSingle (COMMA assignmentSingle)+;

assignmentParallel : primaryExpressions unpackingAssignmentOperator expressions;

// Console statements

consoleStatement : atClause consoleStatement
                 | echoCommand
                 | scanCommand
                 | alertCommand
                 | entryCommand
                 | playCommand
                 ;

atClause : AT expressions;

echoCommand : ECHO expressions? COMMA?;

scanCommand : SCAN expressions? COMMA?;

alertCommand : ALERT expressions?;

entryCommand : ENTRY expressions?;

playCommand : PLAY expressions;

// Deterministic statements

deterministicStatement : continueSentence
                       | breakSentence
                       | fallthroughSentence
                       | deferSentence
                       | returnSentence
                       | yieldSentence
                       | raiseSentence
                       | panicSentence
                       ;

continueSentence : CONTINUE ( labelIdentifier | INTEGER_LIT )?;

breakSentence : BREAK ( labelIdentifier | INTEGER_LIT )?;

fallthroughSentence : FALLTHROUGH ( labelIdentifier | INTEGER_LIT )?;

deferSentence : DEFER statementSentence;

returnSentence : RETURN expressions?;

yieldSentence : YIELD expressions;

raiseSentence : RAISE expression;

panicSentence : PANIC expression;

// Non-deterministic statements

nondeterministicStatement : ifThenSentence
                          | goSentence
                          | awaitSentence
                          ;

ifThenSentence : IF expression THEN statementSentence;

goSentence : GO expression ( INTO primaryExpressions )?;

awaitSentence : AWAIT expressions;


// Compound statements

compoundStatement : conditionalStatement
                  | iterationStatement
                  | controlFlowStatement
                  | concurrencyStatement
                  ;

conditionalStatement : ifSentence
                     | matchSentence
                     | trySentence
                     | switchSentence
                     ;

iterationStatement : loopSentence;

controlFlowStatement : beginSentence
                     | withSentence
                     ;

concurrencyStatement : gosubSentence
                     ;

// Conditional statement if-elif-else

ifSentence : ifClause elifClause* elseClause?;

ifClause : IF expression clauseStatement;

elifClause : EOS ELIF expression clauseStatement;

elseClause : EOS ELSE clauseStatement;

// Conditional statement match-case-else

matchSentence : matchClause caseClause+ elseClause?;

matchClause : MATCH expression?;

caseClause : EOS CASE expressions clauseStatement;

// Conditional statement try-catch

trySentence : tryClause catchClause*;

tryClause : TRY expressions clauseStatement?;

catchClause : EOS CATCH inferredDecoratedIdentifiers? clauseStatement;

// Conditional statement switch-when-default

switchSentence : switchClause whenClause+ defaultClause?;

switchClause : SWITCH expressions;

whenClause : EOS WHEN expressions clauseStatement;

defaultClause : EOS DEFAULT clauseStatement;

// Iteration statement loop

loopSentence : loopClause thenClause?;

loopClause : LOOP varDeclare? loopBody;

loopBody : loopNoCheck
         | loopCheckFirst
         | loopCheckLast
         ;

loopNoCheck : uptoClause? nextClause? clauseStatement;

loopCheckFirst : pretestClause uptoClause? nextClause? clauseStatement;

loopCheckLast : statementSuite EOS posttestClause uptoClause? nextClause?;

nextClause : NEXT simpleStatement;

uptoClause : UPTO expression;

pretestClause : loopEachClause
              | loopWhileClause
              | loopUntilClause
              ;

posttestClause : loopWhileClause
               | loopUntilClause
               ;

loopEachClause : identifiers EACH expressions ( STEP expression )?;

loopWhileClause : WHILE expression;

loopUntilClause : UNTIL expression;

thenClause : EOS THEN clauseStatement;


// Control Flow statement begin-end

beginSentence : beginClause catchClause* endClause;

beginClause : BEGIN clauseStatement;

endClause : EOS END clauseStatement;


// Control Flow statement with

withSentence : withClause;

withClause : WITH expressions clauseStatement?;


// Concurrency (asynchronous) statement gosub

gosubSentence : gosubClause forkClause? forEachClause?;

gosubClause : GOSUB decoratedIdentifier? statementSuite;

forkClause : FORK expression;

forEachClause : FOR identifiers EACH expressions ( STEP expression )?;


// Testing statements

testingStatement : simpleTestStatement
                 | compoundTestStatement
                 ;

simpleTestStatement : assertTestStatement
                    ;

compoundTestStatement : unitTestStatement
                      ;

// Assert test statement

assertTestStatement : assertClause;

assertClause : ASSERT expression (EXCLAMATION | EXCLAMATION expression)?;

// Unit test statement

unitTestStatement : unitClause
                    ( EOS fromClause )?
                    ( EOS onceClause )?
                    ( EOS dataClause )?
                    ( EOS callClause )?
                    ( EOS hideClause )?
                    ( EOS showClause )?
                    ( EOS stayClause )?
                    ( EOS passClause )?
                    ( EOS pastClause )?
                    ( EOS failClause )?
                  ;

unitClause : UNIT sequenceLiteral? logicalInstructionSuite?;

fromClause : FROM ( expressions | logicalInstructionSuite );

onceClause : ONCE ( expressions | logicalInstructionSuite );

dataClause : DATA EOS INDENT dataTable DEDENT;

dataTable: dataRow ( EOS dataRow )*;

dataRow : expression ( PIPE expression )*;

callClause : CALL ( expressions | logicalInstructionSuite );

hideClause : HIDE ( expressions | logicalInstructionSuite );

showClause : SHOW ( expressions | logicalInstructionSuite );

stayClause : STAY ( expressions | logicalInstructionSuite );

passClause : PASS ( expressions | logicalInstructionSuite );

pastClause : PAST ( expressions | logicalInstructionSuite );

failClause : FAIL ( expressions | logicalInstructionSuite );


// --- UNARY OPERATORS ----------------------------------------------

prefixUnaryOperator : unaryArithmeticOperator
                    | unarySpreadOperator
                    | unaryLogicalOperator
                    | unaryArrayOperator
                    | unaryCloneOperator
                    | unaryMoveOperator
                    | unaryMetaOperator
                    ;

// Arithmetic Operators (Prefix Notation)

unaryArithmeticOperator : CARET
                        | SQUARE_ROOT
                        | FACTORIAL
                        | INCREMENT
                        | DECREMENT
                        | PLUS
                        | HYPHEN
                        ;

//  Logical Operators (Prefix Notation)

unaryLogicalOperator : NOT
                     ;

//  Collection Operators

unaryArrayOperator : DEL
                   ;

// Meta (Miscellaneous) operators (Prefix Notation)

unarySpreadOperator : ELLIPSIS;

unaryCloneOperator : NEW;

unaryMoveOperator : NAB;

unaryMetaOperator : TYPEOF
                  | SIZEOF
                  ;


// --- BINARY OPERATORS ---------------------------------------------

// Arithmetic Operators (Infix Notation)

binaryArithmeticOperator : binaryExponentialOperator
                         | binaryMultiplicativeOperator
                         | binaryAdditiveOperator
                         | bitShiftOperator
                         | binaryConjunctionOperator
                         | binaryExclusiveDisjunctionOperator
                         | binaryDisjunctionOperator
                         ;

binaryExponentialOperator : CARET
                          | SQUARE_ROOT
                          ;

binaryMultiplicativeOperator : ASTERISK
                             | SLASH
                             | DIVISION
                             | PERCENT
                             | QUOTIENT
                             | PERCENTAGE_RATE
                             | PERCENTAGE_AMOUNT
                             | PERCENTAGE_INCREASE
                             | PERCENTAGE_DECREASE
                             | PERCENTAGE_VARIATION
                             ;

binaryAdditiveOperator : PLUS
                       | HYPHEN
                       ;

// Bitwise Operators (Non-Strict Evaluation = Short-circuit Evaluation)

bitShiftOperator : DOUBLE_LEFT_ANGLE
                 | DOUBLE_RIGHT_ANGLE
                 | UNSIGNED_RIGHT_SHIFT
                 ;

// Logical Operators (Non-Strict Evaluation = Short-circuit Evaluation) (Infix Notation)

binaryConjunctionOperator : AND
                          | NSC_AND
                          | NOT_AND
                          | AND_NOT
                          ;

binaryExclusiveDisjunctionOperator : XOR
                                   | NOT_XOR
                                   ;

binaryDisjunctionOperator : OR
                          | NSC_OR
                          | NOT_OR
                          ;

//  Collection Operators

binaryArrayOperator : AMPERSAND
                    | PIPE
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
                          | IS_NOT
                          | NOT_IS
                          | IN
                          | NOT_IN
                          | BETWEEN
                          | NOT_BETWEEN
                          | LIKE
                          | NOT_LIKE
                          | DIVISIBLE_BY
                          | NOT_DIVISIBLE_BY
                          | INSTANCEOF
                          | NOT_INSTANCEOF
                          | ANCESTOROF
                          | NOT_ANCESTOROF
                          | EXTENDS
                          | NOT_EXTENDS
                          | IMPLEMENTS
                          | NOT_IMPLEMENTS
                          | MIXES
                          | NOT_MIXES
                          ;

// Meta (Miscellaneous) operators (Infix Notation)

binaryMonadBindOperator : MONAD_BIND;

binaryPipelineOperator : PIPELINE;

// Coalescing Operators

coalescingOperator : EXCLAMATION
                   | DOUBLE_EXCLAMATION
                   | QUESTION
                   | DOUBLE_QUESTION
                   | ERROR_NONE_COALESCING
                   ; 

// Flow of Execution Operators

executionFlowOperator : EXECUTE_SEQUENCE
                      | EXECUTE_SEQUENCE_OKAY
                      | EXECUTE_SEQUENCE_FAIL
                      | EXECUTE_BACKGROUND
                      | OUTPUT_REDIRECTION
                      | APPEND_OUTPUT_REDIRECTION
                      | STDOUT_REDIRECTION
                      | APPEND_STDOUT_REDIRECTION
                      | STDERR_REDIRECTION
                      | APPEND_STDERR_REDIRECTION
                      ;

// Range Interval Operators

intervalOperator
    : INTERVAL_INCLUSIVE
    | INTERVAL_LEFT_EXCLUSIVE
    | INTERVAL_RIGHT_EXCLUSIVE
    | INTERVAL_EXCLUSIVE
    ;

leftIntervalOperator
    : INTERVAL_INCLUSIVE
    | INTERVAL_LEFT_EXCLUSIVE
    ;

rightIntervalOperator
    : INTERVAL_INCLUSIVE
    | INTERVAL_RIGHT_EXCLUSIVE
    ;


// --- ASSIGNMENT OPERATORS -----------------------------------------

assignmentOperator : singleAssignmentOperator
                   | unpackingAssignmentOperator
                   | compoundAssignmentOperator
                   ;

singleAssignmentOperator : EQUAL
                         | DERIVED_ASSIGNMENT
                         | LAZY_ASSIGNMENT
                         | POP_ONE_ASSIGNMENT
                         | PULL_ALL_ASSIGNMENT
                         | PIPE_ASSIGNMENT
                         ;

unpackingAssignmentOperator : EQUAL
                            ;

compoundAssignmentOperator : NTH_POWER_ASSIGNMENT
                           | NTH_ROOT_ASSIGNMENT
                           | MULTIPLICATION_ASSIGNMENT
                           | REAL_DIVISION_ASSIGNMENT
                           | INTEGER_DIVISION_ASSIGNMENT
                           | MODULO_ASSIGNMENT
                           | QUOTIENT_ASSIGNMENT
                           | PERCENTAGE_RATE_ASSIGNMENT
                           | PERCENTAGE_AMOUNT_ASSIGNMENT
                           | PERCENTAGE_INCREASE_ASSIGNMENT
                           | PERCENTAGE_DECREASE_ASSIGNMENT
                           | PERCENTAGE_VARIATION_ASSIGNMENT
                           | ADDITION_ASSIGNMENT
                           | SUBTRACTION_ASSIGNMENT
                           | SET_UNION_ASSIGNMENT
                           | SET_INTER_ASSIGNMENT
                           | LEFT_SHIFT_ASSIGNMENT
                           | SIGNED_RIGHT_SHIFT_ASSIGNMENT
                           | UNSIGNED_RIGHT_SHIFT_ASSIGNMENT
                           | NONE_COALESCING_ASSIGNMENT
                           | SHELL_PID_ASSIGNMENT
                           | SHELL_BKG_PID_ASSIGNMENT
                           ;

// Overloadable Operators for clause operator

overloadableOperator : prefixUnaryOperator
                     | binaryExponentialOperator
                     | binaryMultiplicativeOperator
                     | binaryAdditiveOperator
                     | bitShiftOperator
                     | binaryConjunctionOperator
                     | binaryExclusiveDisjunctionOperator
                     | binaryDisjunctionOperator
                     | binaryArrayOperator
                     | binaryComparisonOperator
                     | binaryRelationalOperator
                     | binaryConditionalOperator
                     | coalescingOperator
                     | executionFlowOperator
                     | assignmentOperator
                     ;


// --- DECORATORS: ANNOTATION & ASPECT ------------------------------

symbolDecorators : symbolDecorator ( COMMA? symbolDecorator )*;

symbolDecorator : annotationDecorator
                | aspectDecorator
                ;

annotationDecorator : ATOM_IDENTIFIER taggedValuePairs*;

aspectDecorator : ASPECT_IDENTIFIER taggedValuePairs*;

taggedValuePairs : taggedValuePair ( COMMA taggedValuePair )*;

taggedValuePair : ( IDENTIFIER EQUAL )? expression;


// --- DATA TYPES ---------------------------------------------------

genericTypeParameters : LEFT_ANGLE typeParameters RIGHT_ANGLE;

typeParameters : typeParameter ( COMMA typeParameter )*;

typeParameter : type ( ( IS | ANCESTOROF | EXTENDS | IMPLEMENTS | MIXES | LIFETIME ) type )?;

types : type ( COMMA type )*;

type : prefixTypeModifier type
     | type postfixTypeWrapper
     | type genericTypeParameters
     | type AND type
     | type OR type
     | type XOR type
     | type LIFETIME type
     | nativeType
     | qualifiedIdentifier
     ;

prefixTypeModifier : LEFT_BRACKET expressions RIGHT_BRACKET   // array size
                   ;

postfixTypeWrapper : EXCLAMATION                    // ResultOption wrapper declaration
                   | QUESTION                       // MaybeOption  wrapper declaration
                   | QUESTION QUESTION              // EitherOption wrapper declaration
                   | PIPE RIGHT_ANGLE               // StreamOption warpper declaration
                   | EXCLAMATION QUESTION           // ResultOption wrapper of MaybeOption wrapper declaration
                   | EXCLAMATION QUESTION QUESTION  // ResultOption wrapper of EitherOption wrapper declaration
                   | EXCLAMATION PIPE RIGHT_ANGLE   // ResultOption wrapper of StreamOption warpper declaration
                   ;

nativeType : escalarType
           | compoundType
           | optionType
           | metaType
           | procType
           ;

// Escalar data types

escalarType : booleanType
            | numericType
            | temporalType 
            | characterType
            ;

booleanType : BOOL8
            | BOOL16
            | BOOL32
            | BOOL64
            | BOOL128
            | BOOL
            ;

numericType : numericNatural
            | numericInteger
            | numericReal
            | numericDecimal
            | numericRatio
            | numericComplex
            | numericQuaternion
            ;

numericNatural : BYTE
               | NAT8
               | NAT16
               | NAT32
               | NAT64
               | NAT128
               | NATURAL
               | BIGNATURAL
               ;

numericInteger : INT8
               | INT16
               | INT32
               | INT64
               | INT128
               | INT
               | BIGINT
               ;

numericDecimal : DEC8
               | DEC16
               | DEC32
               | DEC64
               | DEC128
               | DECIMAL
               | MONEY
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

temporalType : ELAPSE
             | DATE
             ;

characterType : ASCII
              | WCHAR
              | UNICODE
              | CHAR8
              | CHAR16
              | CHAR32
              | CHAR
              ;

// Compound data types

compoundType : sequenceType
             | compositeType
             | collectionType 
             ;

sequenceType : ANSI
             | WSTR
             | STRING8
             | STRING16
             | STRING32
             | STRING
             | REGEX
             | BINARY
             ;

compositeType : RANGE
              | PAIR
              | TUPLE
              | INET
              | PATH
              | URI
              ;

collectionType : ARRAY
               | LIST
               | MAP
               | CHANNEL
               | VECTOR
               | MATRIX
               | SET
               | QUEUE
               | DEQUE
               | XML
               | TABLE
               | MEMO
               ;

// Option data types

optionType : RESULT
           | MAYBE
           | EITHER
           | STREAM
           ;

// Meta data types

metaType : ATOM
         | AUTO
         | SPAN
         | VIEW
         | VOID
         | APPLET
         | MODULE
         | NOTABENE
         | INTERFACE
         | TYPE
         | ENUM
         | STRUCT
         | PROTO
         | TRAIT
         | CLASS
         | OBJECT
         | PROPERTY
         ;

// Procedural data types

procType : castType
         | factType
         | funcType
         | feedType
         | subType
         | operatorType
         | eventType
         | getterType
         | setterType
         ;

castType : CAST parenthesizedParameterTypes procResultType;

factType : FACT procParameterType;

macroType : MACRO parenthesizedParameterTypes procResultType;

funcType : FUNC parenthesizedParameterTypes procResultType;

feedType : FEED parenthesizedParameterTypes procResultType;

subType : SUB parenthesizedParameterTypes;

operatorType : OPERATOR parenthesizedParameterTypes procResultType;

eventType : EVENT bracketedParameterTypes procResultType;

getterType : GETTER ;

setterType : SETTER parenthesizedParameterTypes;

parenthesizedParameterTypes : LEFT_PARENTHESIS procParameterTypes? RIGHT_PARENTHESIS;

bracketedParameterTypes : LEFT_BRACKET procParameterTypes? RIGHT_BRACKET;

procParameterTypes : procParameterType ( COMMA procParameterType )*;

procParameterType : prefixParameterType? type;


// LITERALS ---------------------------------------------------------

literal : escalarLiteral
        | optionLiteral
        | compoundLiteral
        | lambdaLiteral
        ;

// Escalar literals

escalarLiteral : booleanLiteral
               | numericLiteral
               | elapseLiteral
               | dateLiteral
               | characterLiteral
               ;

booleanLiteral : TRUE
               | FALSE
               ;

// Numeric literals

numericLiteral : NATURAL_LIT
               | INTEGER_LIT
               | DECIMAL_LIT
               | REAL_LIT
               | RATIO_LIT
               | IMAGINARY_LIT
               | TERM_LIT
               | NONZERO parenthesizedExpression
               | ZERO
               | MINVALUE
               | MAXVALUE
               | NAN
               | POSITIVEINFINITY
               | NEGATIVEINFINITY
               ;

// Temporal literals

elapseLiteral : ELAPSE_LIT
              | ATOM_ELAPSE_LIT
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
                 | UNICODE_LIT
                 | CHAR_LIT
                 | LETTER parenthesizedExpression
                 | DIGIT parenthesizedExpression
                 | PUNCTUATION parenthesizedExpression
                 | SYMBOL parenthesizedExpression
                 | SEPARATOR parenthesizedExpression
                 | NONPRINTABLE parenthesizedExpression
                 | NULL
                 ;

// Option (wrappers) data types

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

// Compound literals

compoundLiteral : sequenceLiteral
                | musicalLiteral
                | compositeLiteral
                | xmlDocLiteral
                | collectionLiteral
                | objectLiteral
                ;

// Sequence literals

sequenceLiteral : TEMPLATE_SINGLELINE_STRING_LIT
                | TEMPLATE_MULTILINE_STRING_LIT
                | VERBATIM_SINGLELINE_STRING_LIT
                | VERBATIM_MULTILINE_STRING_LIT
                | TRANSLATABLE_SINGLELINE_STRING_LIT
                | TRANSLATABLE_MULTILINE_STRING_LIT
                | HEREDOC_STRING_LIT
                | REGULAR_EXPRESSION_LIT
                | ATOM_DOT_LIT
                | BINARY_LIT
                | NONBLANK parenthesizedExpression
                | BLANK
                ;

stringLiteral : TEMPLATE_SINGLELINE_STRING_LIT
              | VERBATIM_SINGLELINE_STRING_LIT
              | TRANSLATABLE_SINGLELINE_STRING_LIT
              ;

// Musical literals

musicalLiteral : ATOM_MUSIC_LIT;

// Composite literals

compositeLiteral : rangeLiteral
                 | pairLiteral
                 | tupleLiteral
                 | inetLiteral
                 | uriLiteral
                 | shellPathLiteral
                 ;

rangeLiteral : escalarLiteral intervalOperator escalarLiteral
             | escalarLiteral leftIntervalOperator
             | rightIntervalOperator escalarLiteral
             ;

pairLiteral : escalarLiteral COLON expression;

tupleLiteral : LEFT_PARENTHESIS expressions COMMA? RIGHT_PARENTHESIS;

inetLiteral : ATOM_DOT_LIT
            | IPV4 parenthesizedExpression
            | IPV6 parenthesizedExpression
            ;

uriLiteral : URL parenthesizedExpression
           | URN parenthesizedExpression
           ;

// Shell path literals

shellPathLiteral : SHELL_PATH
                 | SHELL_STRING_PATH
                 | FOLDER parenthesizedExpression
                 | FILE parenthesizedExpression
                 | LINKLINKFILE parenthesizedExpression
                 | PIPEFILE parenthesizedExpression
                 | SOCKETFILE parenthesizedExpression
                 | BLOCKDEVICE parenthesizedExpression
                 | CHARDEVICE parenthesizedExpression
                 | NULLDEVICE
                 ;

shellPathLiterals : shellPathLiteral ( COMMA shellPathLiteral )*;

// XML (document) literals

xmlDocLiteral : xmlDocElement
              | xmlDocFragment
              ;

// XML elements

xmlDocElement : xmlElementPaired
              | xmlElementSelfClosed
              ;

xmlElementPaired : xmlOpeningElement xmlChildren* xmlClosingElement;

xmlOpeningElement : LEFT_ANGLE xmlTagName xmlAttributes* RIGHT_ANGLE;

xmlClosingElement : XML_CLOSING_TAG xmlTagName RIGHT_ANGLE;

xmlElementSelfClosed : LEFT_ANGLE xmlTagName xmlAttributes* XML_SELFCLOSING_TAG;

// XML fragments

xmlDocFragment : xmlFragmentPaired
               | xmlFragmentSelfClosed
               ;

xmlFragmentPaired : XML_OPENING_FRAGMENT xmlChildren* XML_CLOSING_FRAGMENT;

xmlFragmentSelfClosed : XML_CLOSING_FRAGMENT;

// XML attributes

xmlTagName : IDENTIFIER
           | qualifiedIdentifier
           ;

xmlAttributes : xmlTagName ( EQUAL xmlAttributeValue )?;

xmlAttributeValue : literal
                  | expressionPlaceholder
                  ;

// XML children

xmlChildren : xmlDocElement
            | expressionPlaceholder
            | XML_CONTENT
            ;

expressionPlaceholder : LEFT_CURLY expression RIGHT_CURLY ;

// Collections & Arrays

collectionLiteral : type? collectionLiteralValue
                  | arrayAosToSoaLiteral 
                  | listComprehension
                  ;

collectionLiteralValue : LEFT_BRACKET RIGHT_BRACKET
                       | LEFT_BRACKET ( elements COMMA? )+ RIGHT_BRACKET
                       ;

elements : element+;

element : ( elementKey COLON )? elementValue;

elementKey : expression;

elementValue : expression;

arrayAosToSoaLiteral : LEFT_BRACKET RIGHT_BRACKET expression;

listComprehension : LEFT_BRACKET expressions comprehensionClause+ RIGHT_BRACKET;

comprehensionClause : forEachClause ( IF expression )?;

// Structs & Classes

objectLiteral : type? objectLiteralValue;

objectLiteralValue : LEFT_CURLY RIGHT_CURLY
                   | LEFT_CURLY objectMembers COMMA? RIGHT_CURLY
                   | LEFT_CURLY logicalInstructionSuite RIGHT_CURLY
                   ;

objectMembers : objectMember ( COMMA objectMember )*;

objectMember : ( memberName COLON )? memberValue
             | ELLIPSIS qualifiedIdentifier
             ;

memberName : inferredDecoratedIdentifier;

memberValue : expression;

// lambda function literals

lambdaLiteral : lambdaClause
              | lambdaStatement
              | arithmeticComprehension
              ;

lambdaClause : LAMBDA procParameters? IMPLICIT_RETURN expressions;

lambdaStatement : LAMBDA_PARENTHESIS statementBlock RIGHT_PARENTHESIS;

arithmeticComprehension : binaryArithmeticOperator LAMBDA_PARENTHESIS expression comprehensionClause+ RIGHT_PARENTHESIS;

// Pre-declared values

predeclaredValue : predefinedIdentifier
                 | predefinedShellValue
                 ;

predefinedIdentifier : THIS
                     | IOTA
                     | NTH
                     | IT
                     | SELF
                     | SUPER
                     | PARENT
                     | UNDERSCORE
                     ;

predefinedShellValue : SHELL_CURRENT_OPTIONS
                     | SHELL_EXIT_STATUS
                     | SHELL_ERROR_LEVEL
                     | SHELL_BKG_EXIT_STATUS
                     | SHELL_BKG_ERROR_LEVEL
                     | SHELL_FILE_DESCRIPTOR
                     | SHELL_CMD_ARGUMENT
                     | SHELL_ENV_VARIABLE
                     ;

// Pre-declared functors (built-ins): facts and fmaps 

predeclaredFunctor : predeclaredFact
                   | predeclaredFmap
                   ;

predeclaredFact : TRUE
                | FALSE
                | ZERO
                | MINVALUE
                | MAXVALUE
                | NAN
                | POSITIVEINFINITY
                | NEGATIVEINFINITY
                | LOCALDATE
                | LOCALDATETIME
                | OFFSETDATE
                | OFFSETDATETIME
                | ZONEDDATE
                | ZONEDDATETIME
                | TOMORROW
                | TODAY
                | NOW
                | YESTERDAY
                | EON
                | EPOCH
                | LETTER
                | DIGIT
                | PUNCTUATION
                | SYMBOL
                | SEPARATOR
                | NONPRINTABLE
                | NULL
                | NONBLANK
                | BLANK
                | FOLDER
                | FILE
                | LINKLINKFILE
                | PIPEFILE
                | SOCKETFILE
                | BLOCKDEVICE
                | CHARDEVICE
                | NULLDEVICE
                | OKAY
                | FAIL
                | SOME
                | NONE
                | YEA
                | NAY
                | DATUM
                | EOT
                ;

predeclaredFmap : ALL
                | ANY
                | LOT
                | NIL
                | ONE
                | TWO
                ;


// --- EXPRESSION ---------------------------------------------------

primaryExpressions : primaryExpression (COMMA primaryExpression)*;

primaryExpression : primaryOperand
                  | sos_Expression
                  | parenthesizedExpression
                  | primaryExpression LEFT_BRACKET arrayIndexing RIGHT_BRACKET              // indexing
                  | primaryExpression DOT primaryExpression                                 // selector
                  | primaryExpression genericTypeParameters? parenthesizedArguments         // procedure call                        // procedure call
                  | primaryExpression expressions macroOption*                              // macro call
                  | prefixUnaryOperator primaryExpression                                   // ++i, new x
                  | primaryExpression SEMICOLON formatType                                  // casting
                  | primaryFunctor primaryExpression                                        // fact test
                  | juxtapositionExpression                                                 // string concat
                  ;

primaryOperand : predeclaredValue
               | literal
               | IDENTIFIER
               | qualifiedIdentifier
               | type
               ;

primaryFunctor : predeclaredFunctor
               | qualifiedIdentifier
               ;

sos_Expression : LEFT_PARENTHESIS statementSentence RIGHT_PARENTHESIS;

parenthesizedExpression : LEFT_PARENTHESIS expression RIGHT_PARENTHESIS;

arrayIndexing : expressions
              | intervalExpression
              | sliceExpression
              ;

intervalExpression : expression intervalOperator expression
                   | expression leftIntervalOperator
                   | rightIntervalOperator expression
                   | intervalExpression INTERVAL_INCLUSIVE expression
                   ;

sliceExpression : expression COLON expression
                | COLON expression
                | expression COLON
                | sliceExpression COLON expression
                ;

formatType : type
           | ATOM_IDENTIFIER
           | stringLiteral
           ;

macroOption : TILDE IDENTIFIER ( EQUAL expression );

juxtapositionExpression : sequenceLiteral+;

expressions : expression (COMMA expression)*;

expression : primaryExpression
           | expression binaryExponentialOperator expression
           | expression binaryMultiplicativeOperator expression
           | expression bitShiftOperator expression
           | expression binaryAdditiveOperator expression
           | expression binaryArrayOperator expression
           | expression binaryComparisonOperator expression
           | expression binaryRelationalOperator expression
           | expression binaryConditionalOperator expression
           | expression binaryConjunctionOperator expression
           | expression binaryExclusiveDisjunctionOperator expression
           | expression binaryDisjunctionOperator expression
           | expression binaryMonadBindOperator expression
           | expression binaryPipelineOperator expression
           | expression coalescingOperator expression?
           | expression IF expression ELSE expression
           | guardsExpression
           | shellProcess
           | assignmentExpression
           | primaryExpression ( FUNCTOR primaryFunctor )+ expression?         // fmap -> fmap ...
           | primaryFunctor ( FUNCTOR primaryFunctor )* expressions            // all -> fact ...
           | primaryExpression parenthesizedArguments lambdaLiteral            // trailing lambda syntax (Kotlin)
           ;

guardsExpression : guardClause+ guardDefault?;

guardClause : PIPE expression IMPLICIT_RETURN expression;

guardDefault : PIPE expression;

shellProcess : shellPathLiteral LEFT_CURLY statementBlock RIGHT_CURLY;

assignmentExpression : primaryExpression assignmentOperator expression;
