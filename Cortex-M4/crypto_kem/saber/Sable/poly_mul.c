#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "poly_mul.h"

extern void polymul_asm(uint16_t *r, const uint16_t *a, const uint16_t *b);


void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n)
{
    uint32_t i;
    uint16_t c[2*n - 1];

    polymul_asm(c, a, b);
    for (i = n; i < 2*n-1; i++){
        res[i - n] += (c[i - n] - c[i]);// & (p - 1);
    }
    res[n - 1] += c[n - 1];
}

void pol_mul_sch(uint16_t* a, uint8_t* b, uint16_t* res)
{
    uint32_t i,n=256;
    uint16_t c[2*n - 1],d[n];

    for(i=0;i<(n/4);i++)
    {
        d[4*i] = ((b[i]& 0x03) ^ 0x2 ) - 0x2;
	d[4*i+1] = (((b[i]>>2) & 0x03) ^ 0x2 ) - 0x2;
	d[4*i+2] = (((b[i]>>4) & 0x03) ^ 0x2 ) - 0x2;
	d[4*i+3] = (((b[i]>>6) & 0x03) ^ 0x2 ) - 0x2;
    }
    toom_cook_4way_mem_asm(c,a,d);
    /*polymul_asm(c,a,d);
    for (i = n; i < 2*n-1; i++){
        res[i - n] += (c[i - n] - c[i]);// & (p - 1);
    }
    res[n - 1] += c[n - 1];
    */
}

