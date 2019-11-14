grammar TGB2;

options {
	language=Java;
}

prog : (comando SEMICOLON)+
	;

id		: 
	(LETTER_LOW|LETTER_UP|'_') (LETTER_LOW|LETTER_UP|INT_POS|'_')*;

NEWLINE : 	('\r' | '\n')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

INT_POS :	('0'..'9')+ ;

LETTER_UP
	: 	 'A'..'Z';
	
LETTER_LOW
	: 	 'a'..'z';

UNDER_SCORE 
	:	 '_';
	
ATRIB 		: ':=';

L_PAREN		: '(';

R_PAREN		: ')';

L_BRACKET 	: '{';

R_BRACKET	: '}';

L_SQUARE    	: '[';

R_SQUARE    	: ']';

COMMA		: ',';

SEMICOLON	: ';';

FLOAT 		: INT_POS '.' INT_POS;

ARITH_OP 	: '+'|'-'|'*'|'/'|'%';

REL_OP 		: '<'|'<='|'=='|'!='|'>='|'>'|'?'|':';

LOGIC_OP	: '&&'|'||';

expr :
	INT_POS '+' expr 
	| INT_POS '-' expr 
	| INT_POS '*' expr 
	| INT_POS '/' expr 
	| INT_POS 
	| '(' expr ')'
    ;

comando_atrib :	
	id ATRIB expr 
	;

	
comando	: 
	comando_atrib
	;

