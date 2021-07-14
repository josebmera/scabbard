#include "mlwr_indcpa.h"


void byte_bank2pol_part(unsigned char *bytes, uint16_t pol_part[], uint16_t pol_part_start_index, uint16_t num_8coeff)
{
	uint32_t j;
	uint32_t offset_data=0, offset_byte=0;	
	
	offset_byte=0;

	for(j=0;j<num_8coeff;j++)
	{
		offset_byte=15*j;
		offset_data=pol_part_start_index+8*j;
		
		pol_part[offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) | ((bytes[offset_byte + 1] & 0x7f)<<8);
		pol_part[offset_data + 1]= ( bytes[ offset_byte + 1 ]>>7 & (0x01)) | ((bytes[offset_byte + 2] & 0xff)<<1) | ((bytes[offset_byte + 3] & 0x3f)<<9);
		pol_part[offset_data + 2]= ( bytes[ offset_byte + 3 ]>>6 & (0x03)) | ((bytes[offset_byte + 4] & 0xff)<<2) | ((bytes[offset_byte + 5] & 0x1f)<<10);;
		pol_part[offset_data + 3]= ( bytes[ offset_byte + 5 ]>>5 & (0x07)) | ((bytes[offset_byte + 6] & 0xff)<<3) | ((bytes[offset_byte + 7] & 0x0f)<<11);
		pol_part[offset_data + 4]= ( bytes[ offset_byte + 7 ]>>4 & (0x0f)) | ((bytes[offset_byte + 8] & 0xff)<<4) | ((bytes[offset_byte + 9] & 0x07)<<12);
		pol_part[offset_data + 5]= ( bytes[ offset_byte + 9 ]>>3 & (0x1f)) | ((bytes[offset_byte + 10] & 0xff)<<5) | ((bytes[offset_byte + 11] & 0x03)<<13);
		pol_part[offset_data + 6]= ( bytes[ offset_byte + 11]>>2 & (0x3f)) | ((bytes[offset_byte + 12] & 0xff)<<6) | ((bytes[offset_byte + 13] & 0x01)<<14);
		pol_part[offset_data + 7]= ( bytes[ offset_byte + 13]>>1 & (0x7f)) | ((bytes[offset_byte + 14] & 0xff)<<7);
	}
}


void GenMatrix_poly(uint16_t temp_ar[], const unsigned char *seed, uint16_t poly_number) 
{
  static unsigned char shake_op_buf[SHAKE128_RATE+96];	// there can be at most 112 bytes left over from previous shake call

  static int i,j;

  static uint64_t s[25];
  
  static uint16_t pol_part_start_index, num_8coeff, num_8coeff_final, left_over_bytes, total_bytes;
  static uint16_t poly_complete;


	// Init state when poly_number=0;

	if(poly_number==0)
	{
		for (i = 0; i < 25; ++i)
    		s[i] = 0;
  
  		keccak_absorb(s, SHAKE128_RATE, seed, mlwr_SEEDBYTES, 0x1F);

  		pol_part_start_index=0; num_8coeff=0; left_over_bytes=0; total_bytes=0; 
  		//printf("ting0000");
	}


  poly_complete=0;

  while(poly_complete!=1)
  {	

	if(left_over_bytes>=120)
		total_bytes = left_over_bytes;
	else{
		keccak_squeezeblocks(shake_op_buf+left_over_bytes, 1, s, SHAKE128_RATE);
	  	total_bytes = left_over_bytes + SHAKE128_RATE;
	}

  	num_8coeff = total_bytes/15;

	if((num_8coeff*8+pol_part_start_index)>64)
		num_8coeff_final=8-pol_part_start_index/8;
	else 
		num_8coeff_final=num_8coeff;

	
  	byte_bank2pol_part(shake_op_buf, temp_ar, pol_part_start_index, num_8coeff_final);

  	left_over_bytes = total_bytes - num_8coeff_final*15;	


  	for(j=0; j<left_over_bytes; j++)	// bring the leftover in the begining of the buffer.
  		shake_op_buf[j] = shake_op_buf[num_8coeff_final*15+j];	

  	pol_part_start_index = pol_part_start_index + num_8coeff_final*8;	// this will be >256 when the polynomial is complete.

  	if(pol_part_start_index>63) 
  	{	 
		pol_part_start_index=0;
		poly_complete++;
	}
  }

}


