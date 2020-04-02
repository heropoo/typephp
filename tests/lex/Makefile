run: build
	./token < test.php

build: lex
	clang lex.yy.c -o token

lex: token.l
	lex token.l

clean: 
	- rm -rf token lex.yy.c 
