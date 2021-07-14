#include "../mlwr_params.h"

#define AVX_N 16
#define small_len_avx (AVX_N >> 2)

#define SCHB_N 16

#define AVX_N1 4 /*N/16*/ 

#define SCM_SIZE 16

// The dimension of a vector. i.e vector has NUM_POLY elements and Matrix has NUM_POLY X NUM_POLY elements
#define NUM_POLY mlwr_K
//int NUM_POLY=2; 
