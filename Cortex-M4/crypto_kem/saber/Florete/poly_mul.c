#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "poly_mul.h"

#define con_N 256


extern void polymul_asm(uint16_t *r, const uint16_t *a, const uint16_t *b);

void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res)
{ 
	uint32_t i;

	uint16_t c[2*rlwr_N];
	memset(c,0,2*rlwr_N*sizeof(uint16_t));

	//toom_cook_3way(a, b, c);
	polymul_asm(c, a, b);

	//---------------reduction-------
	for(i=0;i<((rlwr_N/2)-1);i++){
		res[i]=(c[i]-c[i+rlwr_N]-c[i+rlwr_N+(rlwr_N/2)]);
	}
	res[(rlwr_N/2)-1]=(c[(rlwr_N/2)-1]-c[(rlwr_N/2)-1+rlwr_N]);
	for(i=(rlwr_N/2);i<rlwr_N;i++){
		res[i]=(c[i]+c[i+(rlwr_N/2)]);
	}

}


void toom_cook_3way(uint16_t *a,uint16_t *b,uint16_t *c)
{
	int16_t j;
	uint16_t r0[2*con_N],r1[2*con_N],r2[2*con_N],r3[2*con_N],r4[2*con_N],s0,s1,s2,s3,s4;
	uint16_t inv3 = 2731;
	
	//Evaluation
	
	for(j=0;j<con_N;j++)
	{
		s0 = a[j]+a[(2*con_N)+j];
		r0[j] = a[j];//a(0)
		r1[j] = s0+a[con_N+j];//a(1)
		r2[j] = s0-a[con_N+j];//a(-1)
		r3[j] = ((r2[j]+a[(2*con_N)+j])<<1)-a[j];//a(-2)
		r4[j] = a[(2*con_N)+j];//a(inf)
	}
	for(j=0;j<con_N;j++)
	{
		s0 = b[j]+b[(2*con_N)+j];
		r0[con_N+j] = b[j];//b(0)
		r1[con_N+j] = s0+b[con_N+j];//b(1)
		r2[con_N+j] = s0-b[con_N+j];//b(-1)
		r3[con_N+j] = ((r2[con_N+j]+b[(2*con_N)+j])<<1)-b[j];//b(-2)
		r4[con_N+j] = b[(2*con_N)+j];//b(inf)
		
	}	
	
	polymul_asm(r0,r0,&r0[con_N]);//c(0)
	polymul_asm(r1,r1,&r1[con_N]);//c(1)
	polymul_asm(r2,r2,&r2[con_N]);//c(-1)
	polymul_asm(r3,r3,&r3[con_N]);//c(-2)
	polymul_asm(r4,r4,&r4[con_N]);//c(inf)

		
	//Interpolation
	
	for(j=0;j<(2*con_N-1);j++)
	{
		s0 = r0[j];
		s4 = r4[j];
		s1 = (r1[j]-r2[j])>>1;
		s2 = r2[j]-r0[j];
		s3 = ((s2-((r3[j]-r1[j])*inv3))>>1)+(r4[j]<<1);
		s2 = s2+s1-s4;
		s1 = s1-s3;
		
		//Reduction

		c[j] += s0;
		c[j+con_N] += s1;
		c[j+(2*con_N)] += s2;
		c[j+(3*con_N)] += s3;
		c[j+(4*con_N)] += s4;
	}
	
}
