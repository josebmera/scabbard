CC 		  = /usr/bin/gcc
CFLAGS  = -Wall -Wextra -O3 -fomit-frame-pointer -lcrypto -march=native 
CFLAGS2  = -Wall -Wextra -O3 -fomit-frame-pointer -march=native -std=c99 
CFLAGS3  = -Wall -Wextra -O3 -fomit-frame-pointer -fcommon -march=native 
CLANG   = clang -march=native -O3 -fomit-frame-pointer -fwrapv -Qunused-arguments
RM 		  = /bin/rm


all: test/test_kex \
     
SOURCES = pack_unpack.c poly.c rng.c fips202.c poly_mul.c cbd.c rlwr_indcpa.c kem.c verify.c 
HEADERS = rlwr_params.h pack_unpack.h poly.h rng.h fips202.h poly_mul.h cbd.h rlwr_indcpa.h kem.h verify.h



test/test_kex: $(SOURCES) $(HEADERS) test/test_kex.c 
	$(CC) $(CFLAGS3) -o $@ $(SOURCES) test/test_kex.c -lcrypto

rng.o: rng.c
	$(CC) $(CFLAGS2) -c rng.c -lcrypto -o $@ 

fips202.o: fips202.c
	$(CLANG) -c $^ -o $@

.PHONY: clean test

test: 
	./test/test_kex
	
clean:
	-$(RM) -f *.o
	-$(RM) -rf test/test_kex
