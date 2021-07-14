#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "api.h"
#include "rlwr_indcpa.h"
#include "pack_unpack.h"
#include "rng.h"
#include "cbd.h"
#include "rlwr_params.h"
#include "./polymul/mult.c"
#include "fips202.h"
#include "fips202x4.h"

#define h1 (1<<(rlwr_EQ-rlwr_EP-1))  //2^(EQ-EP-1)

#define h2 ( (1<<(rlwr_EP-2)) - (1<<(rlwr_EP-rlwr_ET-1)) + (1<<(rlwr_EQ-rlwr_EP-1)) )


uint64_t mask_ar[4]={~(0UL)};
__m256i mask_load;
__m256i floor_round;
__m256i H1_avx;	
__m256i H2_avx;

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec);

/*--------------------------------------------------------------------------------------
	This routine loads the constant values for Toom-Cook multiplication 
----------------------------------------------------------------------------------------*/
void load_values(){

	int64_t i;

	int64_t inv3=43691;
	int64_t inv9=36409;
	int64_t inv15=61167;

	int64_t int45=45;
	int64_t int30=30;
	int64_t int0=0;


	int16_t inv3_avx_load[16],inv9_avx_load[16],inv15_avx_load[16],int45_avx_load[16],int30_avx_load[16],int0_avx_load[16];

	for(i=0;i<16;i++){
		inv3_avx_load[i]=inv3;
		inv9_avx_load[i]=inv9;
		inv15_avx_load[i]=inv15;
		int45_avx_load[i]=int45;
		int30_avx_load[i]=int30;
		int0_avx_load[i]=int0;
	}

	inv3_avx = _mm256_loadu_si256 ((__m256i const *) (&inv3_avx_load));
	inv9_avx = _mm256_loadu_si256 ((__m256i const *) (&inv9_avx_load));
	inv15_avx = _mm256_loadu_si256 ((__m256i const *) (&inv15_avx_load));
	int45_avx = _mm256_loadu_si256 ((__m256i const *) (&int45_avx_load));
	int30_avx = _mm256_loadu_si256 ((__m256i const *) (&int30_avx_load));
	int0_avx = _mm256_loadu_si256 ((__m256i const *) (&int0_avx_load));
	mask = _mm256_loadu_si256 ((__m256i const *)mask_ar);	
}



/*-----------------------------------------------------------------------------------
	This routine generates a=768-coefficient polynomials 
-------------------------------------------------------------------------------------*/
void GenPoly(poly *a, const unsigned char *seed) 
{
	int i;
	uint32_t offset_data,offset_byte;
	unsigned char buf[rlwr_POLYBYTES];

  	shake128(buf,rlwr_POLYBYTES,seed,rlwr_SEEDBYTES);
  	
	for(i=0;i<rlwr_N/4;i++){
		offset_byte = 5*i;
		offset_data = 4*i;
		a->coeffs[offset_data + 0]= ( buf[ offset_byte + 0 ] & (0xff)) |  ((buf[ offset_byte + 1 ] & 0x03)<<8);
		a->coeffs[offset_data + 1]= ( (buf[ offset_byte + 1 ]>>2) & (0x3f)) |  ((buf[ offset_byte + 2 ] & 0x0f)<<6);		
		a->coeffs[offset_data + 2]= ( (buf[ offset_byte + 2 ]>>4) & (0x0f)) |  ((buf[ offset_byte + 3 ] & 0x3f)<<4);
		a->coeffs[offset_data + 3]= ( (buf[ offset_byte + 3 ]>>6) & (0x03)) |  ((buf[ offset_byte + 4 ] & 0xff)<<2);		
	}

}

void GenSecret(uint16_t r[rlwr_N],const unsigned char *seed){

		int32_t buf_size= rlwr_MU*rlwr_N/8;

		uint8_t buf[buf_size];

		shake128(buf, buf_size, seed,rlwr_NOISESEEDBYTES);

		cbd(r,buf);
}

