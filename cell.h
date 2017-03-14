
#ifndef CELL_H
#define CELL_H

typedef enum { cellId, cellConst, cellOpr } cellType;
typedef struct cell{
  enum cellType nodetype;
  
  union{
    char* id;
    int val;
    struct { int oper;
            int nbOfOper;
            struct { struct cell *left, *right; char* operator; } operator;
           } oper;
  } body;
} cell;


  
  
  
  
    
    
  

#endif
