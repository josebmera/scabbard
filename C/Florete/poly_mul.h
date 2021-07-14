#include"rlwr_params.h"

void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n);

void pol_mul_256(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n);

void myschool_book(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n); 

void pol_mul_sb(int16_t* a, int16_t* b, int16_t* res, uint16_t p, uint32_t n,uint32_t start);

void toom_cook_4way(const uint16_t* a1, const uint16_t* b1, uint16_t* result);

void toom_cook_3way(uint16_t *a,uint16_t *b,uint16_t *c,uint16_t mod);

int16_t reduce(int16_t a, int64_t p);





