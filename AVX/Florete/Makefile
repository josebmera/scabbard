CC 		  = /usr/bin/gcc
CFLAGS  = -Wall -Wextra -O3 -fomit-frame-pointer -msse2avx -mavx2 -march=native -lcrypto
CFLAGS2  = -Wall -Wextra -O3 -fomit-frame-pointer -msse2avx -mavx2 -march=native -std=c11 
CFLAGS3  = -Wall -Wextra -O3 -fomit-frame-pointer -msse2avx -mavx2 -fcommon -march=native
CLANG   = clang -march=native -O3 -fomit-frame-pointer -lcrypto -fwrapv -Qunused-arguments -w
RM 		  = /bin/rm


all: test/test_kex \

SOURCES = pack_unpack.c poly.c verify.c fips202.c fips202x4.c rlwr_indcpa.c kem.c \
					cbd.c crypto_stream_aes256ctr.c \
					keccak4x/KeccakP-1600-times4-SIMD256.c rng.c
#rng.o
#randombytes.c

SOURCES2 = pack_unpack.c rng.c poly.c verify.c fips202.c fips202x4.c rlwr_indcpa.c kem.c \
					cbd.c crypto_stream_aes256ctr.c \
					keccak4x/KeccakP-1600-times4-SIMD256.c

HEADERS = rlwr_params.h pack_unpack.h poly.h verify.h cbd.h rlwr_indcpa.h kem.h rng.h fips202.h fips202x4.h api.h randombytes.h


test/test_kex: $(SOURCES) $(HEADERS) test/test_kex.c 
	$(CC) $(CFLAGS3) -o $@ $(SOURCES) test/test_kex.c -lcrypto

test/test_sample_matrix: $(SOURCES) $(HEADERS) test/sample_matrix_test.c 
	$(CC) $(CFLAGS3) -o $@ $(SOURCES) test/sample_matrix_test.c -lcrypto

test/PQCgenKAT_kem: $(SOURCES2) $(HEADERS) test/PQCgenKAT_kem.c 
	$(CC) $(CFLAGS3) -o $@ $(SOURCES2) test/PQCgenKAT_kem.c -lcrypto  


keccak4x/KeccakP-1600-times4-SIMD256.o: keccak4x/KeccakP-1600-times4-SIMD256.c \
					keccak4x/align.h \
					keccak4x/brg_endian.h \
					keccak4x/KeccakP-1600-times4-SIMD256.c \
					keccak4x/KeccakP-1600-times4-SnP.h \
					keccak4x/KeccakP-1600-unrolling.macros \
					keccak4x/SIMD256-config.h

	$(CC) $(CFLAGS) -c keccak4x/KeccakP-1600-times4-SIMD256.c -o $@

rng.o: rng.c
	$(CC) $(CFLAGS2) -c rng.c -lcrypto -o $@ 

fips202.o: fips202.c
	$(CLANG) -c $^ -o $@

.PHONY: clean test

test:
	./test/test_kex


clean:
	-$(RM) -f *.o
	-$(RM) -rf test/test_sample_matrix
	-$(RM) -rf test/test_kex
	-$(RM) -rf test/PQCgenKAT_kem
	-$(RM) -rf keccak4x/KeccakP-1600-times4-SIMD256.o


