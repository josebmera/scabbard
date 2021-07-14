#include "../rlwr_params.h"

#define AVX_N 16
#define small_len_avx (AVX_N >> 2)

#define SCHB_N 16

#define N_SB 64
#define N_SB_RES (2*N_SB-1)

#define N_SB_16 (N_SB >> 2)
#define N_SB_16_RES (2*N_SB_16-1)

#define AVX_N1 48 /*N/16*/ 

#define small_len_avx1 16
#define SCM_SIZE 16

