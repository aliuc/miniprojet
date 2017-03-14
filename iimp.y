%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "cell.h"

int yylex();
int yyparse();
int yyerror(char*);

int retValue (int oper, int nb1, int nb2);

%}

%union {
  char *str;
  int   nb;
}

%start C

%token <int> I
%token <str> Id
%token Af Sk Se If Th El Wh Do Pl Mo Mu


%%

E: Pl T              { $$ = $2; }
 | Mo T              { $$ = retValue('-', NULL, $2); }
 | T                 { $$ = $1; }
 ;
 
 
T: T Mu F            { $$ = retValue('*', $1, $3); }
 | F                 { $$ = $1; }
 ;

F: '(' E ')'         { $$ = $2; }
 | I                 { $$ = $1; }
 | V                 { $$ = $1; }
 ;

C: V Af E            { $$ = $3; }
 | Sk                { return 1; }
 | '(' C ')'         { $$ = $2; }
 | If E Th C El C    { $$ = $2 ? $4 : $6 }
 | Wh E Do C         { while ($2 != 0) { $$ = $4; }}
 | E
 ;

%%

int retValue(int oper, int nb1, int nb2){
nodeType *p;
p = malloc(sizeof(nodeType));
p->oper = oper;
p->nb1 = nb1;
p->nb2 = nb2;
return(pointer2output(p)); }

int yyerror(char *s){
  fprintf(stderr, "***ERROR:%s***\n", s);
  return -1;
}

int main(int argn, char **argv){
	yyparse();
	return 0;
}
