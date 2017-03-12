%{
#include <stdlib.h>
#include <stdio.h>

int yylex();
%}

%token <int> I
%token <str> Id
%token Af Sk Se If Th El Wh Do Pl Mo Mu

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
