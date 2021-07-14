#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "poly_mul.h"

extern void polymul_asm( uint16_t *r, const uint16_t *a, const uint16_t *b );

void pol_mul_64(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p)
{ 
	uint32_t i;
	
//-------------------normal multiplication-----------------

	uint16_t c[128];

	for (i = 0; i < 128; i++) c[i] = 0;
	
	polymul_asm( c, a, b );

	//---------------reduction-------
	for(i=64;i<128;i++){
		res[i-64]=(c[i-64]-c[i])&(p-1);
	}
	
}

void pol_mul_64_sch(uint16_t* a, uint8_t* b, uint16_t* res, uint16_t p)
{ 
	uint32_t i,j;
	uint16_t temp1,d[mlwr_N];
	uint16_t temp2;
	
//-------------------normal multiplication-----------------

	uint16_t c[128];

	for (i = 0; i < 128; i++) c[i] = 0;
	
	for (i = 0; i < (mlwr_N/2); i++)
	{
		d[2*i] = ((b[i]& 0x0f) ^ 0x8 ) - 0x8;
		d[2*i+1] = (((b[i] & 0xf0)>>4) ^ 0x8 ) - 0x8;
	}	
	
	polymul_asm( c, a, d );
	
	//---------------reduction-------
	for(i=64;i<128;i++){
		res[i-64]=(c[i-64]-c[i])&(p-1);
	}
	
}
