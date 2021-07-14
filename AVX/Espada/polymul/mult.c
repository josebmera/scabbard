/*
Cleaned version for step by step approach look into the _debug file
*/
//#include "timing.c"
#include "consts.h"
#include "scm_avx.c"
#include "matrix.c"

void mult_64(__m256i* a, __m256i* b_bucket, __m256i* c_bucket, int f);
void KARA_eval(__m256i* b, __m256i *b_bucket);
void KARA_interpol(__m256i *c_bucket, __m256i *res_avx);

void mult_64(__m256i* a, __m256i* b_bucket, __m256i* c_bucket, int f)
{
	__m256i a_bucket[7*16]; //SCM_SIZE = 16; Holds evaluation (a & b) for 12 Karatsuba at a time

	//uint16_t i;

	register __m256i r0_avx, r1_avx, r2_avx, r3_avx;



		//CLOCK1=cpucycles();
		
		//------------------AVX evaluation for 1st poly-----------------------

                    r0_avx=a[0];
                    r1_avx=a[1];
                    r2_avx=a[2];
                    r3_avx=a[3];
		    a_bucket[0]=r0_avx;
		    a_bucket[1]=r1_avx;
		    a_bucket[2]=r2_avx;
		    a_bucket[3]=r3_avx;
		    a_bucket[4]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8]= _mm256_add_epi16(a_bucket[6],a_bucket[7]);


		//------------------AVX evaluation for 1st poly ends------------------


		//------------------AVX evaluation for 2nd poly-----------------------
                    r0_avx=a[small_len_avx];
                    r1_avx=a[small_len_avx+1];
                    r2_avx=a[small_len_avx+2];
                    r3_avx=a[small_len_avx+3];
		    a_bucket[0+9]=r0_avx;
		    a_bucket[1+9]=r1_avx;
		    a_bucket[2+9]=r2_avx;
		    a_bucket[3+9]=r3_avx;
		    a_bucket[4+9]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+9]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+9]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+9]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+9]= _mm256_add_epi16(a_bucket[6+9],a_bucket[7+9]);

	
		//------------------AVX evaluation for 2nd poly ends------------------


		//------------------AVX evaluation for 3rd poly-----------------------
                    r0_avx=a[2*small_len_avx];
                    r1_avx=a[2*small_len_avx+1];
                    r2_avx=a[2*small_len_avx+2];
                    r3_avx=a[2*small_len_avx+3];
		    a_bucket[0+18]=r0_avx;
		    a_bucket[1+18]=r1_avx;
		    a_bucket[2+18]=r2_avx;
		    a_bucket[3+18]=r3_avx;
		    a_bucket[4+18]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+18]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+18]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+18]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+18]= _mm256_add_epi16(a_bucket[6+18],a_bucket[7+18]);
		
		//------------------AVX evaluation for 3rd poly ends------------------


		//------------------AVX evaluation for 4th poly-----------------------

                    r0_avx=a[3*small_len_avx];
                    r1_avx=a[3*small_len_avx+1];
                    r2_avx=a[3*small_len_avx+2];
                    r3_avx=a[3*small_len_avx+3];
		    a_bucket[0+27]=r0_avx;
		    a_bucket[1+27]=r1_avx;
		    a_bucket[2+27]=r2_avx;
		    a_bucket[3+27]=r3_avx;
		    a_bucket[4+27]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+27]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+27]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+27]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+27]= _mm256_add_epi16(a_bucket[6+27],a_bucket[7+27]);
		
		//------------------AVX evaluation for 4th poly ends------------------

		//------------------AVX evaluation for 5th poly-----------------------
		
                    r0_avx=a[4*small_len_avx+0];
                    r1_avx=a[4*small_len_avx+1];
                    r2_avx=a[4*small_len_avx+2];
                    r3_avx=a[4*small_len_avx+3];
		    a_bucket[0+36]=r0_avx;
		    a_bucket[1+36]=r1_avx;
		    a_bucket[2+36]=r2_avx;
		    a_bucket[3+36]=r3_avx;
		    a_bucket[4+36]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+36]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+36]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+36]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+36]= _mm256_add_epi16(a_bucket[6+36],a_bucket[7+36]);
		
		//------------------AVX evaluation for 5th poly ends------------------


		//------------------AVX evaluation for 6th poly-----------------------
                    r0_avx=a[5*small_len_avx];
                    r1_avx=a[5*small_len_avx+1];
                    r2_avx=a[5*small_len_avx+2];
                    r3_avx=a[5*small_len_avx+3];
		    a_bucket[0+45]=r0_avx;
		    a_bucket[1+45]=r1_avx;
		    a_bucket[2+45]=r2_avx;
		    a_bucket[3+45]=r3_avx;
		    a_bucket[4+45]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+45]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+45]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+45]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+45]= _mm256_add_epi16(a_bucket[6+45],a_bucket[7+45]);
		
		//------------------AVX evaluation for 6th poly ends------------------

		//------------------AVX evaluation for 7th poly-----------------------

                    r0_avx=a[6*small_len_avx];
                    r1_avx=a[6*small_len_avx+1];
                    r2_avx=a[6*small_len_avx+2];
                    r3_avx=a[6*small_len_avx+3];
		    a_bucket[0+54]=r0_avx;
		    a_bucket[1+54]=r1_avx;
		    a_bucket[2+54]=r2_avx;
		    a_bucket[3+54]=r3_avx;
		    a_bucket[4+54]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+54]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+54]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+54]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+54]= _mm256_add_epi16(a_bucket[6+54],a_bucket[7+54]);

		//------------------AVX evaluation for 7th poly ends------------------
		
	
		//------------------AVX evaluation for 8th poly-----------------------

                    r0_avx=a[7*small_len_avx];
                    r1_avx=a[7*small_len_avx+1];
                    r2_avx=a[7*small_len_avx+2];
                    r3_avx=a[7*small_len_avx+3];
		    a_bucket[0+63]=r0_avx;
		    a_bucket[1+63]=r1_avx;
		    a_bucket[2+63]=r2_avx;
		    a_bucket[3+63]=r3_avx;
		    a_bucket[4+63]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+63]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+63]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+63]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+63]= _mm256_add_epi16(a_bucket[6+63],a_bucket[7+63]);

		//------------------AVX evaluation for 8th poly ends------------------
		
		//------------------AVX evaluation for 9th poly-----------------------

                    r0_avx=a[8*small_len_avx];
                    r1_avx=a[8*small_len_avx+1];
                    r2_avx=a[8*small_len_avx+2];
                    r3_avx=a[8*small_len_avx+3];
		    a_bucket[0+72]=r0_avx;
		    a_bucket[1+72]=r1_avx;
		    a_bucket[2+72]=r2_avx;
		    a_bucket[3+72]=r3_avx;
		    a_bucket[4+72]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+72]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+72]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+72]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+72]= _mm256_add_epi16(a_bucket[6+72],a_bucket[7+72]);

		//------------------AVX evaluation for 9th poly ends------------------
		
		//------------------AVX evaluation for 10th poly-----------------------

                    r0_avx=a[9*small_len_avx];
                    r1_avx=a[9*small_len_avx+1];
                    r2_avx=a[9*small_len_avx+2];
                    r3_avx=a[9*small_len_avx+3];
		    a_bucket[0+81]=r0_avx;
		    a_bucket[1+81]=r1_avx;
		    a_bucket[2+81]=r2_avx;
		    a_bucket[3+81]=r3_avx;
		    a_bucket[4+81]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+81]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+81]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+81]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+81]= _mm256_add_epi16(a_bucket[6+81],a_bucket[7+81]);

		//------------------AVX evaluation for 10th poly ends------------------
		
		//------------------AVX evaluation for 11th poly-----------------------

                    r0_avx=a[10*small_len_avx];
                    r1_avx=a[10*small_len_avx+1];
                    r2_avx=a[10*small_len_avx+2];
                    r3_avx=a[10*small_len_avx+3];
		    a_bucket[0+90]=r0_avx;
		    a_bucket[1+90]=r1_avx;
		    a_bucket[2+90]=r2_avx;
		    a_bucket[3+90]=r3_avx;
		    a_bucket[4+90]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+90]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+90]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+90]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+90]= _mm256_add_epi16(a_bucket[6+90],a_bucket[7+90]);

		//------------------AVX evaluation for 11th poly ends------------------
		
		//------------------AVX evaluation for 12th poly-----------------------

                    r0_avx=a[11*small_len_avx];
                    r1_avx=a[11*small_len_avx+1];
                    r2_avx=a[11*small_len_avx+2];
                    r3_avx=a[11*small_len_avx+3];
		    a_bucket[0+99]=r0_avx;
		    a_bucket[1+99]=r1_avx;
		    a_bucket[2+99]=r2_avx;
		    a_bucket[3+99]=r3_avx;
		    a_bucket[4+99]= _mm256_add_epi16(r0_avx, r1_avx);
		    a_bucket[5+99]= _mm256_add_epi16(r2_avx, r3_avx);
		    a_bucket[6+99]= _mm256_add_epi16(r0_avx, r2_avx);
		    a_bucket[7+99]= _mm256_add_epi16(r1_avx, r3_avx);
		    a_bucket[8+99]= _mm256_add_epi16(a_bucket[6+99],a_bucket[7+99]);

		//------------------AVX evaluation for 12th poly ends------------------
		//CLOCK2=cpucycles();
		//CLOCK_EVAL=CLOCK_EVAL+(CLOCK2-CLOCK1);
		//printf("\nTime for multiplication : %llu\n", CLOCK2-CLOCK1);


		//CLOCK1=cpucycles();
		//-----------------Forward transposes--------------------------------------
			transpose_n1(a_bucket);
			transpose_n1(a_bucket+16);
			transpose_n1(a_bucket+32);
			transpose_n1(a_bucket+48);
			transpose_n1(a_bucket+64);
			transpose_n1(a_bucket+80);
			transpose_n1(a_bucket+96);
		//-----------------Forwatrd transposes ends---------------------------------

		//----------------------all multiplications---------------------------------
		if(f==0){
			schoolbook_avx_new2(a_bucket, b_bucket, c_bucket);
			schoolbook_avx_new2(a_bucket+16, b_bucket+16, c_bucket+2*SCM_SIZE);
			schoolbook_avx_new2(a_bucket+32, b_bucket+32, c_bucket+4*SCM_SIZE);
			schoolbook_avx_new2(a_bucket+48, b_bucket+48, c_bucket+6*SCM_SIZE);
			schoolbook_avx_new2(a_bucket+64, b_bucket+64, c_bucket+8*SCM_SIZE);
			schoolbook_avx_new2(a_bucket+80, b_bucket+80, c_bucket+10*SCM_SIZE);
			schoolbook_avx_new2(a_bucket+96, b_bucket+96, c_bucket+12*SCM_SIZE);
		}
		else{
			schoolbook_avx_new3_acc(a_bucket, b_bucket, c_bucket);
			schoolbook_avx_new3_acc(a_bucket+16, b_bucket+16, c_bucket+2*SCM_SIZE);
			//schoolbook_avx_new3_acc_fused(a_bucket, b_bucket, c_bucket);
			schoolbook_avx_new3_acc(a_bucket+32, b_bucket+32, c_bucket+4*SCM_SIZE);
			schoolbook_avx_new3_acc(a_bucket+48, b_bucket+48, c_bucket+6*SCM_SIZE);
			schoolbook_avx_new3_acc(a_bucket+64, b_bucket+64, c_bucket+8*SCM_SIZE);
			schoolbook_avx_new3_acc(a_bucket+80, b_bucket+80, c_bucket+10*SCM_SIZE);
			schoolbook_avx_new3_acc(a_bucket+96, b_bucket+96, c_bucket+12*SCM_SIZE);
		}
		//----------------------all multiplications ends-----------------------------

		
}

