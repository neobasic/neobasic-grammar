// Character literals

ASCII_LIT : 'a'? ASCII_CHAR;

CHAR_LIT : CHARS_PREFIX? UNICODE_CHAR;

fragment CHARS_PREFIX : 'a' | 'u' | 'u8' | 'u16' | 'u32' | 'L';

fragment ASCII_CHAR
    : '\'' ASCII_ESCAPED_VALUE '\''
    | '\'' UNICODE_ASCII '\''
    | '"'  UNICODE_ASCII '"'
    | '`'  UNICODE_ASCII '`'
    ;

fragment UNICODE_CHAR
    : '\'' ASCII_ESCAPED_VALUE '\''
    | '\'' UNICODE_ESCAPED_VALUE '\''
    | '\'' ~['] '\''
    | '"'  ~["] '"'
    | '`'  ~[`] '`'
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

// String literals

VERBATIM_SINGLELINE_STRING_LIT : CHARS_PREFIX? '"' .*? '"';

VERBATIM_MULTILINE_STRING_LIT : CHARS_PREFIX? '"""' .*? '"""';

TEMPLATE_SINGLELINE_STRING_LIT : CHARS_PREFIX? '\'' ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*?  '\'';

TEMPLATE_MULTILINE_STRING_LIT : CHARS_PREFIX? '\'\'\'' ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*?  '\'\'\'';

TRANSLATABLE_SINGLELINE_STRING_LIT : CHARS_PREFIX? '`' ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*?  '`';

TRANSLATABLE_MULTILINE_STRING_LIT : CHARS_PREFIX? '```' ('{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*?  '```';

// HereDoc Literals

HEREDOC_STRING_LIT : '<<<' ( IDENTIFIER EOL .*? EOL IDENTIFIER
                           | CHARS_PREFIX? '"' EOL .*? EOL '"'
                           | CHARS_PREFIX? '"""' EOL .*? EOL '"""'
                           | CHARS_PREFIX? '\'' EOL ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*? EOL '\''
                           | CHARS_PREFIX? '\'\'\'' EOL ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*? EOL '\'\'\''
                           | CHARS_PREFIX? '`' EOL ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*? EOL '`'
                           | CHARS_PREFIX? '```' EOL ( '{' ~[{}]* '}' | ASCII_ESCAPED_VALUE | UNICODE_ESCAPED_VALUE | . )*? EOL '```'
                           | HEX_UNIT EOL HEX_DIGIT* EOL HEX_UNIT
                           | OCT_UNIT EOL OCT_DIGIT* EOL OCT_UNIT
                           | BIN_UNIT EOL BIN_DIGIT* EOL BIN_UNIT
                           ) 
                   ;

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
