%{
#include <stdlib.h>
#include <stdio.h>

int yylex();
int yyparse();
int yyerror(char*);

%}

%union {
  char *str;
  int   nb;
}

%token <int> I
%token <str> Id
%token Af Sk Se If Th El Wh Do Pl Mo Mu

%start C

%%

E: E Pl T
 | E Mo T
 | T
 ;
 
 
T: T Mu F
 | F
 ;

F: '(' E ')'
 | I
 | V
 ;

C: V Af E
 | Sk
 | '(' C ')'
 | If E Th C El C
 | Wh E Do C
 | C Se C
 ;

%%

int yyerror(char *s){
  fprintf(stderr, "***ERROR:%s***\n", s);
  return -1;
}
