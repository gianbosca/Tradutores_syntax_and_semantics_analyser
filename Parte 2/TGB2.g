grammar TGB2;

options {
	language=Java;
}

prog : (comando SEMICOLON)+
	;

NEWLINE : ('\r' | '\n')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

INT_POS :('0'..'9')+ {$INT_POS.text};

id		: 
	('a'..'z'|'A'..'Z')('a'..'z'|'A'..'Z'|'0'..'9')*;
	
equal 		: ':=';

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
	id equal expr 
	;

	
comando	: 
	comando_atrib
	;

