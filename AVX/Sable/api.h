//
//  api.h
//
//  Created by Bassham, Lawrence E (Fed) on 9/6/17.
//  Copyright © 2017 Bassham, Lawrence E (Fed). All rights reserved.
//


//   This is a sample 'api.h' for use 'sign.c'

#ifndef api_h
#define api_h

// Available algorithms for different security levels
#define LightSaber 1
#define Saber 2
#define FireSaber 3

// Change the algorithm name 
//#define SABER_TYPE LightSaber
#define SABER_TYPE Saber
//#define SABER_TYPE FireSaber

//  Set these three values apropriately for your algorithm
#if SABER_TYPE == LightSaber
	#define CRYPTO_ALGNAME "LightSaber"
	#define CRYPTO_SECRETKEYBYTES 1376
	#define CRYPTO_PUBLICKEYBYTES 608
	#define CRYPTO_BYTES 32
	#define CRYPTO_CIPHERTEXTBYTES 672
	#define Saber_type 1
#elif SABER_TYPE == Saber
	#define CRYPTO_ALGNAME "Saber"
	#define CRYPTO_SECRETKEYBYTES 2016
	#define CRYPTO_PUBLICKEYBYTES 896
	#define CRYPTO_BYTES 32
	#define CRYPTO_CIPHERTEXTBYTES 1024
	#define Saber_type 2
#elif SABER_TYPE == FireSaber
	#define CRYPTO_ALGNAME "FireSaber"
	#define CRYPTO_SECRETKEYBYTES 2912
	#define CRYPTO_PUBLICKEYBYTES 1312
	#define CRYPTO_BYTES 32
	#define CRYPTO_CIPHERTEXTBYTES 1376
	#define Saber_type 3
#endif


int crypto_kem_keypair(unsigned char *pk, unsigned char *sk);
int crypto_kem_enc(unsigned char *ct, unsigned char *ss, const unsigned char *pk);
int crypto_kem_dec(unsigned char *ss, const unsigned char *ct, const unsigned char *sk);

#endif /* api_h */
