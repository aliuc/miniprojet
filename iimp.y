%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "tree.h"

int yylex();
int yyparse();
int yyerror(char*);

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
 | Mo T              { $$ = make_operator(NULL, '-', $2); }
 | T                 { $$ = $1; }
 ;
 
 
T: T Mu F            { $$ = make_operator($1, '*', $3); }
 | F                 { $$ = $1; }
 ;

F: '(' E ')'         { $$ = $2; }
 | I                 { $$ = make_variable(&$1); printf("%s", yylval.a_variable);}
 | V                 { $$ = make_number($1); }
 ;

C: V Af E            { $$ = $3; }
 | Sk                { return 1; }
 | '(' C ')'         { $$ = $2; }
 | If E Th C El C    { if ($2 != 0) { $$ = $4; } else { $$ = $6; } }
 | Wh E Do C         { while ($2 != 0) { $$ = $4; }}
 | E
 ;

%%

int yyerror(char *s){
  fprintf(stderr, "***ERROR:%s***\n", s);
  return -1;
}

int main(int argn, char **argv){
	yyparse();
	return 0;
}
