#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include "poly_mul.h"


#define SCHB_N 16

#define con_N 256
#define N_SB (con_N >> 2)
#define N_SB_RES (2*N_SB-1)


/*void print_poly2(int16_t *a, int64_t n, uint64_t p){

	printf("-----------------------\n");
	int i;
	for (i = n - 1; i >= 0; i--){
		if (a[i] != 0){
			if(i!=0)
				printf("  Mod(%d,%lu)*x^%d + ", a[i], p,i);
			else
				printf("  Mod(%d,%lu)*x^%d ", a[i], p,i);

			}
	}

	printf("\n-----------------------\n");
}*/


void myschool_book(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n) //simple school book
{ // Polynomial multiplication using the schoolbook method, c[x] = a[x]*b[x] 
	// SECURITY NOTE: TO BE USED FOR TESTING ONLY.  


	uint32_t i, j, mask = 2*n;
	
	int16_t *c;
	c=(int16_t *)malloc(mask*sizeof(int16_t));
	for (i = 0; i < mask; i++) c[i] = 0;

	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			c[i+j]=reduce(c[i+j] + (a[i] * b[j]), p);
			//printf("i+j : %u,i:%u,j:%u,a[i]=%lu,b[j]=%lu,c[i+j]=%lu\n",i+j,i,j,a[i],b[j],c[i+j]);
		}
	}
	//---------------reduction-------
	for(i=0;i<((n/2)-1);i++){
		res[i]=(c[i]-c[i+n]-c[i+n+(n/2)])&(p-1);
	}
	res[(n/2)-1]=(c[i]-c[i+n])&(p-1);
	for(i=(n/2);i<n;i++){
		res[i]=(c[i]+c[i+(n/2)])&(p-1);
	}
	
	free(c);

}


void pol_mul(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n)