void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk)
{
 
  poly a;

  uint16_t skpv1[rlwr_N];

  
 
  unsigned char seed[rlwr_SEEDBYTES];
  unsigned char noiseseed[rlwr_COINBYTES];
  int32_t i,j,k;


//--------------AVX declaration------------------
	
  __m256i sk_avx[rlwr_N/16];
  __m256i mod_p;
  __m256i res_avx[rlwr_N/16];
  __m256i a_avx[rlwr_N/16];
  //__m256i acc[2*rlwr_N/16];


  mask_ar[0]=~(0UL);mask_ar[1]=~(0UL);mask_ar[2]=~(0UL);mask_ar[3]=~(0UL);
  mask_load = _mm256_loadu_si256 ((__m256i const *)mask_ar);
   mod_p=_mm256_set1_epi16(rlwr_P-1);

  floor_round=_mm256_set1_epi16(4);

  H1_avx=_mm256_set1_epi16(h1);



//--------------AVX declaration ends------------------

   load_values();


  randombytes(seed, rlwr_SEEDBYTES);
 
  shake128(seed, rlwr_SEEDBYTES, seed, rlwr_SEEDBYTES); // for not revealing system RNG state
  randombytes(noiseseed, rlwr_COINBYTES);


  GenPoly(&a, seed); //sample matrix A

  GenSecret(skpv1,noiseseed);


 // Load sk into avx vectors		
  for(j=0; j<rlwr_N/16; j++){
            sk_avx[j] = _mm256_loadu_si256 ((__m256i const *) (&skpv1[j*16]));
	}

  // Load a into avx vectors	

  for(k=0;k<rlwr_N/16;k++){
	a_avx[k]=_mm256_loadu_si256 ((__m256i const *) (&a.coeffs[k*16]));
}
  //------------------------do the matrix vector multiplication and rounding------------

	
	mult(a_avx, sk_avx, res_avx);// Matrix-vector multiplication; Matrix in transposed order
	
	
	// Now truncation

		
	 //shift right EQ-EP bits
	for(j=0;j<rlwr_N/16;j++){
		res_avx[j]=_mm256_add_epi16 (res_avx[j], H1_avx);
		res_avx[j]=_mm256_srli_epi16 (res_avx[j], (rlwr_EQ-rlwr_EP) );
		res_avx[j]=_mm256_and_si256 (res_avx[j], mod_p);			
	}

	//------------------Pack sk into byte string-------
		
	//rlwr_pack_10bit(sk, skpv1);
	POLSEC2BS(sk, skpv1);

	//------------------Pack pk into byte string-------
	
	 // reuses skpv1[] for unpacking avx of public-key
	for(j=0;j<rlwr_N/16;j++){
	  	_mm256_maskstore_epi32 ((int *) (skpv1+j*16), mask_load, res_avx[j]);
	}
	rlwr_pack_9bit(pk, skpv1); // load the public-key into pk byte string 	


	for(i=0;i<rlwr_SEEDBYTES;i++){ // now load the seedbytes in PK. Easy since seed bytes are kept in byte format.
		pk[rlwr_POLYCOMPRESSEDBYTES + i]=seed[i]; 
	}

}


