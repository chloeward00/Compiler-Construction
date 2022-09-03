grammar ccal;

prog:                   decl_list function_list main;

decl_list:              decl SEMICOLON decl_list | /* epsilon */;

decl:                   var_decl | const_decl;

var_decl:               Var ID COLON type;

const_decl:             Const ID COLON type EQUAL expr;

function_list:          (function function_list | /* epsilon */);

function:               type ID LBR parameter_list RBR 
                        LEFTBRACK 
                        decl_list statement_block 
                        Return LBR (expr |/* epsilon */) RBR SEMICOLON RIGHTBRACK;

type:                   Int | Boolean | Void;

parameter_list:         nemp_parameter_list | /* epsilon */;

nemp_parameter_list:    ID COLON type | ID COLON type COMMA nemp_parameter_list;

main:                   Main LEFTBRACK decl_list statement_block RIGHTBRACK;

statement_block:        (statement statement_block) |/* epsilon */ ;

statement:              ID EQUAL expr SEMICOLON
                        | ID LBR arg_list RBR SEMICOLON
                        | LEFTBRACK statement_block RIGHTBRACK
                        | If condition LEFTBRACK statement_block RIGHTBRACK Else LEFTBRACK statement_block RIGHTBRACK
                        | While condition LEFTBRACK statement_block RIGHTBRACK
                        | Skip SEMICOLON;

expr: expr binary_arith_op expr | LBR expr RBR | ID LBR arg_list RBR | frag;


binary_arith_op:        ADDITION | SUB ;

frag : ID | SUB ID | Number | True | False;

condition:              NEG condition | LBR condition RBR | expr comp_op expr | condition (OR | AND) condition;

comp_op:                EQUALS | NEQUAL | LT | LEQUAL | GT | GTE;

arg_list:               nemp_arg_list |/* epsilon */;

nemp_arg_list:          ID | ID COMMA nemp_arg_list;

// Letter Fragments
fragment A:		        'a' | 'A';
fragment B:		        'b' | 'B';
fragment C:		        'c' | 'C';
fragment D:		        'd' | 'D';
fragment E:		        'e' | 'E';
fragment F:		        'f' | 'F';
fragment G:		        'g' | 'G';
fragment H:		        'h' | 'H';
fragment I:		        'i' | 'I';
fragment J:		        'j' | 'J';
fragment K:		        'k' | 'K';
fragment L:		        'l' | 'L';
fragment M:		        'm' | 'M';
fragment N:		        'n' | 'N';
fragment O:		        'o' | 'O';
fragment P:		        'p' | 'P';
fragment Q:		        'q' | 'Q';
fragment R:		        'r' | 'R';
fragment S:		        's' | 'S';
fragment T:		        't' | 'T';
fragment U:		        'u' | 'U';
fragment V:		        'v' | 'V';
fragment W:		        'w' | 'W';
fragment X:		        'x' | 'X';
fragment Y:		        'y' | 'Y';
fragment Z:		        'z' | 'Z';

fragment Letter:		[a-zA-Z];
fragment Digit:			[0-9];
fragment Underscore:	'_';

// Operators

ADDITION:				'+';
SUB:				    '-';
NEG:				    '~';
OR:					    '|';
AND:				    '&&';
EQUAL:				    '=';
EQUALS:                 '==';
NEQUAL:			        '!=';
LT:				        '<';
LEQUAL:		            '<=';
GT:			            '>';
GTE:	                '>=';
COMMA:				    ',';
COLON: 				    ':';
SEMICOLON:			    ';';
LBR:		            '(';
RBR:		            ')';
RIGHTBRACK:             '}';
LEFTBRACK:              '{';

Var:                    V A R;
Const:                  C O N S T;
Return:                 R E T U R N;
Int:                    I N T E G E R;
Boolean:				B O O L E A N;
Void:                   V O I D;
Main:                   M A I N;
If:                     I F;
Else:                   E L S E;
True:                   T R U E;
False:                  F A L S E;
While:                  W H I L E;
Skip:                   S K I P;

Number:		            (('-')? [1-9][0-9]*) | '0';
ID:						Letter (Letter | Underscore | Number)*;

COMMENT:             '/*' (COMMENT|.)*? '*/' -> Skip;
COMMENTS:             '//' .*? '\n' -> Skip;
WS:			            [ \t\n\r]+ -> Skip;