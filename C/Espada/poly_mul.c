#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include "poly_mul.h"

#define SCHB_N 16



void print_poly2(int16_t *a, int64_t n, uint64_t p){

	printf("-----------------------\n");
	int i;
	for (i = n - 1; i >= 0; i--){
		if (a[i] != 0){
			if(i!=0)
				printf("  Mod(%d,%lu)*x^%d + ", a[i], p+1,i);
			else
				printf("  Mod(%d,%lu)*x^%d ", a[i], p+1,i);

			}
	}

	printf("\n-----------------------\n");
}


void pol_mul_64(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p)

{ 
	// Polynomial multiplication using the schoolbook method, c[x] = a[x]*b[x] 
	// SECURITY NOTE: TO BE USED FOR TESTING ONLY.  

	uint32_t i,n=64;
	
//-------------------normal multiplication-----------------

	uint16_t c[2*n];

	for (i = 0; i < 2*n; i++) c[i] = 0;
	
	
	//myschool_book(a, b, c, p, n);
	//toom_cook_4way_64(a, b, c);
	karatsuba_simple(a,b,c);

	//---------------reduction-------
	for(i=n;i<2*n;i++){
		res[i-n]=(c[i-n]-c[i])&p;
	}
	
}

//----------------------------------lazy interpolation--------------------------------


void evaluation_single(const uint16_t *b, uint16_t bw_ar[3][3][N_SM_16]){ // for precomputing B

	uint16_t bw0[N_SM], bw1[N_SM], bw2[N_SM];

	uint16_t *B0, *B1;

	int j;

	B0 = (uint16_t*)b;
	B1 = (uint16_t*)&b[N_SM];

	for (j = 0; j < N_SM; j++) {
		bw2[j] = B0[j];
		bw0[j] = B1[j];
		bw1[j] = B0[j]+B1[j];
	}
	for (j = 0; j < N_SM_16; j++) {
		bw_ar[0][2][j] = bw0[j];
		bw_ar[0][0][j] = bw0[j+N_SM_16];
		bw_ar[0][1][j] = bw0[j]+bw0[j+N_SM_16];
	/*}
	for (j = 0; j < N_SM_16; j++) {*/
		bw_ar[1][2][j] = bw1[j];
		bw_ar[1][0][j] = bw1[j+N_SM_16];
		bw_ar[1][1][j] = bw1[j]+bw1[j+N_SM_16];
	/*}
	for (j = 0; j < N_SM_16; j++) {*/
		bw_ar[2][2][j] = bw2[j];
		bw_ar[2][0][j] = bw2[j+N_SM_16];
		bw_ar[2][1][j] = bw2[j]+bw2[j+N_SM_16];
	}

}

