#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "api.h"
#include "mlwr_indcpa.h"
#include "pack_unpack.h"
//#include "randombytes.h"
#include "rng.h"
#include "cbd.h"
#include "mlwr_params.h"
#include "./polymul/mult.c"
#include "fips202.h"
#include "fips202x4.h"

#define h1 (1<<(mlwr_EQ-mlwr_EP-1)) //2^(EQ-EP-1)

#define h2 ( (1<<(mlwr_EP-5)) - (1<<(mlwr_EP-mlwr_ET-1)) + (1<<(mlwr_EQ-mlwr_EP-1)))


uint64_t mask_ar[4]={~(0UL)};
__m256i mask_load;
__m256i floor_round;
__m256i H1_avx;	
__m256i H2_avx;

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec);



/*-----------------------------------------------------------------------------------
	This routine generates a=[Matrix K x K] of 256-coefficient polynomials 
-------------------------------------------------------------------------------------*/


void GenMatrix(polyvec *a, const unsigned char *seed) 
{
  unsigned int one_vector=mlwr_EQ*mlwr_N/8;
  unsigned int byte_bank_length=mlwr_K*mlwr_K*one_vector;
  unsigned char buf[byte_bank_length];

  uint16_t temp_ar[mlwr_N];

  int i,j,k;
  uint16_t mod = modQ;

  shake128(buf,byte_bank_length,seed,mlwr_SEEDBYTES);
  
  for(i=0;i<mlwr_K;i++)
  {
    for(j=0;j<mlwr_K;j++)
    {
	BS2POL(buf+(i*mlwr_K+j)*one_vector,temp_ar);
	for(k=0;k<mlwr_N;k++){
		a[i].vec[j].coeffs[k] = (temp_ar[k])& mod ;
	}
    }
  }


}

//********************************matrix-vector mul routines*****************************************************
void matrix_vector_mul_keygen(__m256i a1_avx_combined[NUM_POLY][NUM_POLY][AVX_N1], __m256i b_bucket[SCHB_N*7], __m256i res_avx[NUM_POLY][AVX_N1]);
void matrix_vector_mul_enc(__m256i a1_avx_combined[NUM_POLY][NUM_POLY][AVX_N1], __m256i b_bucket[SCHB_N*7], __m256i res_avx[NUM_POLY][AVX_N1]);
void vector_vector_mul(__m256i a_avx[NUM_POLY][AVX_N1], __m256i b_bucket[SCHB_N*7], __m256i res_avx[AVX_N1]);

//********************************matrix-vector mul routines*****************************************************