void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk)
{
  int32_t i,j;
  uint16_t res[mlwr_K][mlwr_N];


  randombytes(&pk[mlwr_POLYVECCOMPRESSEDBYTES], mlwr_SEEDBYTES);
  shake128(&pk[mlwr_POLYVECCOMPRESSEDBYTES], mlwr_SEEDBYTES, &pk[mlwr_POLYVECCOMPRESSEDBYTES], mlwr_SEEDBYTES); // for not revealing system RNG state
  randombytes(sk, mlwr_COINBYTES);
 
  GenSecret_new(sk,sk);//generate secret from constant-time binomial distribution
 
  //------------------------do the matrix vector multiplication and rounding------------

	for(i=0;i<mlwr_K;i++){
		for(j=0;j<mlwr_N;j++){
			res[i][j]=0;
		}
	}
	
	MatrixVectorMul_keygen(&pk[mlwr_POLYVECCOMPRESSEDBYTES],sk,res);
  	
	//-----now rounding
	for(i=0;i<mlwr_K;i++){ //shift right 1 bits
		for(j=0;j<mlwr_N;j++){
			res[i][j]=(res[i][j] + h1) & modQ;
			res[i][j]=(res[i][j]>>(mlwr_EQ-mlwr_EP));
		}
	}
	
	//------------------unload and pack pk=256 bits seed and 9 x (64 coefficients of 9 bits)-------

	
	POLVECp2BS(pk, res); // load the public-key coefficients
	
}


void indcpa_kem_enc(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{
	uint32_t i,j;
	uint16_t message_bit;
	uint8_t skpv[mlwr_K*mlwr_N/2];
	uint16_t vprime[mlwr_N];
				

	GenSecret_new(skpv,noiseseed);//generate secret from constant-time binomial distribution
	
	//------now calculate the v'

	for(i=0;i<mlwr_N;i++)
		vprime[i]=0;

	InnerProd(pk,skpv,vprime);

	//-----------------matrix-vector multiplication and rounding
	
	MatrixVectorMul_enc(&pk[mlwr_POLYVECCOMPRESSEDBYTES],skpv,ciphertext);
	

//*******************client matrix-vector multiplication ends************************************

	
	//addition of h1 to vprime
	for(i=0;i<mlwr_N;i++)
		vprime[i]=(vprime[i]+h1);

	
	// unpack message_received;
	for(j=0; j<mlwr_KEYBYTES; j++)
	{
		//8/4=2
		for(i=0; i<2; i++)
		{
			message_bit = ((message_received[j]>>4*i) & 0x0f);
			message_bit = (message_bit<<(mlwr_EP-4));
			vprime[j*2+i]=( (vprime[j*2+i] - message_bit) & modP )>>(mlwr_EP-mlwr_ET);
		}
	}

	mlwr_pack_7bit(&ciphertext[mlwr_POLYVECCOMPRESSEDBYTES], vprime);

}


void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char *message_dec)
{

	uint32_t i;
	uint16_t v[mlwr_N];
	
	//Extraction
	
	mlwr_un_pack7bit(&ciphertext[mlwr_POLYVECCOMPRESSEDBYTES], v);

	
	//addition of h2
	for(i=0;i<mlwr_N;i++){
		v[i]= h2 - (v[i]<<(mlwr_EP-mlwr_ET));
	}
	
	// vector-vector scalar multiplication with mod p
	
	InnerProd(ciphertext,sk,v);
	
	for(i=0;i<mlwr_N;i++){
		v[i]= (v[i] & modP ) >> (mlwr_EP-4);
	}
	
	// pack decrypted message
	
	POL2MSG(v, message_dec);
	
}

void MatrixVectorMul_keygen(const unsigned char *seed, uint8_t *sk, uint16_t res[mlwr_K][mlwr_N]){

	uint16_t temp_ar[mlwr_N]; 
	int32_t i,j,k;

		
		for(i=0;i<mlwr_K;i++){
			for(j=0;j<mlwr_K;j++){
				GenMatrix_poly(temp_ar, seed, i+j);
				pol_mul_64_sch(temp_ar, sk+(i*mlwr_N/2), temp_ar, modQ);		
				for(k=0;k<mlwr_N;k++){
					res[j][k]=res[j][k]+temp_ar[k];
				}
			
			}
		}
		
}
	
