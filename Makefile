FUZZFLAGS=-fsanitize=fuzzer,address,undefined

WORKERS=8
RUNS=500000

VENDOR_DIR=vendor
TREE_SITTER_DIR=${VENDOR_DIR}/tree-sitter
TREE_SITTER_HCL_DIR=${VENDOR_DIR}/tree-sitter-hcl

CORPUS=corpus

UBSAN_OPTIONS="print_stacktrace=1:halt_on_error=1:symbolize=1"
ASAN_OPTIONS="quarantine_size_mb=10:detect_leaks=1:symbolize=1"
FUZZ_OPTIONS=-max_len=${LEN} -runs=${RUNS} -workers=${WORKERS} -dict=hcl.dict -only_ascii

.PHONY: fuzz
fuzz: clean
	make fuzz_internal LEN=32 RUNS=500000 
	make fuzz_internal LEN=64 RUNS=250000 
	make fuzz_internal LEN=128 RUNS=125000
	make fuzz_internal LEN=256 RUNS=125000
	make fuzz_internal LEN=512 RUNS=60000
	make fuzz_internal LEN=1024 RUNS=60000

${VENDOR_DIR}:
	mkdir ${VENDOR_DIR}

${TREE_SITTER_DIR}: ${VENDOR_DIR}
	git clone https://github.com/tree-sitter/tree-sitter ${TREE_SITTER_DIR} -b ${TREE_SITTER_REVISION} --depth=1

${TREE_SITTER_HCL_DIR}: ${VENDOR_DIR}
	git clone https://github.com/MichaHoffmann/tree-sitter-hcl ${TREE_SITTER_HCL_DIR} -b ${TREE_SITTER_HCL_REVISION} --depth=1

.PHONY: fuzz_internal
fuzz_internal: fuzzer hcl.dict ${CORPUS}
	cp -r ${CORPUS} tmp
	UBSAN=${UBSAN_OPTIONS} ASAN_OPTIONS=${ASAN_OPTIONS} ./fuzzer ${FUZZ_OPTIONS} tmp
	./fuzzer -merge=1 ./corpus ./tmp
	rm -rf tmp

${CORPUS}: seed
	cp -r seed ${CORPUS}

.PHONY: clean
clean:
	rm -rf fuzzer parser.o scanner.o libtree-sitter.a *.log ${VENDOR_DIR}

fuzzer: parser.o scanner.o libtree-sitter.a
	clang++ -o fuzzer ${FUZZFLAGS} -std=c++11 fuzzer.cc -I$(TREE_SITTER_DIR)/lib/include scanner.o parser.o libtree-sitter.a

scanner.o: $(TREE_SITTER_HCL_DIR)
	clang++ -o scanner.o ${FUZZFLAGS} -std=c++11 -I$(TREE_SITTER_HCL_DIR)/src -c $(TREE_SITTER_HCL_DIR)/src/scanner.cc

parser.o: $(TREE_SITTER_HCL_DIR)
	clang -o parser.o ${FUZZFLAGS} -std=c99 -I$(TREE_SITTER_HCL_DIR)/src -c $(TREE_SITTER_HCL_DIR)/src/parser.c

hcl.dict: $(TREE_SITTER_HCL_DIR)
	python gen-dict.py $(TREE_SITTER_HCL_DIR)/src/grammar.json > hcl.dict
	echo '"$${"' >> hcl.dict
	echo '"%{"' >> hcl.dict

libtree-sitter.a: $(TREE_SITTER_DIR)
	make -C $(TREE_SITTER_DIR)
	cp $(TREE_SITTER_DIR)/libtree-sitter.a .

