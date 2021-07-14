#include <string.h>
#include <stdint.h>
#include<stdlib.h>
#include "rlwr_indcpa.h"
#include "poly.h"
#include "pack_unpack.h"
#include "rng.h"
#include "fips202.h"
#include "rlwr_params.h"
#include "cbd.h"
#include "poly_mul.h"

#include "cpucycles.h"



#define h1 (1<<(rlwr_EQ-rlwr_EP-1))  //2^(EQ-EP-1)

#define h2 ( (1<<(rlwr_EP-2)) - (1<<(rlwr_EP-rlwr_ET-1)) + (1<<(rlwr_EQ-rlwr_EP-1)) )


void printBstr(char *S, unsigned char *A, unsigned long long L)
{
	unsigned long long  i;

	printf("%s", S);

	for ( i=0; i<L; i++ )
		printf("%02X", A[i]);

	if ( L == 0 )
		printf("00");

	printf("\n");
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


void indcpa_kem_keypair(unsigned char *pk_byte, unsigned char *sk_byte)
{
	poly a;
	int i;
	uint16_t pk[rlwr_N],sk[rlwr_N];
	unsigned char seed[rlwr_SEEDBYTES];
  	unsigned char noiseseed[rlwr_COINBYTES];
	uint16_t mod_q = rlwr_Q-1;
	//uint64_t c1,c2;

  	// Key Generation
  	
	randombytes(seed, rlwr_SEEDBYTES);
	shake128(seed, rlwr_SEEDBYTES, seed, rlwr_SEEDBYTES); // for not revealing system RNG state
	randombytes(noiseseed, rlwr_COINBYTES);
	  
	GenPoly(&a,seed); // sample matrix A
	
  	GenSecret(sk,noiseseed); // generate secret from constant-time binomial distribution
		
	
	
  	
  	//------------------------do the polynomial multiplication and rounding--------------------
  	//c1 = cpucycles();
	pol_mul((uint16_t *)&a, sk, pk, rlwr_Q, rlwr_N);
	//c2 = cpucycles();
	//CLOCK_poly_mul = CLOCK_poly_mul+(c2-c1);
	//---rounding---
	
	for(i=0;i<rlwr_N;i++){ // shift right 2 bits
		pk[i] = (pk[i] + h1) & (mod_q);
		pk[i] = (pk[i] >> (rlwr_EQ - rlwr_EP));
	}
	
	//------------------unload and pack sk= 768 coefficients of 10 bits------------------------
	
	//rlwr_pack_10bit(sk_byte, sk);
	POLSEC2BS(sk_byte, sk);
	
	//------------------unload and pack pk=256 bits seed and 768 coefficients of 10 bits-------
	
	rlwr_pack_9bit(pk_byte, pk); // load the public-key coefficients
	
	for(i=0;i<rlwr_SEEDBYTES;i++){ // now load the seedbytes in PK. Easy since seed bytes are kept in byte format.
		pk_byte[rlwr_POLYCOMPRESSEDBYTES + i]=seed[i]; 
	}
	
}


void indcpa_kem_enc(unsigned char *message_received_byte, unsigned char *noiseseed, const unsigned char *pk_byte, unsigned char *ciphertext_byte)
{ 	
	poly a;
	int i;
	unsigned char seed[rlwr_COINBYTES],vprime_byte[rlwr_SCALEBYTES_KEM];
	uint16_t sk1[rlwr_N],message_received[rlwr_N],pk[rlwr_N],ciphertext[rlwr_N],vprime[rlwr_N];
	uint16_t mod_q = rlwr_Q-1;
	uint16_t mod_p = rlwr_P-1;
	
	
	
	
	
	for(i=0;i<rlwr_SEEDBYTES;i++){ // extract the seedbytes from Public Key.
		seed[i]=pk_byte[ rlwr_POLYCOMPRESSEDBYTES + i]; 
	}
	
	GenPoly(&a,seed); // matrix A
	
  	GenSecret(sk1,noiseseed); // generate secret from constant-time binomial distribution
  	
  	//-----------------polynomial multiplication and rounding----------------------------
  	
	pol_mul((uint16_t *)&a, sk1, ciphertext, rlwr_Q, rlwr_N);
	
	
	//---rounding---
	
	for(i=0;i<rlwr_N;i++){ // shift right 1 bits
		ciphertext[i] = (ciphertext[i] + h1) & (mod_q);
		ciphertext[i] = (ciphertext[i] >> (rlwr_EQ - rlwr_EP));
	}
	
	//---packing---
	
	rlwr_pack_9bit(ciphertext_byte, ciphertext);
	
	
	//------now calculate the vprime------

	//-------unpack the public_key-------
	
	rlwr_un_pack9bit(pk_byte, pk);
	
	//------sk1(mod p)------------
	
  	for(i=0;i<rlwr_N;i++)
		sk1[i] = sk1[i] & (mod_p);
	
	//----polynomial multiplication in mod p------
	
	pol_mul(pk, sk1, vprime, rlwr_P, rlwr_N);
	
	//-----addition of h1 to vprime--------
	
	for(i=0;i<rlwr_N;i++){
		vprime[i]=vprime[i]+h1;
	}
  	
  	//-------unpack message_received---------
  	
  	rlwr_un_pack1bit(message_received_byte, message_received);
  		
  	// message encoding
  	
	for(i=0; i<rlwr_N; i++)
	{
		message_received[i] = (message_received[i]<<(rlwr_EP-1));		
	}
	
	for(i=0;i<rlwr_N;i++)
	{
		vprime[i]=( (vprime[i] - message_received[i]) & (mod_p) )>>(rlwr_EP-rlwr_ET);
	}
	

	//---------pack vprime--------------
	
	rlwr_pack_4bit(vprime_byte, vprime);
	
	
	//----------ultimate packed ciphertext--------
	
	for(i=0;i<rlwr_SCALEBYTES_KEM;i++){
		ciphertext_byte[rlwr_POLYCOMPRESSEDBYTES + i] = vprime_byte[i];
	}
	
}


void indcpa_kem_dec(const unsigned char *sk_byte, const unsigned char *ciphertext_byte, unsigned char *message_dec_byte)
{
	int i;
	//unsigned char vprime_byte[rlwr_SCALEBYTES_KEM];
	uint16_t v[rlwr_N],sk[rlwr_N],ciphertext[rlwr_N],vprime[rlwr_N];
	uint16_t mod_p = rlwr_P-1;
	
	//-------unpack secret key of server---------
	
	//rlwr_un_pack10bit(sk_byte, sk);
	BS2POLSEC(sk_byte, sk);
	
	//------sk(mod p)------------
	
	for(i=0;i<rlwr_N;i++)
		sk[i] = sk[i] & (mod_p);
		
	//-------unpack ciphertext---------
	rlwr_un_pack9bit(ciphertext_byte, ciphertext);
	
	
	//----polynomial multiplication in mod p------
	
	pol_mul(ciphertext,sk,v,rlwr_P,rlwr_N);	
	
	
	//------extraction---------
	
	/*for(i=0;i<rlwr_SCALEBYTES_KEM;i++){
		vprime_byte[i]=ciphertext_byte[rlwr_POLYCOMPRESSEDBYTES+i];
	}*/
	
	//-------unpack vprime_byte---------
	
	rlwr_un_pack4bit(ciphertext_byte+rlwr_POLYCOMPRESSEDBYTES, vprime);	
	
  	//--------addition of h2----------
  	
	for(i=0;i<rlwr_N;i++){
		v[i]= ( ( v[i] + h2 - (vprime[i]<<(rlwr_EP-rlwr_ET)) ) & (mod_p) ) >> (rlwr_EP-1);
	}
	
	
	// pack decrypted message
	
	rlwr_pack_1bit(message_dec_byte, v);
		
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



