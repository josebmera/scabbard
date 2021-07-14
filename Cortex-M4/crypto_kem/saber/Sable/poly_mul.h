#ifndef POLYMUL_H
#define POLYMUL_H

#include "params.h"

void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n);
void pol_mul_sch(uint16_t* a, uint8_t* b, uint16_t* res);
//void toom_cook_4way_mem(const uint16_t* a1,const uint16_t* b1, uint16_t* result_final);
#define toom_cook_4way_mem(a,b,c) polymul_asm(a,b,c,SABER_Q,SABER_N)
//#define toom_cook_4way_mem toom_cook_4way_mem_asm

extern void toom_cook_4way_mem_asm(const uint16_t* a1,const uint16_t* b1, uint16_t* result);

#endif
