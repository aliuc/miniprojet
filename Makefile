all: build

iimp.tab.c iimp.tab.h: iimp.y
        bison -d iimp.y
        
lex.yy.c: iimp.l iimp.tab.h
        flex iimp.l
        
build: lex.yy.c iimp.tab.c iimp.tab.h
       gcc -o iimp iimp.tab.c lex.yy.c -lfl
       
clean:
       rm iimp iimp.tab.c lex.yy.c iimp.tab.h
