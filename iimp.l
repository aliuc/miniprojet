%{
  #include <stdlib.h>
  #include <stdio.h>
}%
%%

[0-9]+          { return I; }
:=              { return Af; }
Skip            { return Sk; }
;               { return Se; }
if              { return If; }
then            { return Th; }
else            { return El; }
while           { return Wh; }
do              { return Do; }
\+              { return Pl; }
\-              { return Mo; }
\*              { return Mu; }
[A-Za-z0-9]+    { yylval.id = strdup(yytext);
                  return V; }

%%
