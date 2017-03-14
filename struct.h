
#ifndef STRUCT_H
#define STRUCT_H

typedef enum { id, val, opr } nodeEnum;
typedef struct nodeTypeTag {
  nodeEnum type;
  
  union {
    int val;
    char* id;
    struct {int operator;
            int nbOfOperators;
            struct nodeTypeTag *operator[1];
           }
  };
} nodeType;

nodeType* nbr (int val); //constants
nodeType* var (char* id); //identifiers
nodeType* opr (int operator, int nbOfOperators, nodeTypeTag* operator[1]); //operators

#endif