void KARA_eval(__m256i* b, __m256i *b_bucket){

	__m256i r0_avx, r1_avx, r2_avx, r3_avx;


		//-------1st poly----------------------------------------------------
                    r0_avx=b[0];
                    r1_avx=b[1];
                    r2_avx=b[2];
                    r3_avx=b[3];
		    b_bucket[0]=r0_avx;
		    b_bucket[1]=r1_avx;
		    b_bucket[2]=r2_avx;
		    b_bucket[3]=r3_avx;
		    b_bucket[4]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8]= _mm256_add_epi16(b_bucket[6],b_bucket[7]);
		//-------2nd poly----------------------------------------------------

                    r0_avx=b[small_len_avx];
                    r1_avx=b[small_len_avx+1];
                    r2_avx=b[small_len_avx+2];
                    r3_avx=b[small_len_avx+3];
		    b_bucket[0+9]=r0_avx;
		    b_bucket[1+9]=r1_avx;
		    b_bucket[2+9]=r2_avx;
		    b_bucket[3+9]=r3_avx;
		    b_bucket[4+9]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+9]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+9]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+9]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+9]= _mm256_add_epi16(b_bucket[6+9],b_bucket[7+9]);

		//-------3rd poly----------------------------------------------------

                    r0_avx=b[2*small_len_avx+0];
                    r1_avx=b[2*small_len_avx+1];
                    r2_avx=b[2*small_len_avx+2];
                    r3_avx=b[2*small_len_avx+3];
		    b_bucket[0+18]=r0_avx;
		    b_bucket[1+18]=r1_avx;
		    b_bucket[2+18]=r2_avx;
		    b_bucket[3+18]=r3_avx;
		    b_bucket[4+18]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+18]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+18]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+18]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+18]= _mm256_add_epi16(b_bucket[6+18],b_bucket[7+18]);

		//-------4th poly----------------------------------------------------
                    r0_avx=b[3*small_len_avx];
                    r1_avx=b[3*small_len_avx+1];
                    r2_avx=b[3*small_len_avx+2];
                    r3_avx=b[3*small_len_avx+3];
		    b_bucket[0+27]=r0_avx;
		    b_bucket[1+27]=r1_avx;
		    b_bucket[2+27]=r2_avx;
		    b_bucket[3+27]=r3_avx;
		    b_bucket[4+27]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+27]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+27]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+27]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+27]= _mm256_add_epi16(b_bucket[6+27],b_bucket[7+27]);

		//-------5th poly----------------------------------------------------

                    r0_avx=b[4*small_len_avx];
                    r1_avx=b[4*small_len_avx+1];
                    r2_avx=b[4*small_len_avx+2];
                    r3_avx=b[4*small_len_avx+3];
		    b_bucket[0+36]=r0_avx;
		    b_bucket[1+36]=r1_avx;
		    b_bucket[2+36]=r2_avx;
		    b_bucket[3+36]=r3_avx;
		    b_bucket[4+36]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+36]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+36]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+36]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+36]= _mm256_add_epi16(b_bucket[6+36],b_bucket[7+36]);

		//-------6th poly----------------------------------------------------

                    r0_avx=b[5*small_len_avx];
                    r1_avx=b[5*small_len_avx+1];
                    r2_avx=b[5*small_len_avx+2];
                    r3_avx=b[5*small_len_avx+3];
		    b_bucket[0+45]=r0_avx;
		    b_bucket[1+45]=r1_avx;
		    b_bucket[2+45]=r2_avx;
		    b_bucket[3+45]=r3_avx;
		    b_bucket[4+45]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+45]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+45]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+45]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+45]= _mm256_add_epi16(b_bucket[6+45],b_bucket[7+45]);

		//-------7th poly----------------------------------------------------

                    r0_avx=b[6*small_len_avx];
                    r1_avx=b[6*small_len_avx+1];
                    r2_avx=b[6*small_len_avx+2];
                    r3_avx=b[6*small_len_avx+3];
		    b_bucket[0+54]=r0_avx;
		    b_bucket[1+54]=r1_avx;
		    b_bucket[2+54]=r2_avx;
		    b_bucket[3+54]=r3_avx;
		    b_bucket[4+54]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+54]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+54]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+54]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+54]= _mm256_add_epi16(b_bucket[6+54],b_bucket[7+54]);
		//-------8th poly----------------------------------------------------

                    r0_avx=b[7*small_len_avx];
                    r1_avx=b[7*small_len_avx+1];
                    r2_avx=b[7*small_len_avx+2];
                    r3_avx=b[7*small_len_avx+3];
		    b_bucket[0+63]=r0_avx;
		    b_bucket[1+63]=r1_avx;
		    b_bucket[2+63]=r2_avx;
		    b_bucket[3+63]=r3_avx;
		    b_bucket[4+63]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+63]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+63]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+63]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+63]= _mm256_add_epi16(b_bucket[6+63],b_bucket[7+63]);
		//-------9th poly----------------------------------------------------

                    r0_avx=b[8*small_len_avx];
                    r1_avx=b[8*small_len_avx+1];
                    r2_avx=b[8*small_len_avx+2];
                    r3_avx=b[8*small_len_avx+3];
		    b_bucket[0+72]=r0_avx;
		    b_bucket[1+72]=r1_avx;
		    b_bucket[2+72]=r2_avx;
		    b_bucket[3+72]=r3_avx;
		    b_bucket[4+72]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+72]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+72]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+72]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+72]= _mm256_add_epi16(b_bucket[6+72],b_bucket[7+72]);
		 //-------10th poly----------------------------------------------------

                    r0_avx=b[9*small_len_avx];
                    r1_avx=b[9*small_len_avx+1];
                    r2_avx=b[9*small_len_avx+2];
                    r3_avx=b[9*small_len_avx+3];
		    b_bucket[0+81]=r0_avx;
		    b_bucket[1+81]=r1_avx;
		    b_bucket[2+81]=r2_avx;
		    b_bucket[3+81]=r3_avx;
		    b_bucket[4+81]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+81]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+81]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+81]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+81]= _mm256_add_epi16(b_bucket[6+81],b_bucket[7+81]);
		//-------11th poly----------------------------------------------------

                    r0_avx=b[10*small_len_avx];
                    r1_avx=b[10*small_len_avx+1];
                    r2_avx=b[10*small_len_avx+2];
                    r3_avx=b[10*small_len_avx+3];
		    b_bucket[0+90]=r0_avx;
		    b_bucket[1+90]=r1_avx;
		    b_bucket[2+90]=r2_avx;
		    b_bucket[3+90]=r3_avx;
		    b_bucket[4+90]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+90]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+90]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+90]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+90]= _mm256_add_epi16(b_bucket[6+90],b_bucket[7+90]);
		//-------12th poly----------------------------------------------------

                    r0_avx=b[11*small_len_avx];
                    r1_avx=b[11*small_len_avx+1];
                    r2_avx=b[11*small_len_avx+2];
                    r3_avx=b[11*small_len_avx+3];
		    b_bucket[0+99]=r0_avx;
		    b_bucket[1+99]=r1_avx;
		    b_bucket[2+99]=r2_avx;
		    b_bucket[3+99]=r3_avx;
		    b_bucket[4+99]= _mm256_add_epi16(r0_avx, r1_avx);
		    b_bucket[5+99]= _mm256_add_epi16(r2_avx, r3_avx);
		    b_bucket[6+99]= _mm256_add_epi16(r0_avx, r2_avx);
		    b_bucket[7+99]= _mm256_add_epi16(r1_avx, r3_avx);
		    b_bucket[8+99]= _mm256_add_epi16(b_bucket[6+99],b_bucket[7+99]);    
		//--------------Evaluating B poly ends-------------------------------

			transpose_n1(b_bucket);
			transpose_n1(b_bucket+16);
			transpose_n1(b_bucket+32);
			transpose_n1(b_bucket+48);
			transpose_n1(b_bucket+64);
			transpose_n1(b_bucket+80);
			transpose_n1(b_bucket+96);	
}

