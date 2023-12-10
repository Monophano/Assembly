hello:
	gcc src/hello.S -c -o hello.o
	ld hello.o -o build/hello

input:
	gcc src/input.S -c -o input.o
	ld input.o -o build/input

if:
	gcc src/if.S -c -o if.o
	ld if.o -o build/if