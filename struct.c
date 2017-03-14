#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "struct.h"

nodeType* nbr (int val){
  nodeType* p;
  p->type = typeCOnstant;
  p->val = val;
  return p;
}

nodeType* id (char* id){
  nodeType* p;
  p->type = typeIdentifier;
  p->id = id;
  return p;
}

nodeType* opr (int operator, int nbOfOperators){
  nodeType* p;
  p->type = typeOperator;
  p->opr.operator = operator;
  p->opr.nbOfOperators = nbOfOperators;
  return p;
}


  
