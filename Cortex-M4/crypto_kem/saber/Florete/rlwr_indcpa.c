#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include "rlwr_indcpa.h"
#include "poly.h"
#include "pack_unpack.h"
#include "fips202.h"
#include "params.h"
#include "randombytes.h"
#include "poly_mul.h"
void GenPoly(uint16_t *a, const unsigned char *seed);
//void printBstr(char *S, unsigned char *A, unsigned long long L);


#define h1 1  //2^(EQ-EP-1)

#define h2 ( (1<<(rlwr_EP-2)) - (1<<(rlwr_EP-rlwr_ET-1)) + (1<<(rlwr_EQ-rlwr_EP-1)) )


/*void printBstr(char *S, unsigned char *A, unsigned long long L)
{
	unsigned long long  i;

	printf("%s", S);

	for ( i=0; i<L; i++ )
		printf("%02X", A[i]);

	if ( L == 0 )
		printf("00");

	printf("\n");
}*/

/*-----------------------------------------------------------------------------------
	This routine generates a=768-coefficient polynomials 
-------------------------------------------------------------------------------------*/
void GenPoly(uint16_t *a, const unsigned char *seed) 
{
	int i;
	uint32_t offset_data,offset_byte;
	unsigned char buf[rlwr_POLYBYTES];

  	shake128(buf,rlwr_POLYBYTES,seed,rlwr_SEEDBYTES);
  	
	for(i=0;i<rlwr_N/4;i++){
		offset_byte = 5*i;
		offset_data = 4*i;
		a[offset_data + 0]= ( buf[ offset_byte + 0 ] & (0xff)) |  ((buf[ offset_byte + 1 ] & 0x03)<<8);
		a[offset_data + 1]= ( (buf[ offset_byte + 1 ]>>2) & (0x3f)) |  ((buf[ offset_byte + 2 ] & 0x0f)<<6);		
		a[offset_data + 2]= ( (buf[ offset_byte + 2 ]>>4) & (0x0f)) |  ((buf[ offset_byte + 3 ] & 0x3f)<<4);
		a[offset_data + 3]= ( (buf[ offset_byte + 3 ]>>6) & (0x03)) |  ((buf[ offset_byte + 4 ] & 0xff)<<2);		
	}

}


void indcpa_kem_keypair(unsigned char *pk_byte, unsigned char *sk_byte)
{
	int i;
	uint16_t pk[rlwr_N],sk[rlwr_N];
	
  	// Key Generation
  	
	randombytes(&pk_byte[rlwr_POLYCOMPRESSEDBYTES], rlwr_SEEDBYTES);
	shake128(&pk_byte[rlwr_POLYCOMPRESSEDBYTES], rlwr_SEEDBYTES, &pk_byte[rlwr_POLYCOMPRESSEDBYTES], rlwr_SEEDBYTES); // for not revealing system RNG state
	randombytes(sk_byte, rlwr_COINBYTES); 
	GenPoly(pk,&pk_byte[rlwr_POLYCOMPRESSEDBYTES]); // sample matrix A
  	GenSecret(sk,sk_byte); // generate secret from constant-time binomial distribution
	
  	
  	//------------------------do the polynomial multiplication and rounding--------------------
  	
	pol_mul(pk, sk, pk);
	
	//---rounding---
	
	for(i=0;i<rlwr_N;i++){ // shift right 1 bit
		pk[i] = (pk[i] + h1) & (rlwr_Q-1);
		pk[i] = (pk[i] >> 1);
	}
	
	//------------------unload and pack sk= 768 coefficients of 12 bits------------------------
	
	//rlwr_pack_10bit(sk_byte, sk);
	POLSEC2BS(sk_byte, sk);
	
	//------------------unload and pack pk=256 bits seed and 768 coefficients of 10 bits-------
	
	rlwr_pack_9bit(pk_byte, pk); // load the public-key coefficients
	
}


void indcpa_kem_enc(unsigned char *message_received_byte, unsigned char *noiseseed, const unsigned char *pk_byte, unsigned char *ciphertext_byte)
{ 	
	int i;
	uint16_t sk1[rlwr_N],ciphertext[rlwr_N];
	
	GenPoly(ciphertext,&pk_byte[rlwr_POLYCOMPRESSEDBYTES]); // matrix A
	
  	GenSecret(sk1,noiseseed); // generate secret from constant-time binomial distribution
  	
  	//-----------------polynomial multiplication and rounding----------------------------
  	
	pol_mul(ciphertext, sk1, ciphertext);
	
	
	//---rounding---
	
	for(i=0;i<rlwr_N;i++){ // shift right 1 bit
		ciphertext[i] = (ciphertext[i] + h1) & (rlwr_Q-1);
		ciphertext[i] = (ciphertext[i] >> 1);
	}
	
	//---packing---
	
	rlwr_pack_9bit(ciphertext_byte, ciphertext);
	
	
	//------now calculate the vprime------

	//-------unpack the public_key-------
	
	rlwr_un_pack9bit(pk_byte, ciphertext);
	
	//----polynomial multiplication in mod p------
	
	pol_mul(ciphertext, sk1, sk1);
	
	//-----addition of h1 to vprime--------
	
	for(i=0;i<rlwr_N;i++){
		sk1[i]=(sk1[i]+h1)& (rlwr_P-1);
	}
  	
  	//-------unpack message_received---------
  	
  	rlwr_un_pack1bit(message_received_byte, ciphertext);
  		
  	// message encoding
  	

	for(i=0;i<rlwr_N;i++)
	{
		sk1[i]=(sk1[i] - (ciphertext[i]<<8))>>6;
	}
	

	//---------pack vprime--------------
	
	rlwr_pack_4bit(&ciphertext_byte[rlwr_POLYCOMPRESSEDBYTES], sk1);
	
}


