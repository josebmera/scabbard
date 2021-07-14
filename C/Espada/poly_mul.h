#include"mlwr_params.h"

#define mlwr_N 64
#define N_SM (mlwr_N >> 1)
#define N_SM_RES (2*N_SM-1)
#define N_SM_16 (N_SM >> 1)
#define N_SM_16_RES (2*N_SM_16-1)

void pol_mul_64(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p);

void karatsuba_simple(const uint16_t* a_1,const uint16_t* b_1, uint16_t* result_final);

static inline int16_t reduce(int16_t a, int64_t p);

void evaluation_single(const uint16_t *b, uint16_t bw_ar[3][3][N_SM_16]);

void TC_evaluation(const uint16_t* a1, uint16_t bw_ar[3][3][N_SM_16], uint16_t w_ar[3][3][N_SM_16_RES]);

void TC_interpolation(uint16_t w_ar[3][3][N_SM_16_RES], uint16_t *result);