void KARA_interpol(__m256i *c_bucket, __m256i *res_avx){

		int64_t i;
		register __m256i res_avx0, res_avx1, res_avx2, res_avx3, res_avx4, res_avx5, res_avx6, res_avx7; // to hold each 64X64 poly mul results

		__m256i temp, c6_avx, c7_avx, c8_avx, c20_avx, c21_avx, c22_avx, c23_avx, c24_avx;
		
		__m256i result_final0[2*small_len_avx],result_final1[2*small_len_avx],result_final2[2*small_len_avx],result_final3[2*small_len_avx],result_final4[2*small_len_avx],result_final5[2*small_len_avx],result_final6[2*small_len_avx],result_final7[2*small_len_avx],result_final8[2*small_len_avx],result_final9[2*small_len_avx],result_final10[2*small_len_avx],result_final11[2*small_len_avx];


		transpose_n1(c_bucket);
		transpose_n1(c_bucket+16);

		transpose_n1(c_bucket+2*SCM_SIZE);
		transpose_n1(c_bucket+16+2*SCM_SIZE);

		transpose_n1(c_bucket+4*SCM_SIZE);
		transpose_n1(c_bucket+16+4*SCM_SIZE);

		transpose_n1(c_bucket+6*SCM_SIZE);
		transpose_n1(c_bucket+16+6*SCM_SIZE);
		
		transpose_n1(c_bucket+8*SCM_SIZE);
		transpose_n1(c_bucket+16+8*SCM_SIZE);

		transpose_n1(c_bucket+10*SCM_SIZE);
		transpose_n1(c_bucket+16+10*SCM_SIZE);

		transpose_n1(c_bucket+12*SCM_SIZE);
		transpose_n1(c_bucket+16+12*SCM_SIZE);
		//CLOCK1=cpucycles();

		   //------------------------AVX interpolation for 1st poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[0];
				res_avx2 = c_bucket[1];
				res_avx4 = c_bucket[2];
				res_avx6 = c_bucket[3];

				c6_avx=c_bucket[6];
				c7_avx=c_bucket[7];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[8], c6_avx), c7_avx);

				res_avx1 = c_bucket[16];
				res_avx3 = c_bucket[17];
				res_avx5 = c_bucket[18];
				res_avx7 = c_bucket[19];

				c22_avx=c_bucket[22];
				c23_avx=c_bucket[23];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[21], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[24], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[20], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[5], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[4], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final0[0]=res_avx0;
				result_final0[1]=res_avx1;

				result_final0[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final0[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final0[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final0[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final0[6]=res_avx6;
				result_final0[7]=res_avx7;

				for(i=0; i<4; i++)
					res_avx[(4*0)+i] = _mm256_sub_epi16(result_final0[i], result_final0[i+4]);
		   //------------------------AVX interpolation for 1st poly ends--------------


		   //------------------------AVX interpolation for 2nd poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[9]; //c_bucket0
				res_avx2 = c_bucket[10]; //c_bucket1
				res_avx4 = c_bucket[11]; //c_bucket2
				res_avx6 = c_bucket[12]; //c_bucket3

				c6_avx=c_bucket[15]; //c_bucket6
				c7_avx=c_bucket[32]; //c_bucket7
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[33], c6_avx), c7_avx);

				res_avx1 = c_bucket[25]; //c_bucket0
				res_avx3 = c_bucket[26]; //c_bucket1
				res_avx5 = c_bucket[27]; //c_bucket2
				res_avx7 = c_bucket[28]; //c_bucket3

				c22_avx=c_bucket[31];
				c23_avx=c_bucket[48];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[30], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[49], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[29], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[14], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[13], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final1[0]=res_avx0;
				result_final1[1]=res_avx1;

				result_final1[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final1[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final1[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final1[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final1[6]=res_avx6;
				result_final1[7]=res_avx7;
					
				for(i=0; i<4; i++)
					res_avx[(4*1)+i] = _mm256_sub_epi16(result_final1[i], result_final1[i+4]);

		   //------------------------AVX interpolation for 2nd poly ends--------------

		   //------------------------AVX interpolation for 3rd poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[34]; //c_bucket0
				res_avx2 = c_bucket[35]; //c_bucket1
				res_avx4 = c_bucket[36];
				res_avx6 = c_bucket[37];

				c6_avx=c_bucket[40];
				c7_avx=c_bucket[41];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[42], c6_avx), c7_avx);

				res_avx1 = c_bucket[50]; //c_bucket0
				res_avx3 = c_bucket[51]; //c_bucket1
				res_avx5 = c_bucket[52];
				res_avx7 = c_bucket[53];

				c22_avx=c_bucket[56];
				c23_avx=c_bucket[57];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[55], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[58], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[54], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[39], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[38], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);

			//loop4
				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);
			//loop5
				result_final2[0]=res_avx0;
				result_final2[1]=res_avx1;

				result_final2[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final2[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final2[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final2[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final2[6]=res_avx6;
				result_final2[7]=res_avx7;
				
				
				for(i=0; i<4; i++)
					res_avx[(4*2)+i] = _mm256_sub_epi16(result_final2[i], result_final2[i+4]);
		   //------------------------AVX interpolation for 3rd poly ends--------------
		
		   //------------------------AVX interpolation for 4th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[43];
				res_avx2 = c_bucket[44];
				res_avx4 = c_bucket[45];
				res_avx6 = c_bucket[46];

				c6_avx=c_bucket[65];
				c7_avx=c_bucket[66];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[67], c6_avx), c7_avx);

				res_avx1 = c_bucket[59];
				res_avx3 = c_bucket[60];
				res_avx5 = c_bucket[61];
				res_avx7 = c_bucket[62];

				c22_avx=c_bucket[81];
				c23_avx=c_bucket[82];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[80], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[83], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[63], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[64], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[47], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final3[0]=res_avx0;
				result_final3[1]=res_avx1;

				result_final3[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final3[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final3[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final3[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final3[6]=res_avx6;
				result_final3[7]=res_avx7;
				
				
				for(i=0; i<4; i++)
					res_avx[(4*3)+i] = _mm256_sub_epi16(result_final3[i], result_final3[i+4]);

		   //------------------------AVX interpolation for 4th poly ends--------------

		   //------------------------AVX interpolation for 5th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[68];
				res_avx2 = c_bucket[69];
				res_avx4 = c_bucket[70];
				res_avx6 = c_bucket[71];

				c6_avx=c_bucket[74];
				c7_avx=c_bucket[75];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[76], c6_avx), c7_avx);

				res_avx1 = c_bucket[84];
				res_avx3 = c_bucket[85];
				res_avx5 = c_bucket[86];
				res_avx7 = c_bucket[87];

				c22_avx=c_bucket[90];
				c23_avx=c_bucket[91];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[89], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[92], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[88], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[73], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[72], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final4[0]=res_avx0;
				result_final4[1]=res_avx1;

				result_final4[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final4[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final4[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final4[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final4[6]=res_avx6;
				result_final4[7]=res_avx7;


				for(i=0; i<4; i++)
					res_avx[(4*4)+i] = _mm256_sub_epi16(result_final4[i], result_final4[i+4]);

		   //------------------------AVX interpolation for 5th poly ends--------------

		   //------------------------AVX interpolation for 6th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[77];
				res_avx2 = c_bucket[78];
				res_avx4 = c_bucket[79];
				res_avx6 = c_bucket[96];

				c6_avx=c_bucket[99];
				c7_avx=c_bucket[100];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[101], c6_avx), c7_avx);

				res_avx1 = c_bucket[93];
				res_avx3 = c_bucket[94];
				res_avx5 = c_bucket[95];
				res_avx7 = c_bucket[112];

				c22_avx=c_bucket[115];
				c23_avx=c_bucket[116];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[114], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[117], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[113], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[98], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[97], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final5[0]=res_avx0;
				result_final5[1]=res_avx1;

				result_final5[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final5[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final5[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final5[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final5[6]=res_avx6;
				result_final5[7]=res_avx7;


				for(i=0; i<4; i++)
					res_avx[(4*5)+i] = _mm256_sub_epi16(result_final5[i], result_final5[i+4]);

		   //------------------------AVX interpolation for 6th poly ends--------------

		   //------------------------AVX interpolation for 7th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[102];
				res_avx2 = c_bucket[103];
				res_avx4 = c_bucket[104];
				res_avx6 = c_bucket[105];

				c6_avx=c_bucket[108];
				c7_avx=c_bucket[109];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[110], c6_avx), c7_avx);

				res_avx1 = c_bucket[118];
				res_avx3 = c_bucket[119];
				res_avx5 = c_bucket[120];
				res_avx7 = c_bucket[121];

				c22_avx=c_bucket[124];
				c23_avx=c_bucket[125];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[123], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[126], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[122], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[107], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[106], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final6[0]=res_avx0;
				result_final6[1]=res_avx1;

				result_final6[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final6[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final6[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final6[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final6[6]=res_avx6;
				result_final6[7]=res_avx7;



				for(i=0; i<4; i++)
					res_avx[(4*6)+i] = _mm256_sub_epi16(result_final6[i], result_final6[i+4]);
					
		   //------------------------AVX interpolation for 7th poly ends--------------
		   
		   //------------------------AVX interpolation for 8th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[111]; //c_bucket0
				res_avx2 = c_bucket[128]; //c_bucket1
				res_avx4 = c_bucket[129]; //c_bucket2
				res_avx6 = c_bucket[130]; //c_bucket3

				c6_avx=c_bucket[133]; //c_bucket6
				c7_avx=c_bucket[134]; //c_bucket7
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[135], c6_avx), c7_avx);

				res_avx1 = c_bucket[127]; //c_bucket0
				res_avx3 = c_bucket[144]; //c_bucket1
				res_avx5 = c_bucket[145]; //c_bucket2
				res_avx7 = c_bucket[146]; //c_bucket3

				c22_avx=c_bucket[149];
				c23_avx=c_bucket[150];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[148], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[151], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[147], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[132], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[131], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final7[0]=res_avx0;
				result_final7[1]=res_avx1;

				result_final7[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final7[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final7[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final7[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final7[6]=res_avx6;
				result_final7[7]=res_avx7;


				for(i=0; i<4; i++)
					res_avx[(4*7)+i] = _mm256_sub_epi16(result_final7[i], result_final7[i+4]);
					

		   //------------------------AVX interpolation for 8th poly ends--------------

		   //------------------------AVX interpolation for 9th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[136]; //c_bucket0
				res_avx2 = c_bucket[137]; //c_bucket1
				res_avx4 = c_bucket[138];
				res_avx6 = c_bucket[139];

				c6_avx=c_bucket[142];
				c7_avx=c_bucket[143];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[160], c6_avx), c7_avx);

				res_avx1 = c_bucket[152]; //c_bucket0
				res_avx3 = c_bucket[153]; //c_bucket1
				res_avx5 = c_bucket[154];
				res_avx7 = c_bucket[155];

				c22_avx=c_bucket[158];
				c23_avx=c_bucket[159];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[157], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[176], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[156], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[141], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[140], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);

			//loop4
				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);
			//loop5
				result_final8[0]=res_avx0;
				result_final8[1]=res_avx1;

				result_final8[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final8[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final8[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final8[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final8[6]=res_avx6;
				result_final8[7]=res_avx7;
				
				for(i=0; i<4; i++)
					res_avx[(4*8)+i] = _mm256_sub_epi16(result_final8[i], result_final8[i+4]);
					

		   //------------------------AVX interpolation for 9th poly ends--------------
		   
		   //------------------------AVX interpolation for 10th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[161]; //c_bucket0
				res_avx2 = c_bucket[162]; //c_bucket1
				res_avx4 = c_bucket[163]; //c_bucket2
				res_avx6 = c_bucket[164]; //c_bucket3

				c6_avx=c_bucket[167]; //c_bucket6
				c7_avx=c_bucket[168]; //c_bucket7
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[169], c6_avx), c7_avx);

				res_avx1 = c_bucket[177]; //c_bucket0
				res_avx3 = c_bucket[178]; //c_bucket1
				res_avx5 = c_bucket[179]; //c_bucket2
				res_avx7 = c_bucket[180]; //c_bucket3

				c22_avx=c_bucket[183];
				c23_avx=c_bucket[184];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[182], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[185], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[181], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[166], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[165], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final9[0]=res_avx0;
				result_final9[1]=res_avx1;

				result_final9[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final9[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final9[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final9[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final9[6]=res_avx6;
				result_final9[7]=res_avx7;
				
				
				for(i=0; i<4; i++)
					res_avx[(4*9)+i] = _mm256_sub_epi16(result_final9[i], result_final9[i+4]);


		   //------------------------AVX interpolation for 10th poly ends--------------

		   //------------------------AVX interpolation for 11th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[170]; //c_bucket0
				res_avx2 = c_bucket[171]; //c_bucket1
				res_avx4 = c_bucket[172];
				res_avx6 = c_bucket[173];

				c6_avx=c_bucket[192];
				c7_avx=c_bucket[193];
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[194], c6_avx), c7_avx);

				res_avx1 = c_bucket[186]; //c_bucket0
				res_avx3 = c_bucket[187]; //c_bucket1
				res_avx5 = c_bucket[188];
				res_avx7 = c_bucket[189];

				c22_avx=c_bucket[208];
				c23_avx=c_bucket[209];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[191], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[210], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[190], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[175], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[174], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);

			//loop4
				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);
			//loop5
				result_final10[0]=res_avx0;
				result_final10[1]=res_avx1;

				result_final10[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final10[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final10[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final10[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final10[6]=res_avx6;
				result_final10[7]=res_avx7;
				
				
				for(i=0; i<4; i++)
					res_avx[(4*10)+i] = _mm256_sub_epi16(result_final10[i], result_final10[i+4]);

		   //------------------------AVX interpolation for 11th poly ends--------------
		   
		   //------------------------AVX interpolation for 12th poly external-------------------		
			
			//loop1
				res_avx0 = c_bucket[195]; //c_bucket0
				res_avx2 = c_bucket[196]; //c_bucket1
				res_avx4 = c_bucket[197]; //c_bucket2
				res_avx6 = c_bucket[198]; //c_bucket3

				c6_avx=c_bucket[201]; //c_bucket6
				c7_avx=c_bucket[202]; //c_bucket7
		
				c8_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[203], c6_avx), c7_avx);

				res_avx1 = c_bucket[211]; //c_bucket0
				res_avx3 = c_bucket[212]; //c_bucket1
				res_avx5 = c_bucket[213]; //c_bucket2
				res_avx7 = c_bucket[214]; //c_bucket3

				c22_avx=c_bucket[217];
				c23_avx=c_bucket[218];

				c21_avx=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[216], res_avx5),res_avx7);

				c24_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[219], c22_avx), c23_avx);

				c20_avx = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[215], res_avx1), res_avx3);

				temp=_mm256_sub_epi16(_mm256_sub_epi16(c_bucket[200], res_avx4),res_avx6);
				res_avx5 = _mm256_add_epi16(res_avx5, temp);

				temp = _mm256_sub_epi16(_mm256_sub_epi16(c_bucket[199], res_avx0), res_avx2);
				res_avx1 = _mm256_add_epi16(res_avx1, temp);

				c22_avx=_mm256_add_epi16(c22_avx, c8_avx);

				res_avx6 = _mm256_add_epi16(res_avx6, c21_avx);

				res_avx2 = _mm256_add_epi16(res_avx2, c20_avx);

				c7_avx=_mm256_add_epi16(c7_avx, c24_avx);


			//loop4

				c6_avx=_mm256_sub_epi16(_mm256_sub_epi16(c6_avx, res_avx0), res_avx4);
				c22_avx=_mm256_sub_epi16(_mm256_sub_epi16(c22_avx, res_avx1), res_avx5);

				c7_avx=_mm256_sub_epi16(_mm256_sub_epi16(c7_avx, res_avx2), res_avx6);
				c23_avx=_mm256_sub_epi16(_mm256_sub_epi16(c23_avx, res_avx3), res_avx7);

			//loop5
				result_final11[0]=res_avx0;
				result_final11[1]=res_avx1;

				result_final11[2]=_mm256_add_epi16(res_avx2, c6_avx);
				result_final11[3]=_mm256_add_epi16(res_avx3, c22_avx);


				result_final11[4]=_mm256_add_epi16(res_avx4, c7_avx);
				result_final11[5]=_mm256_add_epi16(res_avx5, c23_avx);

				result_final11[6]=res_avx6;
				result_final11[7]=res_avx7;
				
				
				for(i=0; i<4; i++)
					res_avx[(4*11)+i] = _mm256_sub_epi16(result_final11[i], result_final11[i+4]);


		   //------------------------AVX interpolation for 12th poly ends--------------


		//CLOCK2=cpucycles();
		//CLOCK_INTER=CLOCK_INTER+(CLOCK2-CLOCK1);
		//printf("\nTime for interpolation : %llu\n", CLOCK2-CLOCK1);



}




