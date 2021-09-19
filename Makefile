FUZZFLAGS=-fsanitize=fuzzer,address,undefined

WORKERS=4

TREE_SITTER_DIR=vendor/tree-sitter
TREE_SITTER_HCL_DIR=vendor/tree-sitter-hcl

.PHONY: fuzz
fuzz: fuzzer hcl.dict
	UBSAN="print_stacktrace=1:halt_on_error=1:symbolize=1"  ASAN_OPTIONS="quarantine_size_mb=10:detect_leaks=1:symbolize=1" ./fuzzer -workers=${WORKERS} -dict=hcl.dict corpus/

.PHONY: clean
clean:
	rm -f fuzzer parser.o scanner.o libtree-sitter.a *.log

fuzzer: parser.o scanner.o libtree-sitter.a
	clang++ -o fuzzer ${FUZZFLAGS} -std=c++11 fuzzer.cc -I$(TREE_SITTER_DIR)/lib/include scanner.o parser.o libtree-sitter.a

scanner.o: $(TREE_SITTER_HCL_DIR)/src/scanner.cc
	clang++ -o scanner.o ${FUZZFLAGS} -std=c++11 -I$(TREE_SITTER_HCL_DIR)/src -c $(TREE_SITTER_HCL_DIR)/src/scanner.cc

parser.o: $(TREE_SITTER_HCL_DIR)/src/parser.c
	clang -o parser.o ${FUZZFLAGS} -std=c99 -I$(TREE_SITTER_HCL_DIR)/src -c $(TREE_SITTER_HCL_DIR)/src/parser.c

hcl.dict: $(TREE_SITTER_HCL_DIR)/grammar.js
	python gen-dict.py $(TREE_SITTER_HCL_DIR)/src/grammar.json > hcl.dict
	echo '"$${"' >> hcl.dict
	echo '"%{"' >> hcl.dict

libtree-sitter.a: $(TREE_SITTER_DIR)
	make -C $(TREE_SITTER_DIR)
	cp $(TREE_SITTER_DIR)/libtree-sitter.a .