void TC_evaluation(const uint16_t* a1, uint16_t bw_ar[3][3][N_SM_16], uint16_t w_ar[3][3][N_SM_16_RES])//TC+TC unrolled
{

	uint16_t aw0[N_SM], aw1[N_SM], aw2[N_SM];
	uint16_t aw_00[N_SM_16], aw_01[N_SM_16], aw_02[N_SM_16],aw_10[N_SM_16], aw_11[N_SM_16], aw_12[N_SM_16],aw_20[N_SM_16], aw_21[N_SM_16], aw_22[N_SM_16];

	int i,j;

// EVALUATION
	for (j = 0; j < N_SM; j++) {
		aw2[j] = a1[j];
		aw0[j] = a1[j+N_SM];
		aw1[j] = a1[j]+a1[j+N_SM];
	}
// MULTIPLICATION	
	for (j = 0; j < N_SM_16; ++j) {
		aw_02[j] = aw0[j];
		aw_00[j] = aw0[j+N_SM_16];
		aw_01[j] = aw0[j]+aw0[j+N_SM_16];
		aw_12[j] = aw1[j];
		aw_10[j] = aw1[j+N_SM_16];
		aw_11[j] = aw1[j]+aw1[j+N_SM_16];
		aw_22[j] = aw2[j];
		aw_20[j] = aw2[j+N_SM_16];
		aw_21[j] = aw2[j]+aw2[j+N_SM_16];
	}
//c1=cpucycles();	
	for(i=0;i<N_SM_16;i++)
	{
		for(j=0;j<N_SM_16;j++)
		{
			w_ar[0][0][i+j] += aw_00[i]*bw_ar[0][0][j];
			w_ar[0][1][i+j] += aw_01[i]*bw_ar[0][1][j];
			w_ar[0][2][i+j] += aw_02[i]*bw_ar[0][2][j];
			w_ar[1][0][i+j] += aw_10[i]*bw_ar[1][0][j];
			w_ar[1][1][i+j] += aw_11[i]*bw_ar[1][1][j];
			w_ar[1][2][i+j] += aw_12[i]*bw_ar[1][2][j];
			w_ar[2][0][i+j] += aw_20[i]*bw_ar[2][0][j];
			w_ar[2][1][i+j] += aw_21[i]*bw_ar[2][1][j];
			w_ar[2][2][i+j] += aw_22[i]*bw_ar[2][2][j];		
		}
	}
//c2=cpucycles();
//count=count+(c2-c1);
	/*for (j = 0; j < N_SM_16; ++j) {
		aw_12[j] = aw1[j];
		aw_10[j] = aw1[j+N_SM_16];
		aw_11[j] = aw1[j]+aw1[j+N_SM_16];
	}

	for(i=0;i<N_SM_16;i++)
	{
		for(j=0;j<N_SM_16;j++)
		{
			w_ar[1][0][i+j] += aw_0[i]*bw_ar[1][0][j];
			w_ar[1][1][i+j] += aw_1[i]*bw_ar[1][1][j];
			w_ar[1][2][i+j] += aw_2[i]*bw_ar[1][2][j];	
		}
	}
	for (j = 0; j < N_SM_16; ++j) {
		aw_22[j] = aw2[j];
		aw_20[j] = aw2[j+N_SM_16];
		aw_21[j] = aw2[j]+aw2[j+N_SM_16];
	}
	for(i=0;i<N_SM_16;i++)
	{
		for(j=0;j<N_SM_16;j++)
		{
			w_ar[2][0][i+j] += aw_0[i]*bw_ar[2][0][j];
			w_ar[2][1][i+j] += aw_1[i]*bw_ar[2][1][j];
			w_ar[2][2][i+j] += aw_2[i]*bw_ar[2][2][j];	
		}
	}*/
	
}

void TC_interpolation(uint16_t w_ar[3][3][N_SM_16_RES], uint16_t *result){ //unrolled

	//printf("\nInterpolation called\n");

	uint16_t r0, r1, r2;

	uint16_t w0[N_SM_RES] = {0}, w1[N_SM_RES] = {0}, w2[N_SM_RES] = {0};

	int i;
	
	uint16_t * C;
	C = result;

	for (i = 0; i < N_SM_16_RES; ++i) {
		r0 = w_ar[0][1][i]-w_ar[0][0][i]-w_ar[0][2][i];
		r1 = w_ar[1][1][i]-w_ar[1][0][i]-w_ar[1][2][i];
		r2 = w_ar[2][1][i]-w_ar[2][0][i]-w_ar[2][2][i];
		w0[i]    +=w_ar[0][2][i];
		w0[i+16] +=r0;
		w0[i+32] +=w_ar[0][0][i];
		w1[i]    +=w_ar[1][2][i];
		w1[i+16] +=r1;
		w1[i+32] +=w_ar[1][0][i];
		w2[i]    +=w_ar[2][2][i];
		w2[i+16] +=r2;
		w2[i+32] +=w_ar[2][0][i];
	}	

	for (i = 0; i < N_SM_RES; i++) {
		r0 = w0[i];
		r1 = w1[i];
		r2 = w2[i];
		r1 = r1-(r0+r2);

		C[i]     += r2;
		C[i+32]  += r1;
		C[i+64]  += r0;
	}

}