void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk)
{
 
  polyvec a[mlwr_K];

  uint16_t skpv1[mlwr_K][mlwr_N];

  
 
  unsigned char seed[mlwr_SEEDBYTES];
  unsigned char noiseseed[mlwr_COINBYTES];
  int32_t i,j,k;


//--------------AVX declaration------------------
	
  __m256i sk_avx[mlwr_K][mlwr_N/16];
  __m256i mod;
  __m256i res_avx[mlwr_K][mlwr_N/16];
  __m256i a_avx[mlwr_K][mlwr_K][mlwr_N/16];
  //__m256i acc[2*mlwr_N/16];


  mask_ar[0]=~(0UL);mask_ar[1]=~(0UL);mask_ar[2]=~(0UL);mask_ar[3]=~(0UL);
  mask_load = _mm256_loadu_si256 ((__m256i const *)mask_ar);

  mod=_mm256_set1_epi16(modQ);
  floor_round=_mm256_set1_epi16(4);

  H1_avx=_mm256_set1_epi16(h1);

  __m256i b_bucket[SCHB_N*7],b[12*4];

//--------------AVX declaration ends------------------

  


  randombytes(seed, mlwr_SEEDBYTES);
  
  shake128(seed, mlwr_SEEDBYTES, seed, mlwr_SEEDBYTES); // for not revealing system RNG state
  randombytes(noiseseed, mlwr_COINBYTES);

  GenMatrix(a, seed); //sample matrix A

  GenSecret(skpv1,noiseseed);


 // Load sk into avx vectors		
 for(i=0;i<mlwr_K;i++)
 {
	for(j=0; j<mlwr_N/16; j++){
            sk_avx[i][j] = _mm256_loadu_si256 ((__m256i const *) (&skpv1[i][j*16]));
	}

  }

  // Load a into avx vectors	
  for(i=0;i<mlwr_K;i++){ 
	  for(j=0;j<mlwr_K;j++){
		  for(k=0;k<mlwr_N/16;k++){
			a_avx[i][j][k]=_mm256_loadu_si256 ((__m256i const *) (&a[i].vec[j].coeffs[k*16]));
		  }
	  }
  }	



  //------------------------do the matrix vector multiplication and rounding------------

	for(i=0;i<12;i++){
		b[(4*i)+0]=sk_avx[i][0];
		b[(4*i)+1]=sk_avx[i][1];
		b[(4*i)+2]=sk_avx[i][2];
		b[(4*i)+3]=sk_avx[i][3];
	}
	KARA_eval(b, b_bucket);
	
	matrix_vector_mul_keygen(a_avx, b_bucket, res_avx);// Matrix-vector multiplication; Matrix in transposed order
	
	// Now truncation

		
	for(i=0;i<mlwr_K;i++){ //shift right EQ-EP bits
		for(j=0;j<mlwr_N/16;j++){
			res_avx[i][j]=_mm256_add_epi16 (res_avx[i][j], H1_avx);
			res_avx[i][j]=_mm256_srli_epi16 (res_avx[i][j], (mlwr_EQ-mlwr_EP) );
			res_avx[i][j]=_mm256_and_si256 (res_avx[i][j], mod);			
		}
	}

	//------------------Pack sk into byte string-------
		
	//POLVEC2BS(sk,skpv1,modQ);
	POLSEC2BS(sk, skpv1);

	//------------------Pack pk into byte string-------
	
	for(i=0;i<mlwr_K;i++){ // reuses skpv1[] for unpacking avx of public-key
		  for(j=0;j<mlwr_N/16;j++){
		  	_mm256_maskstore_epi32 ((int *) (skpv1[i]+j*16), mask_load, res_avx[i][j]);
		  }
	  }
	POLVEC2BS(pk,skpv1,modP); // load the public-key into pk byte string 	


	for(i=0;i<mlwr_SEEDBYTES;i++){ // now load the seedbytes in PK. Easy since seed bytes are kept in byte format.
		pk[mlwr_POLYVECCOMPRESSEDBYTES + i]=seed[i]; 
	}

}


