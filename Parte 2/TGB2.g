grammar TGB2;

options {
	language=Java;
	backtrack=true;
}

prog : (COMANDO SEMICOLON)+
	;

NEWLINE : ('\r' | '\n')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

INT_POSITIVE 	:	('0'..'9')+;

INT  :	('-')INT_POSITIVE | INT_POSITIVE;

DIGIT		: ('0'..'9');

ID		: ('a'..'z'|'A'..'Z')('a'..'z'|DIGIT|'A'..'Z')*;

EQUAL 		: '=';

L_PAREN		: '(';

R_PAREN		: ')';

L_BRACKET 	: '{';

R_BRACKET	: '}';

L_SQUARE    	: '[';

R_SQUARE    	: ']';

COMMA		: ',';

SEMICOLON	: ';';

FLOAT 		: (INT)'.'INT_POSITIVE;

ARITH_OP 	: '+'|'-'|'*'|'/'|'%';

REL_OP 		: '<'|'<='|'=='|'!='|'>='|'>'|'?'|':';

LOGIC_OP	: '&&'|'||';

EXPR	:
	INT  ('+' | '-' | '*' | '/') EXPR 
	| INT
	| '(' EXPR ')'
    ;

COMANDO_ATRIBUICAO :	
	(ID) (':=') EXPR 
	;

COMANDO_CONDICIONAL
	:	
	;
	
COMANDO_WHILE
	:
	;
	
COMANDO	: 
	COMANDO_ATRIBUICAO
	;

	


