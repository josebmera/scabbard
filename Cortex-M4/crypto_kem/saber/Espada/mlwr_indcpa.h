#ifndef INDCPA_H
#define INDCPA_H
#include <string.h>
#include <stdint.h>
#include "poly.h"
#include "pack_unpack.h"
#include "poly_mul.h"
#include "randombytes.h"
#include "fips202.h"
#include "params.h"

#define h1 (1<<(mlwr_EQ-mlwr_EP-1))

#define h2 ( (1<<(mlwr_EP-5)) - (1<<(mlwr_EP-mlwr_ET-1)) + (1<<(mlwr_EQ-mlwr_EP-1)))


void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk);
void indcpa_kem_enc(unsigned char *message, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext);
void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char *message_dec);


unsigned char MatrixVectorMul_encryption_cmp(const unsigned char *seed, unsigned char *sk, unsigned char *ciphertext);
void InnerProd(const uint8_t *byte_array,const uint8_t *sk,uint16_t res[mlwr_N]);
void MatrixVectorMul_enc(const unsigned char *seed, uint8_t *sk, uint8_t *ciphertext);
void MatrixVectorMul_keygen(const unsigned char *seed, uint8_t *sk, uint16_t res[mlwr_K][mlwr_N]);
unsigned char indcpa_kem_enc_cmp(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext);


void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec);
void byte_bank2pol_part(unsigned char *bytes, uint16_t pol_part[], uint16_t pol_part_start_index, uint16_t num_8coeff);
void GenMatrix_poly(uint16_t temp_ar[], const unsigned char *seed, uint16_t poly_number);

#endif