{ 
	// Polynomial multiplication using the schoolbook method, c[x] = a[x]*b[x] 
	// SECURITY NOTE: TO BE USED FOR TESTING ONLY.  

	uint32_t i;
	uint16_t c[2*n];
//-------------------normal multiplication-----------------
	memset(c,0,(2*n)*sizeof(uint16_t));
	toom_cook_3way(a, b, c, p);
	
	//---------------reduction-------
	for(i=0;i<((n/2)-1);i++){
		res[i]=(c[i]-c[i+n]-c[i+n+(n/2)])&(p-1);
	}
	res[(n/2)-1]=(c[(n/2)-1]-c[(n/2)-1+n])&(p-1);
	for(i=(n/2);i<n;i++){
		res[i]=(c[i]+c[i+(n/2)])&(p-1);
	}
	
}
void toom_cook_3way(uint16_t *a,uint16_t *b,uint16_t *c,uint16_t mod1)
{
	int16_t j;
	uint16_t temp,p0[con_N],p1[con_N],p2[con_N],p3[con_N],p4[con_N],q0[con_N],q1[con_N],q2[con_N],q3[con_N],q4[con_N],r0[2*con_N-1],r1[2*con_N-1],r2[2*con_N-1],r3[2*con_N-1],r4[2*con_N-1],s0,s1,s2,s3,s4;
	uint16_t inv3 = 683;
	uint16_t mod = mod1*2;
	//uint16_t print = 0;
	
	
	
	
	//Evaluation
	
	for(j=0;j<con_N;j++)
	{
		temp = a[j]+a[(2*con_N)+j];
		p0[j] = a[j];//a(0)
		p1[j] = temp+a[con_N+j];//a(1)
		p2[j] = temp-a[con_N+j];//a(-1)
		p3[j] = ((p2[j]+a[(2*con_N)+j])<<1)-a[j];//a(-2)
		p4[j] = a[(2*con_N)+j];//a(inf)
	}
	for(j=0;j<con_N;j++)
	{
		temp = b[j]+b[(2*con_N)+j];
		q0[j] = b[j];//b(0)
		q1[j] = temp+b[con_N+j];//b(1)
		q2[j] = temp-b[con_N+j];//b(-1)
		q3[j] = ((q2[j]+b[(2*con_N)+j])<<1)-b[j];//b(-2)
		q4[j] = b[(2*con_N)+j];//b(inf)
		
	}	
	

	pol_mul_256(p0,q0,r0,mod,con_N);//c(0)
	pol_mul_256(p1,q1,r1,mod,con_N);//c(1)
	pol_mul_256(p2,q2,r2,mod,con_N);//c(-1)
	pol_mul_256(p3,q3,r3,mod,con_N);//c(-2)
	pol_mul_256(p4,q4,r4,mod,con_N);//c(inf)
	
	
	/*if(print==1)
	{
		printf("\n----------r0 is------------\n");
		print_poly2(r0,2*n_len-1,mod);
		printf("\n----------r1 is------------\n");
		print_poly2(r1,2*n_len-1,mod);
		printf("\n----------r2 is------------\n");
		print_poly2(r2,2*n_len-1,mod);
		printf("\n----------r3 is------------\n");
		print_poly2(r3,2*n_len-1,mod);
		printf("\n----------r4 is------------\n");
		print_poly2(r4,2*n_len-1,mod);
	}*/
	
	
	/*for(j=0;j<2*len;j++)
		c[j] = 0;*/


		
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

void pol_mul_256(uint16_t* a, uint16_t* b, uint16_t* res, uint16_t p, uint32_t n)

{ 
	// Polynomial multiplication using the schoolbook method, c[x] = a[x]*b[x] 
	// SECURITY NOTE: TO BE USED FOR TESTING ONLY.  

	uint32_t i;

//-------------------normal multiplication-----------------

	uint16_t c[2*n];

	memset(c,0,(2*n)*sizeof(uint16_t));
	
	toom_cook_4way(a, b, c);
	for(i=0;i<2*n;i++)
		res[i] = reduce(c[i],p);

	//---------------reduction-------
	/*for(i=n;i<2*n;i++){
		res[i-n]=(c[i-n]-c[i])&(p-1);
	}*/
	

}
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



void toom_cook_4way (const uint16_t* a1,const uint16_t* b1, uint16_t* result)
{
	uint16_t inv3 = 43691, inv9 = 36409, inv15 = 61167;

	uint16_t aw1[N_SB], aw2[N_SB], aw3[N_SB], aw4[N_SB], aw5[N_SB], aw6[N_SB], aw7[N_SB];
	uint16_t bw1[N_SB], bw2[N_SB], bw3[N_SB], bw4[N_SB], bw5[N_SB], bw6[N_SB], bw7[N_SB];
	uint16_t w1[N_SB_RES] = {0}, w2[N_SB_RES] = {0}, w3[N_SB_RES] = {0}, w4[N_SB_RES] = {0},w5[N_SB_RES] = {0}, w6[N_SB_RES] = {0}, w7[N_SB_RES] = {0};
	uint16_t r0, r1, r2, r3, r4, r5, r6, r7;
	uint16_t *A0, *A1, *A2, *A3, *B0, *B1, *B2, *B3;
	A0 = (uint16_t*)a1;
	A1 = (uint16_t*)&a1[N_SB];
	A2 = (uint16_t*)&a1[2*N_SB];
	A3 = (uint16_t*)&a1[3*N_SB];
	B0 = (uint16_t*)b1;
	B1 = (uint16_t*)&b1[N_SB];
	B2 = (uint16_t*)&b1[2*N_SB];
	B3 = (uint16_t*)&b1[3*N_SB];

	uint16_t * C;
	C = result;

	int i,j;
	
// EVALUATION
	for (j = 0; j < N_SB; ++j) {
		r0 = A0[j];
		r1 = A1[j];
		r2 = A2[j];
		r3 = A3[j];
		r4 = r0 + r2;
		r5 = r1 + r3;
		r6 = r4 + r5; r7 = r4 - r5;
		aw3[j] = r6;
		aw4[j] = r7;
		r4 = ((r0 << 2)+r2) << 1;
		r5 = (r1 << 2) + r3;
		r6 = r4 + r5; r7 = r4 - r5;
		aw5[j] = r6;
		aw6[j] = r7;
		r4 = (r3 << 3) + (r2 << 2) + (r1 << 1) + r0;
		aw2[j] = r4; aw7[j] = r0;
		aw1[j] = r3;
	}
	for (j = 0; j < N_SB; ++j) {
		r0 = B0[j];
		r1 = B1[j];
		r2 = B2[j];
		r3 = B3[j];
		r4 = r0 + r2;
		r5 = r1 + r3;
		r6 = r4 + r5; r7 = r4 - r5;
		bw3[j] = r6;
		bw4[j] = r7;
		r4 = ((r0 << 2)+r2) << 1;
		r5 = (r1 << 2) + r3;
		r6 = r4 + r5; r7 = r4 - r5;
		bw5[j] = r6;
		bw6[j] = r7;
		r4 = (r3 << 3) + (r2 << 2) + (r1 << 1) + r0;
		bw2[j] = r4; bw7[j] = r0;
		bw1[j] = r3;
	}

// MULTIPLICATION

	karatsuba_simple(aw1, bw1, w1);
	karatsuba_simple(aw2, bw2, w2);
	karatsuba_simple(aw3, bw3, w3);
	karatsuba_simple(aw4, bw4, w4);
	karatsuba_simple(aw5, bw5, w5);
	karatsuba_simple(aw6, bw6, w6);
	karatsuba_simple(aw7, bw7, w7);

// INTERPOLATION
	for (i = 0; i < N_SB_RES; ++i) {
		r0 = w1[i];
		r1 = w2[i];
		r2 = w3[i];
		r3 = w4[i];
		r4 = w5[i];
		r5 = w6[i];
		r6 = w7[i];

		r1 = r1 + r4;
		r5 = r5 - r4;
		r3 = ((r3-r2) >> 1);
		r4 = r4 - r0;
		r4 = r4 - (r6 << 6);
		r4 = (r4 << 1) + r5;
		r2 = r2 + r3;
		r1 = r1 - (r2 << 6) - r2;
		r2 = r2 - r6;
		r2 = r2 - r0;
		r1 = r1 + 45*r2;
		r4 = (((r4 - (r2 << 3))*inv3) >> 3);
		r5 = r5 + r1;
		r1 = (((r1 + (r3 << 4))*inv9) >> 1);
		r3 = -(r3 + r1);
		r5 = (((30*r1 - r5)*inv15) >> 2);
		r2 = r2 - r4;
		r1 = r1 - r5;

		C[i]     += r6;
		C[i+64]  += r5;
		C[i+128] += r4;
		C[i+192] += r3;
		C[i+256] += r2;
		C[i+320] += r1;
		C[i+384] += r0;
	}
}

int16_t reduce(int16_t a, int64_t p)
{
    return a&(p-1);
}


