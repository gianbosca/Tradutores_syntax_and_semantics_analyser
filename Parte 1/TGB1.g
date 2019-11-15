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
  int xTemp =0 ;
  int yTemp =0 ;
 }

prog : comando;

ID: 		('a'..'z')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

NUMBER  :	('0'..'9')+;


tras	:
	('TRAS') ' ' NUMBER 
	{if(yTemp!=0) y-= Integer.parseInt($NUMBER.text) + yTemp; else y-= Integer.parseInt($NUMBER.text); } 
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
	
frente	:
	('FRENTE') ' ' NUMBER 
	{if(yTemp!=0) y+= Integer.parseInt($NUMBER.text) + yTemp; else y+= Integer.parseInt($NUMBER.text); } 
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
direita	:
	('DIREITA') ' ' NUMBER 
	{if(xTemp!=0) x+= Integer.parseInt($NUMBER.text) + xTemp; else x+= Integer.parseInt($NUMBER.text); } 
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
	
esquerda:
	('ESQUERDA') ' ' NUMBER 
	{if(xTemp!=0) x-= Integer.parseInt($NUMBER.text) - xTemp; else x-= Integer.parseInt($NUMBER.text); } 
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;	
	
	
trasApos:
	('TRAS') ' ' NUMBER ' APOS ' 
	{yTemp-= Integer.parseInt($NUMBER.text); }
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
	
frenteApos:
	('FRENTE') ' ' NUMBER ' APOS ' 
	{yTemp+= Integer.parseInt($NUMBER.text); }
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
direitaApos:	
	('DIREITA') ' ' NUMBER ' APOS '  
	{xTemp+= Integer.parseInt($NUMBER.text); }
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	
esquerdaApos:
	('ESQUERDA') ' ' NUMBER ' APOS ' 
	{xTemp-= Integer.parseInt($NUMBER.text);} 
	{System.out.println("x: "+x+"\ny: "+y+"\n");}
	;
	

basico	:	 
	frente|tras|direita|esquerda;
	
basicoEntao: basico ' ENTAO ';

basicoApos: esquerdaApos|direitaApos|frenteApos|trasApos;

comando_entao: (basicoEntao basico) ;

comando_apos: (basicoApos basico) ;

comando :   comando_entao | comando_apos | basico;

