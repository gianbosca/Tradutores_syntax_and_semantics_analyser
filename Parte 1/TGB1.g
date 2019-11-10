grammar TGB1;

options {
	language=Java;
}

@header{
import java.lang.*; 
}

@members {
  String s;
  String x;
  String y;
}

prog : COMANDO ;

ID: 		('a'..'z')+ ;

WS:		(' '|'\n'|'\r')+ {skip();} ; // ignore whitespace

NUMBER  :	('0'..'9')+;


  

B1	returns [int xx]:
	('TRAS') ' ' NUMBER {$xx+= Integer.parseInt($NUMBER.text); System.out.println($xx);}
	;
	
	
B2	returns [int zz]:
	('FRENTE') ' ' NUMBER {$zz-= Integer.parseInt($NUMBER.text); System.out.println($zz);}
	;
	

COMANDO returns [String aa]:  (B1) ' ENTAO ' (B2) {$aa=$aa+$B1.xx;System.out.println($aa);};