void indcpa_kem_dec(const unsigned char *sk_byte, const unsigned char *ciphertext_byte, unsigned char *message_dec_byte)
{
	int i;
	uint16_t sk[rlwr_N],ciphertext[rlwr_N];
	
	//-------unpack secret key of server---------
	
	//rlwr_un_pack10bit(sk_byte, sk);
	BS2POLSEC(sk_byte, sk);
		
	//-------unpack ciphertext---------
	rlwr_un_pack9bit(ciphertext_byte, ciphertext);
	
	
	//----polynomial multiplication in mod p------
	
	pol_mul(ciphertext,sk,sk);	
	
	
	//------extraction---------
	
	//-------unpack vprime_byte---------
	
	rlwr_un_pack4bit(&ciphertext_byte[rlwr_POLYCOMPRESSEDBYTES], ciphertext);	
	
  	//--------addition of h2----------
  	
	for(i=0;i<rlwr_N;i++){
		sk[i]= ( ( sk[i] + h2 - (ciphertext[i]<<6) ) & (rlwr_P-1) ) >> 8;
	}
	
	
	// pack decrypted message
	
	rlwr_pack_1bit(message_dec_byte, sk);
		
}

void original_msg(unsigned char *buf1_byte,unsigned char *buf_byte)
{
	uint32_t i;
	uint16_t buf1[rlwr_N];
	
	//-------unpack buf1_byte---------
  	
  	rlwr_un_pack1bit(buf1_byte, buf1);

	for(i=0;i<rlwr_N/3;i++)
	{
		if(((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==0))||((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==1))||((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==0))||((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==0)))
			buf1[i] = 0;
		if(((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==1))||((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==0))||((buf1[i]==1)&&(buf1[(rlwr_N/3)+i]==0)&&(buf1[2*(rlwr_N/3)+i]==1))||((buf1[i]==0)&&(buf1[(rlwr_N/3)+i]==1)&&(buf1[2*(rlwr_N/3)+i]==1)))
			buf1[i] = 1;
	}
	for(i=0;i<rlwr_N/24;i++)
	{
		buf_byte[i] = ( buf1[ 8*i + 0 ] & 0x01)|(( buf1[ 8*i + 1 ] & 0x01)<<1)|(( buf1[ 8*i + 2 ] & 0x01)<<2)|(( buf1[ 8*i + 3 ] & 0x01)<<3)|(( buf1[ 8*i + 4 ] & 0x01)<<4)|(( buf1[ 8*i + 5] & 0x01)<<5)|(( buf1[ 8*i + 6 ] & 0x01)<<6)|(( buf1[ 8*i + 7 ] & 0x01)<<7);
	}	
}


unsigned char indcpa_kem_enc_cmp(unsigned char *message_received_byte, unsigned char *noiseseed, const unsigned char *pk_byte, unsigned char *ciphertext_byte)
{ 	
	unsigned char fail = 0;
	int i;
	uint16_t sk1[rlwr_N],ciphertext[rlwr_N];
	
	GenPoly(ciphertext,&pk_byte[rlwr_POLYCOMPRESSEDBYTES]); // matrix A
	
  	GenSecret(sk1,noiseseed); // generate secret from constant-time binomial distribution
  	
  	//-----------------polynomial multiplication and rounding----------------------------
  	
	pol_mul(ciphertext, sk1, ciphertext);
	
	
	//---rounding---
	
	for(i=0;i<rlwr_N;i++){ // shift right 1 bit
		ciphertext[i] = (ciphertext[i] + h1) & (rlwr_Q-1);
		ciphertext[i] = (ciphertext[i] >> 1);
	}
	
	//---packing---
	
	fail |= rlwr_pack_9bit_cmp(ciphertext_byte, ciphertext);
	
	
	//------now calculate the vprime------

	//-------unpack the public_key-------
	
	rlwr_un_pack9bit(pk_byte, ciphertext);
	
	//----polynomial multiplication in mod p------
	
	pol_mul(ciphertext, sk1, sk1);
	
	//-----addition of h1 to vprime--------
	
	for(i=0;i<rlwr_N;i++){
		sk1[i]=(sk1[i]+h1)& (rlwr_P-1);
	}
  	
  	//-------unpack message_received---------
  	
  	rlwr_un_pack1bit(message_received_byte, ciphertext);
  		
  	// message encoding
  	

	for(i=0;i<rlwr_N;i++)
	{
		sk1[i]=(sk1[i] - (ciphertext[i]<<8))>>6;
	}
	

	//---------pack vprime--------------
	
	fail |= rlwr_pack_3bit_cmp(&ciphertext_byte[rlwr_POLYCOMPRESSEDBYTES], sk1);
	fail = ~fail + 1;
	fail >>= 63;

	return (unsigned char)fail;
}