void indcpa_kem_enc(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{ 


	uint32_t i,j,k;
	polyvec a[mlwr_K];		// skpv;
	unsigned char seed[mlwr_SEEDBYTES];
	uint16_t pkcl[mlwr_K][mlwr_N]; 	//public key of received by the client


	uint16_t skpv1[mlwr_K][mlwr_N];
	uint16_t temp[mlwr_K][mlwr_N];
	uint16_t message[mlwr_N];

	unsigned char msk_c[mlwr_SCALEBYTES_KEM];

	uint64_t CLOCK1, CLOCK2;
	//--------------AVX declaration------------------
	
	  __m256i sk_avx[mlwr_K][mlwr_N/16];
	  __m256i mod, mod_p;
	  __m256i res_avx[mlwr_K][mlwr_N/16];
	  __m256i vprime_avx[mlwr_N/16];
	  __m256i a_avx[mlwr_K][mlwr_K][mlwr_N/16];
	  //__m256i acc[2*mlwr_N/16];

	  __m256i pkcl_avx[mlwr_K][mlwr_N/16];

          __m256i message_avx[mlwr_N/16];
		
	  mask_ar[0]=~(0UL);mask_ar[1]=~(0UL);mask_ar[2]=~(0UL);mask_ar[3]=~(0UL);
	  mask_load = _mm256_loadu_si256 ((__m256i const *)mask_ar);

	  mod=_mm256_set1_epi16(modQ);
	  mod_p=_mm256_set1_epi16(modP);

	  

	floor_round=_mm256_set1_epi16(4);

	H1_avx=_mm256_set1_epi16(h1);
 
	__m256i b_bucket[SCHB_N*7],b[12*4];

	//--------------AVX declaration ends------------------
	
      
	for(i=0;i<mlwr_SEEDBYTES;i++){ // Load the seedbytes in the client seed from PK.
		seed[i]=pk[ mlwr_POLYVECCOMPRESSEDBYTES + i]; 
	}

	count_enc++;
	CLOCK1=cpucycles();
	GenMatrix(a, seed);
	CLOCK2=cpucycles();
	clock_matrix=clock_matrix+(CLOCK2-CLOCK1);
				
	CLOCK1=cpucycles();
	GenSecret(skpv1,noiseseed);
	CLOCK2=cpucycles();
	clock_secret=clock_secret+(CLOCK2-CLOCK1);


	// ----------- Load skpv1 into avx vectors ---------- 
	for(i=0;i<mlwr_K;i++){ 
		for(j=0; j<mlwr_N/16; j++){
		    sk_avx[i][j] = _mm256_loadu_si256 ((__m256i const *) (&skpv1[i][j*16]));
		}
  	}

	// ----------- Load skpv1 into avx vectors ---------- 
	  for(i=0;i<mlwr_K;i++){ 
		  for(j=0;j<mlwr_K;j++){
			  for(k=0;k<mlwr_N/16;k++){
				a_avx[i][j][k]=_mm256_loadu_si256 ((__m256i const *) (&a[i].vec[j].coeffs[k*16]));
			  }
		  }
 	 }
	//-----------------matrix-vector multiplication and rounding

	
	for(i=0;i<12;i++){
		b[(4*i)+0]=sk_avx[i][0];
		b[(4*i)+1]=sk_avx[i][1];
		b[(4*i)+2]=sk_avx[i][2];
		b[(4*i)+3]=sk_avx[i][3];
	}
	CLOCK1=cpucycles();
	KARA_eval(b, b_bucket);
	
	matrix_vector_mul_enc(a_avx, b_bucket, res_avx);// Matrix-vector multiplication; Matrix in normal order
	CLOCK2=cpucycles();
	clock_mv_vv_mul= clock_mv_vv_mul + (CLOCK2-CLOCK1);
	
	// Now truncation

	for(i=0;i<mlwr_K;i++){ //shift right EQ-EP bits
		for(j=0;j<mlwr_N/16;j++){
			res_avx[i][j]=_mm256_add_epi16 (res_avx[i][j], H1_avx);
			res_avx[i][j]=_mm256_srli_epi16 (res_avx[i][j], (mlwr_EQ-mlwr_EP) );
			res_avx[i][j]=_mm256_and_si256 (res_avx[i][j], mod);			

		}
	}


	//-----this result should be put in b_prime for later use in server.
	for(i=0;i<mlwr_K;i++){ // first store in 16 bit arrays
		  for(j=0;j<mlwr_N/16;j++){
			_mm256_maskstore_epi32 ((int *)(temp[i]+j*16), mask_load, res_avx[i][j]);
		  }
	  }
	
	POLVEC2BS(ciphertext,temp, modP); // Pack b_prime into ciphertext byte string

//**************client matrix-vector multiplication ends******************//

	//------now calculate the v'

	//-------unpack the public_key
	BS2POLVEC(pk, pkcl, modP);

	for(i=0;i<mlwr_K;i++){
		for(j=0; j<mlwr_N/16; j++){
		    pkcl_avx[i][j] = _mm256_loadu_si256 ((__m256i const *) (&pkcl[i][j*16]));
		}
	}

	// InnerProduct
	//for(k=0;k<mlwr_N/16;k++){
	//	vprime_avx[k]=_mm256_xor_si256(vprime_avx[k],vprime_avx[k]);
	//}

	// vector-vector scalar multiplication with mod p

	CLOCK1=cpucycles();
	vector_vector_mul(pkcl_avx, b_bucket, vprime_avx);
	CLOCK2=cpucycles();
	clock_mv_vv_mul= clock_mv_vv_mul + (CLOCK2-CLOCK1);



	// Computation of v'+h1 
	for(i=0;i<mlwr_N/16;i++){//adding h1
 		vprime_avx[i]=_mm256_add_epi16(vprime_avx[i], H1_avx);
	}

	// unpack message_received;
	for(j=0; j<mlwr_KEYBYTES; j++)
	{
		for(i=0; i<2; i++)
		{
			message[2*j+i] = ((message_received[j]>>(4*i)) & 0x0f);
		}
	}
	// message encoding
	for(i=0; i<mlwr_N/16; i++)
	{
		message_avx[i] = _mm256_loadu_si256 ((__m256i const *) (&message[i*16]));
		message_avx[i] = _mm256_slli_epi16 (message_avx[i], (mlwr_EP-4) );
	}	

	// SHIFTRIGHT(v'+h1-m mod p, EP-ET)
	for(k=0;k<mlwr_N/16;k++)
	{
		vprime_avx[k]=_mm256_sub_epi16(vprime_avx[k], message_avx[k]);
		vprime_avx[k]=_mm256_and_si256(vprime_avx[k], mod_p);
		vprime_avx[k]=_mm256_srli_epi16 (vprime_avx[k], (mlwr_EP-mlwr_ET) );
	}

	// Unpack avx
	for(j=0;j<mlwr_N/16;j++)
	{
			_mm256_maskstore_epi32 ((int *) (temp[0]+j*16), mask_load, vprime_avx[j]);
	}
	
	
	mlwr_pack_7bit(msk_c, temp[0]);
	


	for(j=0;j<mlwr_SCALEBYTES_KEM;j++){
		ciphertext[mlwr_CIPHERTEXTBYTES + j] = msk_c[j];
	}

}


void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char message_dec[])
{

	uint32_t i,j;
	uint16_t sksv[mlwr_K][mlwr_N]; //secret key of the server
	uint16_t pksv[mlwr_K][mlwr_N];
	uint16_t message_dec_unpacked[mlwr_N];	// one element containes on decrypted bit;
	uint8_t scale_ar[mlwr_SCALEBYTES_KEM];
	uint16_t op[mlwr_N];

	uint64_t CLOCK1, CLOCK2;

	//--------------AVX declaration------------------
	

	  //__m256i mod_p;
	  
	  __m256i v_avx[mlwr_N/16];
	  
	  //__m256i acc[2*mlwr_N/16];

	  __m256i sksv_avx[mlwr_K][mlwr_N/16];
	  __m256i pksv_avx[mlwr_K][mlwr_N/16];
	  
	  mask_ar[0]=~(0UL);mask_ar[1]=~(0UL);mask_ar[2]=~(0UL);mask_ar[3]=~(0UL);
	  mask_load = _mm256_loadu_si256 ((__m256i const *)mask_ar);

	  //mod_p=_mm256_set1_epi16(mlwr_P-1);

	  H2_avx=_mm256_set1_epi16(h2);

	  __m256i b_bucket[SCHB_N*7],b[12*4];
	//--------------AVX declaration ends------------------
	
 	

	//-------unpack the public_key

	//BS2POLVEC(sk, sksv, modQ); //sksv is the secret-key
	BS2POLSEC(sk, sksv);
	BS2POLVEC(ciphertext, pksv, modP); //pksv is the ciphertext

	for(i=0;i<mlwr_K;i++){
		for(j=0; j<mlwr_N/16; j++){
		    sksv_avx[i][j] = _mm256_loadu_si256 ((__m256i const *) (&sksv[i][j*16]));
		    pksv_avx[i][j] = _mm256_loadu_si256 ((__m256i const *) (&pksv[i][j*16]));
		}
	}

	for(i=0;i<mlwr_N/16;i++){
		v_avx[i]=_mm256_xor_si256(v_avx[i],v_avx[i]);
	}


	// InnerProduct(b', s, mod p)
	CLOCK1=cpucycles();
	count_mul++;
	
	for(i=0;i<12;i++){
		b[(4*i)+0]=sksv_avx[i][0];
		b[(4*i)+1]=sksv_avx[i][1];
		b[(4*i)+2]=sksv_avx[i][2];
		b[(4*i)+3]=sksv_avx[i][3];
	}
	KARA_eval(b, b_bucket);
	

	vector_vector_mul(pksv_avx, b_bucket, v_avx);

	CLOCK2=cpucycles();
	clock_mul=clock_mul+(CLOCK2-CLOCK1);


	for(i=0; i<mlwr_N/16; i++){
		_mm256_maskstore_epi32 ((int *)(message_dec_unpacked+i*16), mask_load, v_avx[i]);
	}


	for(i=0;i<mlwr_SCALEBYTES_KEM;i++){
		scale_ar[i]=ciphertext[mlwr_CIPHERTEXTBYTES+i];
	}

	mlwr_un_pack7bit(scale_ar, op);



	//addition of h2
	for(i=0;i<mlwr_N;i++){
		message_dec_unpacked[i]= ( ( message_dec_unpacked[i] + h2 - (op[i]<<(mlwr_EP-mlwr_ET)) ) & (modP) ) >> (mlwr_EP-4);
	}


	POL2MSG(message_dec_unpacked, message_dec);
}

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec){

	int32_t i,j;

	for(j=0; j<mlwr_KEYBYTES; j++)
	{
		message_dec[j] = 0;
		for(i=0; i<2; i++)
		message_dec[j] = message_dec[j] | (message_dec_unpacked[j*2 + i] <<4*i);
	} 

}