//----------------------------------lazy interpolation ends---------------------------

void karatsuba_simple(const uint16_t* a_1,const uint16_t* b_1, uint16_t* result_final){//uses 10 registers

	uint16_t N=64;
	uint16_t d01[N/2-1];
	uint16_t d0123[N/2-1];
	uint16_t d23[N/2-1];
	uint16_t result_d01[N-1];	

	int32_t i,j;

	memset(result_d01,0,(N-1)*sizeof(uint16_t));
	memset(d01,0,(N/2-1)*sizeof(uint16_t));
	memset(d0123,0,(N/2-1)*sizeof(uint16_t));
	memset(d23,0,(N/2-1)*sizeof(uint16_t));
	memset(result_final,0,(2*N-1)*sizeof(uint16_t));

	uint16_t acc1,acc2,acc3,acc4,acc5,acc6,acc7,acc8,acc9,acc10;


	for (i = 0; i < N/4; i++) {
		acc1=a_1[i];//a0
		acc2=a_1[i+N/4];//a1
		acc3=a_1[i+2*N/4];//a2
		acc4=a_1[i+3*N/4];//a3	
		for (j = 0; j < N/4; j++) {

			acc5=b_1[j];//b0
			acc6=b_1[j+N/4];//b1

			result_final[i+j+0*N/4]=result_final[i+j+0*N/4]+acc1*acc5;
			result_final[i+j+2*N/4]=result_final[i+j+2*N/4]+acc2*acc6;

			acc7=acc5+acc6;//b01
			acc8=acc1+acc2;//a01
			d01[i+j]=d01[i+j] + acc7*acc8;
	//--------------------------------------------------------

			acc7=b_1[j+2*N/4];//b2
			acc8=b_1[j+3*N/4];//b3			
			result_final[i+j+4*N/4]=result_final[i+j+4*N/4]+acc7*acc3;

			result_final[i+j+6*N/4]=result_final[i+j+6*N/4]+acc8*acc4;

			acc9=acc3+acc4;
			acc10=acc7+acc8;
			d23[i+j]=d23[i+j] + acc9*acc10;
	//--------------------------------------------------------

			acc5=acc5+acc7;//b02
			acc7=acc1+acc3;//a02
			result_d01[i+j+0*N/4]=result_d01[i+j+0*N/4]+acc5*acc7;

			acc6=acc6+acc8;//b13
			acc8=acc2+acc4;			
			result_d01[i+j+ 2*N/4]=result_d01[i+j+ 2*N/4]+acc6*acc8;

			acc5=acc5+acc6;
			acc7=acc7+acc8;
			d0123[i+j]=d0123[i+j] + acc5*acc7;
		}
	}

//------------------2nd last stage-------------------------

	for(i=0;i<N/2-1;i++){
		d0123[i]=d0123[i]-result_d01[i+0*N/4]-result_d01[i+2*N/4];
		d01[i]=d01[i]-result_final[i+0*N/4]-result_final[i+2*N/4];
		d23[i]=d23[i]-result_final[i+4*N/4]-result_final[i+6*N/4];
	}

	for(i=0;i<N/2-1;i++){
		result_d01[i+1*N/4]=result_d01[i+1*N/4]+d0123[i];
		result_final[i+1*N/4]=result_final[i+1*N/4]+d01[i];
		result_final[i+5*N/4]=result_final[i+5*N/4]+d23[i];
	}

//------------Last stage---------------------------
	for(i=0;i<N-1;i++){
		result_d01[i]=result_d01[i]-result_final[i]-result_final[i+N];
	}
	
	for(i=0;i<N-1;i++){
		result_final[i+1*N/2]=result_final[i+1*N/2]+result_d01[i];//-result_d0[i]-result_d1[i];		
	}

}

static inline int16_t reduce(int16_t a, int64_t p)
{
    return a&p;
}

