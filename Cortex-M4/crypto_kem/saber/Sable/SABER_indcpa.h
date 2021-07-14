#ifndef INDCPA_H
#define INDCPA_H
#include <string.h>
#include <stdint.h>
#include "poly.h"
#include "pack_unpack.h"
#include "poly_mul.h"
#include "fips202.h"
#include "params.h"
#include "randombytes.h"

#define h1 (1<<(SABER_EQ-SABER_EP-1))
#define h2 ( (1<<(SABER_EP-2)) - (1<<(SABER_EP-SABER_ET-1)) + (1<<(SABER_EQ-SABER_EP-1)) )

void VectorMul(const unsigned char *pk,uint8_t *sk,uint16_t res[SABER_N]);
void MatrixVectorMul_keypair(const unsigned char *seed, uint8_t *sk, uint16_t res[SABER_K][SABER_N], uint16_t mod);
void MatrixVectorMul_encryption(const unsigned char *seed, uint8_t *sk, unsigned char *ciphertext, uint16_t mod);
void expand(uint8_t* b, uint16_t* res);
void byte_bank2pol_part(unsigned char *bytes, uint16_t pol_part[], uint16_t pol_part_start_index, uint16_t num_8coeff);
void GenMatrix_poly(uint16_t temp_ar[], const unsigned char *seed, uint16_t poly_number);
void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec);
void indcpa_keypair(unsigned char *pk, unsigned char *sk);
void indcpa_client(unsigned char *pk, unsigned char *b_prime, unsigned char *c, unsigned char *key);
void indcpa_server(unsigned char *pk, unsigned char *b_prime, unsigned char *c, unsigned char *key);
void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk);
void indcpa_kem_enc(unsigned char *message, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext);
void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char *message_dec);
unsigned char indcpa_kem_enc_cmp(unsigned char *message, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext);

#endif

