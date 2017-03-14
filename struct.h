
#ifndef STRUCT_H
#define STRUCT_H

typedef enum { typeConstant, typeIdentifier, typeOperator } nodeEnum;
typedef struct nodeTypeTag {
  nodeEnum type;
  
  union {
    int cst;
    char* id;
    struct {int operator;
            int nbOfOperators;
            struct nodeTypeTag *operator[1];
           }
  };
} nodeType;

nodeType* nbr (int cst); //constants
nodeType* var (char* id); //identifiers
nodeType* opr (int operator, int nbOfOperators); //operators

#endif