void MatrixVectorMul_enc(const unsigned char *seed, uint8_t *sk, uint8_t *ciphertext){

	uint16_t temp_ar[mlwr_N],res[mlwr_N]; 
	int32_t i,j,k;

		for(i=0;i<mlwr_K;i++){
			for(j=0;j<mlwr_N;j++) {
				res[j]=0; temp_ar[j]=0;
			}
			for(j=0;j<mlwr_K;j++){
				GenMatrix_poly(temp_ar, seed, i+j);
				pol_mul_64_sch(temp_ar, sk+(j*mlwr_N/2), temp_ar, modQ);			
				for(k=0;k<mlwr_N;k++){
					res[k]=res[k]+temp_ar[k];
				}
			
			}
			for(k=0;k<mlwr_N;k++) {
				res[k]=res[k]+h1;
				res[k]=(res[k]>>(mlwr_EQ-mlwr_EP));
			}
			POLp2BS(ciphertext, res, i);
		}
	}			


void InnerProd(const uint8_t *byte_array,const uint8_t *sk,uint16_t res[mlwr_N]){


	uint32_t j,k;
	uint16_t acc[mlwr_N]; 
	for(k=0;k<mlwr_N;k++){
		acc[k]=0; //clear the accumulator
	}
	// vector-vector scalar multiplication with mod p
	for(j=0;j<mlwr_K;j++){
		BS2POLp(j, byte_array, acc);
		pol_mul_64_sch(acc, sk+(j*mlwr_N/2), acc , modP);

		for(k=0;k<mlwr_N;k++){
			res[k]=res[k]+acc[k];
			acc[k]=0; //clear the accumulator
		}
	}
}

unsigned char MatrixVectorMul_encryption_cmp(const unsigned char *seed, unsigned char *sk, unsigned char *ciphertext)
{
	unsigned char fail = 0;
	uint16_t temp_ar[mlwr_N],i,j,k,res1[mlwr_N]; 

	for(i=0;i<mlwr_K;i++){
		for(k=0;k<mlwr_N;k++){
			res1[k]=0;
		}
		for(j=0;j<mlwr_K;j++){
			GenMatrix_poly(temp_ar, seed, i+j);
			pol_mul_64_sch(temp_ar, sk+(j*mlwr_N/2), temp_ar, modQ);			
			for(k=0;k<mlwr_N;k++){
				res1[k]=res1[k]+temp_ar[k];
			}
		
		}
		// Now one polynomial of the output vector is ready.
		// Rounding: perform bit manipulation before packing into ciphertext 
		for(k=0;k<mlwr_N;k++) {
			res1[k]=res1[k]+h1;
			res1[k]=(res1[k]>>(mlwr_EQ-mlwr_EP));
		}
		
		fail |= POLp2BS_cmp(ciphertext, res1, i);
	}
	return fail;
}

unsigned char indcpa_kem_enc_cmp(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{
	unsigned char fail = 0;
	unsigned char sk1[mlwr_K*mlwr_N/2];
	uint32_t i,j;
	uint16_t message_bit;
	uint16_t vprime[mlwr_N];

	GenSecret_new(sk1,noiseseed);//generate secret from constant-time binomial distribution


	fail |= MatrixVectorMul_encryption_cmp(&pk[mlwr_POLYVECCOMPRESSEDBYTES], sk1, ciphertext);

//********************client matrix-vector multiplication ends************************************
	
	for(i=0;i<mlwr_N;i++)
		vprime[i]=0;

	// vector-vector scalar multiplication with mod p
	InnerProd(pk,sk1,vprime);	
	
	// unpack message_received;
	for(j=0; j<mlwr_KEYBYTES; j++)
	{
		//8/4=2
		for(i=0; i<2; i++)
		{
			message_bit = ((message_received[j]>>4*i) & 0x0f);
			message_bit = (message_bit<<(mlwr_EP-4));
			vprime[j*2+i]=(vprime[j*2+i] - message_bit);
		}
	}
	//addition of h1 to vprime
	for(i=0;i<mlwr_N;i++)
		vprime[i]=((vprime[i]+h1) & modP )>>(mlwr_EP-mlwr_ET);

	fail |= mlwr_pack_7bit_cmp(&ciphertext[mlwr_POLYVECCOMPRESSEDBYTES], vprime);

	fail = ~fail + 1;
	fail >>= 63;

	return (unsigned char)fail;
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