void matrix_vector_mul_keygen(__m256i a1_avx_combined[NUM_POLY][NUM_POLY][AVX_N1], __m256i b_bucket[SCHB_N*7], __m256i res_avx[NUM_POLY][AVX_N1]){



	int64_t i,j;

	__m256i c_bucket[2*SCM_SIZE*7],a[12][12*4]; //Holds results for 12 Karatsuba at a time
		
	for(i=0;i<12;i++){
		for(j=0;j<12;j++){
			a[i][(4*j)+0]=a1_avx_combined[j][i][0];
			a[i][(4*j)+1]=a1_avx_combined[j][i][1];
			a[i][(4*j)+2]=a1_avx_combined[j][i][2];
			a[i][(4*j)+3]=a1_avx_combined[j][i][3];
		}
	}
	for(i=0;i<NUM_POLY;i++){
		
		mult_64(a[i], b_bucket, c_bucket, i);
			
		KARA_interpol(c_bucket, res_avx[i]);
	}

}

void matrix_vector_mul_enc(__m256i a1_avx_combined[NUM_POLY][NUM_POLY][AVX_N1], __m256i b_bucket[SCHB_N*7], __m256i res_avx[NUM_POLY][AVX_N1]){



	int64_t i,j;

	__m256i c_bucket[2*SCM_SIZE*7],a[12][12*4]; //Holds results for 12 Karatsuba at a time
	
	for(i=0;i<12;i++){
		for(j=0;j<12;j++){
			a[i][(4*j)+0]=a1_avx_combined[i][j][0];
			a[i][(4*j)+1]=a1_avx_combined[i][j][1];
			a[i][(4*j)+2]=a1_avx_combined[i][j][2];
			a[i][(4*j)+3]=a1_avx_combined[i][j][3];
		}
	}
	for(i=0;i<NUM_POLY;i++){
		
		mult_64(a[i], b_bucket, c_bucket, i);
			
		KARA_interpol(c_bucket, res_avx[i]);
	}

}

void vector_vector_mul(__m256i a_avx[NUM_POLY][AVX_N1], __m256i b_bucket[SCHB_N*7], __m256i res_avx[AVX_N1]){

	int64_t i;

	__m256i c_bucket[2*SCM_SIZE*7],a[12*4]; //Holds results for 12 Karatsuba at a time
	for(i=0;i<12;i++){
		a[(4*i)+0]=a_avx[i][0];
		a[(4*i)+1]=a_avx[i][1];
		a[(4*i)+2]=a_avx[i][2];
		a[(4*i)+3]=a_avx[i][3];
	}


	mult_64(a, b_bucket, c_bucket, 0);		
	
	KARA_interpol(c_bucket, res_avx);
}

