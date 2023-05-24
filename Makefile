gen-object:
	# -c stands from compile without link
	cc -c ./src/num.c -o ./lib/num.o

gen-dynamiclib:
	cc --shared ./src/num.o -o ./lib/libnum.so

gen-staticlib:
	ar -rcs ./src/libnum.a ./lib/num.o

build-rust-dynamic
	# -L add directory lib to library search path
	# -l to links generated crate to specified library num(which transalate to libnum)
	rustc ./src/main.rs -l dylib=num -L ./lib -o ./main

build-rust-static
	# -L add directory lib to library search path
	# -l to links generated crate to specified library num(which transalate to libnum)
	rustc ./src/main.rs -l static=num -L ./lib -o ./main
