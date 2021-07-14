#include "api.h"

#ifndef PARAMS_H
#define PARAMS_H




#define rlwr_MU 2
#define rlwr_ET 4

#define rlwr_EQ 10 
#define rlwr_EP 9

#define rlwr_N 768
#define rlwr_Q 1024 
#define rlwr_P 512 

#define rlwr_SEEDBYTES       32
#define rlwr_NOISESEEDBYTES  32
#define rlwr_COINBYTES       32
#define rlwr_KEYBYTES        32

#define rlwr_HASHBYTES       32







#define rlwr_POLYBYTES       960 //10*768/8 

#define rlwr_POLYCOMPRESSEDBYTES  864 //9*768/8 NOTE : changed till here due to parameter adaptation

#define rlwr_CIPHERTEXTBYTES (rlwr_POLYCOMPRESSEDBYTES)

#define rlwr_SCALEBYTES_KEM ((rlwr_ET)*rlwr_N/8)

#define rlwr_INDCPA_PUBLICKEYBYTES (rlwr_POLYCOMPRESSEDBYTES + rlwr_SEEDBYTES)
#define rlwr_INDCPA_SECRETKEYBYTES 192 //2*768/8

#define rlwr_PUBLICKEYBYTES (rlwr_INDCPA_PUBLICKEYBYTES)

#define rlwr_SECRETKEYBYTES (rlwr_INDCPA_SECRETKEYBYTES +  rlwr_INDCPA_PUBLICKEYBYTES + rlwr_HASHBYTES + rlwr_KEYBYTES)

#define rlwr_BYTES_CCA_DEC   (rlwr_POLYCOMPRESSEDBYTES + rlwr_SCALEBYTES_KEM) 




#endif

