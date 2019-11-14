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

prog : comando another_comando;

ID: 		('a'..'z')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

NUMBER  :	('0'..'9')+;


tras	:
	('TRAS') ' ' NUMBER {y-= Integer.parseInt($NUMBER.text); System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
	
frente	:
	('FRENTE') ' ' NUMBER {y+= Integer.parseInt($NUMBER.text); System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
direita	:
	('DIREITA') ' ' NUMBER {x+= Integer.parseInt($NUMBER.text); System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
	
esquerda:
	('ESQUERDA') ' ' NUMBER {x-= Integer.parseInt($NUMBER.text); System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	

basico	:	 
	frente|tras|direita|esquerda;

comando :  (basico);

another_comando 
	: (' ENTAO ' (basico))+ ;