void indcpa_kem_enc(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{ 


	uint32_t i,j,k;
	poly a;		// skpv;
	unsigned char seed[rlwr_SEEDBYTES];
	uint16_t pkcl[rlwr_N]; 	//public key of received by the client


	uint16_t skpv1[rlwr_N];
	uint16_t temp[rlwr_N];
	uint16_t message[rlwr_N];

	unsigned char msk_c[rlwr_SCALEBYTES_KEM];

	uint64_t CLOCK1, CLOCK2;
	//--------------AVX declaration------------------
	
	  __m256i sk_avx[rlwr_N/16];
	  __m256i mod_p;
	  __m256i res_avx[rlwr_N/16];
	  __m256i vprime_avx[rlwr_N/16];
	  __m256i a_avx[rlwr_N/16];
	  //__m256i acc[2*rlwr_N/16];

	  __m256i pkcl_avx[rlwr_N/16];

          __m256i message_avx[rlwr_N/16];
		
	  mask_ar[0]=~(0UL);mask_ar[1]=~(0UL);mask_ar[2]=~(0UL);mask_ar[3]=~(0UL);
	  mask_load = _mm256_loadu_si256 ((__m256i const *)mask_ar);

	
	  mod_p=_mm256_set1_epi16(rlwr_P-1);

	  

	floor_round=_mm256_set1_epi16(4);

	H1_avx=_mm256_set1_epi16(h1);
 

	//--------------AVX declaration ends------------------
	load_values();
      
	for(i=0;i<rlwr_SEEDBYTES;i++){ // Load the seedbytes in the client seed from PK.
		seed[i]=pk[ rlwr_POLYCOMPRESSEDBYTES + i]; 
	}

	count_enc++;
	CLOCK1=cpucycles();
	GenPoly(&a, seed);
	CLOCK2=cpucycles();
	clock_matrix=clock_matrix+(CLOCK2-CLOCK1);
				
	CLOCK1=cpucycles();
	GenSecret(skpv1,noiseseed);
	CLOCK2=cpucycles();
	clock_secret=clock_secret+(CLOCK2-CLOCK1);


	// ----------- Load skpv1 into avx vectors ---------- 
	for(j=0; j<rlwr_N/16; j++){
	    sk_avx[j] = _mm256_loadu_si256 ((__m256i const *) (&skpv1[j*16]));
  	}

	// ----------- Load skpv1 into avx vectors ---------- 
	for(k=0;k<rlwr_N/16;k++){
		a_avx[k]=_mm256_loadu_si256 ((__m256i const *) (&a.coeffs[k*16]));
	}
	
	//-----------------matrix-vector multiplication and rounding

	CLOCK1=cpucycles();
	
	mult(a_avx, sk_avx, res_avx);// Matrix-vector multiplication; Matrix in normal order
	CLOCK2=cpucycles();
	clock_mv_vv_mul= clock_mv_vv_mul + (CLOCK2-CLOCK1);
	
	// Now truncation

	 //shift right EQ-EP bits
	for(j=0;j<rlwr_N/16;j++){
		res_avx[j]=_mm256_add_epi16 (res_avx[j], H1_avx);
		res_avx[j]=_mm256_srli_epi16 (res_avx[j], (rlwr_EQ-rlwr_EP) );
		res_avx[j]=_mm256_and_si256 (res_avx[j], mod_p);			
	}


	//-----this result should be put in b_prime for later use in server.
	// first store in 16 bit arrays
	for(j=0;j<rlwr_N/16;j++){
		_mm256_maskstore_epi32 ((int *)(temp+j*16), mask_load, res_avx[j]);
	}
	 
	rlwr_pack_9bit(ciphertext,temp);// Pack b_prime into ciphertext byte string

//**************client matrix-vector multiplication ends******************//

	//------now calculate the v'

	//-------unpack the public_key
	
	rlwr_un_pack9bit(pk, pkcl);
	
	for(j=0; j<rlwr_N/16; j++){
	    pkcl_avx[j] = _mm256_loadu_si256 ((__m256i const *) (&pkcl[j*16]));
	}
	

	// InnerProduct
	

	// vector-vector scalar multiplication with mod p

	CLOCK1=cpucycles();
	mult(pkcl_avx, sk_avx, vprime_avx);
	CLOCK2=cpucycles();
	clock_mv_vv_mul= clock_mv_vv_mul + (CLOCK2-CLOCK1);

	for(j=0;j<rlwr_N/16;j++){
		vprime_avx[j]=_mm256_and_si256 (vprime_avx[j], mod_p);			
	}

	// Computation of v'+h1 
	for(i=0;i<rlwr_N/16;i++){//adding h1
 		vprime_avx[i]=_mm256_add_epi16(vprime_avx[i], H1_avx);
	}

	// unpack message_received;
	rlwr_un_pack1bit(message_received,message);
	
	// message encoding
	for(i=0; i<rlwr_N/16; i++)
	{
		message_avx[i] = _mm256_loadu_si256 ((__m256i const *) (&message[i*16]));
		message_avx[i] = _mm256_slli_epi16 (message_avx[i], (rlwr_EP-1) );
	}	

	// SHIFTRIGHT(v'+h1-m mod p, EP-ET)
	for(k=0;k<rlwr_N/16;k++)
	{
		vprime_avx[k]=_mm256_sub_epi16(vprime_avx[k], message_avx[k]);
		vprime_avx[k]=_mm256_and_si256(vprime_avx[k], mod_p);
		vprime_avx[k]=_mm256_srli_epi16 (vprime_avx[k], (rlwr_EP-rlwr_ET) );
	}

	// Unpack avx
	for(j=0;j<rlwr_N/16;j++)
	{
		_mm256_maskstore_epi32 ((int *) (temp+j*16), mask_load, vprime_avx[j]);
	}
	rlwr_pack_4bit(msk_c, temp);
	

	for(j=0;j<rlwr_SCALEBYTES_KEM;j++){
		ciphertext[rlwr_CIPHERTEXTBYTES + j] = msk_c[j];
	}

}


void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char message_dec[])
{

	uint32_t i,j;
	uint16_t sksv[rlwr_N]; //secret key of the server
	uint16_t pksv[rlwr_N];
	uint16_t message_dec_unpacked[rlwr_N];	// one element containes on decrypted bit;
	uint8_t scale_ar[rlwr_SCALEBYTES_KEM];
	uint16_t op[rlwr_N];

	uint64_t CLOCK1, CLOCK2;

	//--------------AVX declaration------------------
	

	  //__m256i mod_p;
	  
	  __m256i v_avx[rlwr_N/16];
	  
	  //__m256i acc[2*rlwr_N/16];

	  __m256i sksv_avx[rlwr_N/16];
	  __m256i pksv_avx[rlwr_N/16],mod_p;
	  
	  mask_ar[0]=~(0UL);mask_ar[1]=~(0UL);mask_ar[2]=~(0UL);mask_ar[3]=~(0UL);
	  mask_load = _mm256_loadu_si256 ((__m256i const *)mask_ar);

	  H2_avx=_mm256_set1_epi16(h2);
	mod_p=_mm256_set1_epi16(rlwr_P-1);
	
	//--------------AVX declaration ends------------------
	
 	load_values();

	//-------unpack the public_key

	//rlwr_un_pack10bit(sk, sksv);
	BS2POLSEC(sk, sksv); //sksv is the secret-key
	
	//------sk(mod p)------------
	
	for(i=0;i<rlwr_N;i++)
		sksv[i] = sksv[i] & (rlwr_P-1);
		
	rlwr_un_pack9bit(ciphertext, pksv); //pksv is the ciphertext	

	for(j=0; j<rlwr_N/16; j++){
		sksv_avx[j] = _mm256_loadu_si256 ((__m256i const *) (&sksv[j*16]));
                pksv_avx[j] = _mm256_loadu_si256 ((__m256i const *) (&pksv[j*16]));
	}

	// InnerProduct(b', s, mod p)
	CLOCK1=cpucycles();
	count_mul++;

	mult(pksv_avx, sksv_avx, v_avx);

	CLOCK2=cpucycles();
	clock_mul=clock_mul+(CLOCK2-CLOCK1);
	for(j=0;j<rlwr_N/16;j++){
		v_avx[j]=_mm256_and_si256 (v_avx[j], mod_p);			
	}

	for(i=0; i<rlwr_N/16; i++){
		_mm256_maskstore_epi32 ((int *)(message_dec_unpacked+i*16), mask_load, v_avx[i]);
	}


	for(i=0;i<rlwr_SCALEBYTES_KEM;i++){
		scale_ar[i]=ciphertext[rlwr_CIPHERTEXTBYTES+i];
	}
	rlwr_un_pack4bit(scale_ar, op);
	

	//addition of h2
	for(i=0;i<rlwr_N;i++){
		message_dec_unpacked[i]= ( ( message_dec_unpacked[i] + h2 - (op[i]<<(rlwr_EP-rlwr_ET)) ) & (rlwr_P-1) ) >> (rlwr_EP-1);
	}

	// pack decrypted message
	
	rlwr_pack_1bit(message_dec, message_dec_unpacked);
	
}

void original_msg(unsigned char *buf1_byte,unsigned char *buf_byte)
{
	uint32_t i;
	uint16_t buf1[rlwr_N],buf[rlwr_N/3];
	
	//-------unpack buf1_byte---------
  	
  	rlwr_un_pack1bit(buf1_byte, buf1);

	for(i=0;i<rlwr_N/3;i++)
	{
		if(((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==0))||((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==1))||((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==0))||((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==0)))
			buf[i] = 0;
		if(((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==1))||((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==0))||((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==1))||((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==1)))
			buf[i] = 1;
	}
	for(i=0;i<rlwr_N/24;i++)
	{
		buf_byte[i] = ( buf[ 8*i + 0 ] & 0x01)|(( buf[ 8*i + 1 ] & 0x01)<<1)|(( buf[ 8*i + 2 ] & 0x01)<<2)|(( buf[ 8*i + 3 ] & 0x01)<<3)|(( buf[ 8*i + 4 ] & 0x01)<<4)|(( buf[ 8*i + 5] & 0x01)<<5)|(( buf[ 8*i + 6 ] & 0x01)<<6)|(( buf[ 8*i + 7 ] & 0x01)<<7);
	}	
}

