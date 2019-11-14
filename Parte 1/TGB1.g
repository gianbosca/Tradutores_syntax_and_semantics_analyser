grammar TGB1;

options {
	language=Java;
}

@header{
import java.lang.*; 
}

@members {
  int x;
  int y;
 }

prog : comando another_comando+;

ID: 		('a'..'z')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

NUMBER  :	('0'..'9')+;


tras	:
	('TRAS') ' ' NUMBER {y-= Integer.parseInt($NUMBER.text); }
	;
	
	
frente	:
	('FRENTE') ' ' NUMBER {y+= Integer.parseInt($NUMBER.text); }
	;
	
direita	:
	('DIREITA') ' ' NUMBER {x+= Integer.parseInt($NUMBER.text); }
	;
	
	
esquerda:
	('ESQUERDA') ' ' NUMBER {x-= Integer.parseInt($NUMBER.text); }
	;
	

basico	:	 
	frente|tras|direita|esquerda;
	
comando_entao: (' ENTAO ' (basico) {System.out.println("x: "+x+"\ny: "+y+"\n");})+ ;

comando_apos: (' APOS ' (basico) {System.out.println("x: "+x+"\ny: "+y+"\n");})+ ;

comando :  (basico  {System.out.println("x: "+x+"\ny: "+y+"\n");});

another_comando 
	: comando_entao | comando_apos;
