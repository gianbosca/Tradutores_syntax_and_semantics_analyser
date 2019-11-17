grammar TGB2;

options {
	language=Java;
}

@members {

}

prog : comando+;

id		: 
	(LETTER_LOW|LETTER_UP|UNDER_SCORE) (LETTER_LOW|LETTER_UP|INT_POS|UNDER_SCORE)*;

WS:		(' '|'\n'|'\t'|'\r'|'\cr')+ {skip();} ; // ignore whitespace

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

REL_OP 		: '<'|'<='|'='|'!='|'>='|'>'|'?'|':';

LOGIC_OP	: '&&'|'||';

expr_op :
	  ((INT_POS|id) '+' expr_op)
	| ((INT_POS|id) '-' expr_op) 
	| ((INT_POS|id) '*' expr_op) 
	| ((INT_POS|id) '/' expr_op)
	| id
	| INT_POS
	| (L_PAREN expr_op R_PAREN)
	    ;
	
expr_rel: (expr_op REL_OP expr_op) ;
	
comando_atrib :	
	id ATRIB expr_op SEMICOLON
	;
	
somethingElse: 
	('else' comando)
	|;
	
comando_if
	: ('if ' expr_rel 'then' comando somethingElse);

comando: 
	(comando_if) | (comando_atrib);
