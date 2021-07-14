#include "api.h"

#ifndef PARAMS_H
#define PARAMS_H




#define mlwr_K 12
#define mlwr_MU 6
#define mlwr_ET 7 //3+4
#define mlwr_EQ 15 
#define mlwr_EP 13

#define mlwr_N 64
#define modQ 32767 
#define modP 8191 

#define mlwr_SEEDBYTES       32
#define mlwr_NOISESEEDBYTES  32
#define mlwr_COINBYTES       32
#define mlwr_KEYBYTES        32

#define mlwr_HASHBYTES       32

#define mlwr_POLYBYTES       120 //15*64/8 

#define mlwr_POLYVECBYTES    (mlwr_K * mlwr_POLYBYTES)   

#define mlwr_POLYVECCOMPRESSEDBYTES (mlwr_K * 104) //13*64/8 NOTE : changed till here due to parameter adaptation

#define mlwr_CIPHERTEXTBYTES (mlwr_POLYVECCOMPRESSEDBYTES)

#define mlwr_SCALEBYTES_KEM ((mlwr_ET)*mlwr_N/8)

#define mlwr_INDCPA_PUBLICKEYBYTES (mlwr_POLYVECCOMPRESSEDBYTES + mlwr_SEEDBYTES)

#define mlwr_INDCPA_SECRETKEYBYTES (mlwr_K * 32)//4*64/8

#define mlwr_PUBLICKEYBYTES (mlwr_INDCPA_PUBLICKEYBYTES)

#define mlwr_SECRETKEYBYTES (mlwr_INDCPA_SECRETKEYBYTES +  mlwr_INDCPA_PUBLICKEYBYTES + mlwr_HASHBYTES + mlwr_KEYBYTES)

#define mlwr_BYTES_CCA_DEC   (mlwr_POLYVECCOMPRESSEDBYTES + mlwr_SCALEBYTES_KEM) /* Second part is for Targhi-Unruh */


#define CRYPTO_SECRETKEYBYTES mlwr_SECRETKEYBYTES
#define CRYPTO_PUBLICKEYBYTES mlwr_PUBLICKEYBYTES
#define CRYPTO_BYTES 32
#define CRYPTO_CIPHERTEXTBYTES mlwr_BYTES_CCA_DEC

#endif

