.PHONY: default all clean
.SUFFIXES: .c .s .ll .wast .wasm
.PRECIOUS: %.ll %.s %.wast

default: all

all: add.wasm jscall.wasm

clean:
	rm -f *.ll *.s *.wast *.wasm

server:
	npm install
	npm start

.c.ll:
	clang -emit-llvm --target=wasm32 -S -o $@ $^

.ll.s:
	llc $^ -march=wasm32 -filetype=asm -o $@

.s.wast:
	s2wasm --allocate-stack 1048576 $^ > $@
	# XXX: dirty hack
	# see. https://github.com/WebAssembly/binaryen/commit/7e3917884152eda021cff9107b5f789aee92fb1b
	perl -pi -e 's/\(memory (\d+)\)/\(memory \1/g' $@
	perl -pi -e 's/\(data \([\w\.]+ (\d+)\)/  \(segment \1/g' $@
	perl -pi -e 's/(\s*)(\(export "memory" memory\))/\1)\n\1\2/g' $@

.wast.wasm:
	sexpr-wasm -o $@ $^
