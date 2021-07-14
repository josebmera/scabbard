#include "SABER_indcpa.h"

void byte_bank2pol_part(unsigned char *bytes, uint16_t pol_part[], uint16_t pol_part_start_index, uint16_t num_8coeff)
{
	uint32_t j;
	uint32_t offset_data=0, offset_byte=0;	
	
	offset_byte=0;
	for(j=0;j<num_8coeff;j++){
		offset_byte=11*j;
		offset_data=pol_part_start_index+8*j;	
		pol_part[offset_data + 0]= bytes[ offset_byte + 0 ] |  ((bytes[ offset_byte + 1 ] & 0x07)<<8);
		pol_part[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 2 ] & 0x3f)<<5);
		pol_part[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 3 ] & 0xff)<<2) |  ((bytes[ offset_byte + 4 ] & 0x01)<<10);
		pol_part[offset_data + 3]= ( (bytes[ offset_byte + 4 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 5 ] & 0x0f)<<7);
		pol_part[offset_data + 4]= ( (bytes[ offset_byte + 5 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 6 ] & 0x7f)<<4);
		pol_part[offset_data + 5]= ( (bytes[ offset_byte + 6 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 7 ] & 0xff)<<1) |  ((bytes[ offset_byte + 8 ] & 0x03)<<9);
		pol_part[offset_data + 6]= ( (bytes[ offset_byte + 8 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 9 ] & 0x1f)<<6);
		pol_part[offset_data + 7]= ( (bytes[ offset_byte + 9 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 10 ] & 0xff)<<3);
	}
}

void GenMatrix_poly(uint16_t temp_ar[], const unsigned char *seed, uint16_t poly_number) 
{
#if Saber_type == 3
	static unsigned char shake_op_buf[SHAKE128_RATE+160];	// there can be at most 160 bytes left over from previous shake call	
#else
	static unsigned char shake_op_buf[SHAKE128_RATE+152];	// there can be at most 152 bytes left over from previous shake call
#endif

	static int i,j;

	static uint64_t s[25];
	
	static uint16_t pol_part_start_index, num_8coeff, num_8coeff_final, left_over_bytes, total_bytes;
	static uint16_t poly_complete;

	// Init state when poly_number=0;

	if(poly_number==0)
	{
		for (i = 0; i < 25; ++i)
				s[i] = 0;
	
		keccak_absorb(s, SHAKE128_RATE, seed, SABER_SEEDBYTES, 0x1F);

		pol_part_start_index=0; num_8coeff=0; left_over_bytes=0; total_bytes=0; 
	}

	poly_complete=0;

	while(poly_complete!=1)
	{
		keccak_squeezeblocks(shake_op_buf+left_over_bytes, 1, s, SHAKE128_RATE);

		total_bytes = left_over_bytes + SHAKE128_RATE;

		num_8coeff = total_bytes/11;

		if((num_8coeff*8+pol_part_start_index)>255)
			num_8coeff_final=32-pol_part_start_index/8;
		else 
			num_8coeff_final=num_8coeff;

	
		byte_bank2pol_part(shake_op_buf, temp_ar, pol_part_start_index, num_8coeff_final);

		left_over_bytes = total_bytes - num_8coeff_final*11;	


		for(j=0; j<left_over_bytes; j++)	// bring the leftover in the begining of the buffer.
			shake_op_buf[j] = shake_op_buf[num_8coeff_final*11+j];	

		pol_part_start_index = pol_part_start_index + num_8coeff_final*8;	// this will be >256 when the polynomial is complete.

		if(pol_part_start_index>255) 
		{	 
			pol_part_start_index=0;
			poly_complete++;
		}
	}

}

void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk)
{
	int32_t i,j;
	uint16_t res[SABER_K][SABER_N];

	randombytes(&pk[SABER_POLYVECCOMPRESSEDBYTES], SABER_SEEDBYTES);
	shake128(&pk[SABER_POLYVECCOMPRESSEDBYTES], SABER_SEEDBYTES, &pk[SABER_POLYVECCOMPRESSEDBYTES], SABER_SEEDBYTES); // for not revealing system RNG state
	randombytes(sk, SABER_COINBYTES);
	GenSecret_new(sk,sk);//generate secret from constant-time binomial distribution

	//------------------------do the matrix vector multiplication and rounding------------
	for(i=0;i<SABER_K;i++){
		for(j=0;j<SABER_N;j++){
			res[i][j]=0;
		}
	}

	MatrixVectorMul_keypair(&pk[SABER_POLYVECCOMPRESSEDBYTES],sk,res,SABER_Q-1);

	//-----now rounding
	for(i=0;i<SABER_K;i++){ //shift right 3 bits
		for(j=0;j<SABER_N;j++){
			res[i][j]=res[i][j] + h1;
			res[i][j]=(res[i][j]>>(SABER_EQ-SABER_EP));
		}
	}

	//------------------unload and pack pk=256 bits seed and 3 x (256 coefficients of 11 bits)-------

	POLVECp2BS(pk, res); // load the public-key coefficients

}


void indcpa_kem_enc(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{
	uint32_t i,j;
	uint8_t skpv[SABER_K*SABER_N/4];
	uint16_t message_bit;
	uint16_t vprime[SABER_N];

	
	GenSecret_new(skpv,noiseseed);
	
	// vector-vector scalar multiplication with mod p
	for(i=0;i<SABER_N;i++)
		vprime[i]=0;

	//------now calculate the v'
	VectorMul(pk, skpv, vprime);
	
	//-----------------matrix-vector multiplication and rounding

	MatrixVectorMul_encryption(&pk[SABER_POLYVECCOMPRESSEDBYTES], skpv, ciphertext, SABER_Q-1);

//*******************************************************************client matrix-vector multiplication ends************************************

	//------now calculate the v'

	for(j=0; j<SABER_KEYBYTES; j++)
	{
		for(i=0; i<8; i++)
		{
			message_bit = ((message_received[j]>>i) & 0x01);
			message_bit = (message_bit<<(SABER_EP-1));
			vprime[j*8+i]=vprime[j*8+i]- message_bit;
		}
	}

	// // message encoding

	for(i=0;i<SABER_N;i++)
	{

		vprime[i]=(vprime[i]+h1)>>(SABER_EP-SABER_ET);
	}

	#if Saber_type == 1
		SABER_pack_3bit(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], vprime);
	#elif Saber_type == 2
		SABER_pack_5bit(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], vprime);
	#elif Saber_type == 3
		SABER_pack_3bit(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], vprime);
	#endif

}


void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char message_dec[])
{

	uint32_t i,j;
	uint16_t v[SABER_N];
	
	#if Saber_type == 1
		SABER_un_pack3bit(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], v);
	#elif Saber_type == 2
		SABER_un_pack5bit(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], v);
	#elif Saber_type == 3
		SABER_un_pack3bit(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], v);
	#endif

	for (i = 0; i < SABER_N; ++i) {
		v[i] = h2 - (v[i] << (SABER_EP-SABER_ET));
	}

	VectorMul(ciphertext, sk, v);

	for (i = 0; i < SABER_N; ++i) {
		v[i] = (v[i] & (SABER_P-1)) >> (SABER_EP-1);
	}

	POL2MSG(v, message_dec);
}

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec){

	int32_t i,j;

	for(j=0; j<SABER_KEYBYTES; j++)
	{
		message_dec[j] = 0;
		for(i=0; i<8; i++)
		message_dec[j] = message_dec[j] | (message_dec_unpacked[j*8 + i] <<i);
	}

}

void expand(uint8_t* b, uint16_t* res)
{
    uint32_t i;

    for(i=0;i<(SABER_N/4);i++)
    {
        res[4*i] = ((b[i]& 0x03) ^ 0x2 ) - 0x2;
	res[4*i+1] = (((b[i]>>2) & 0x03) ^ 0x2 ) - 0x2;
	res[4*i+2] = (((b[i]>>4) & 0x03) ^ 0x2 ) - 0x2;
	res[4*i+3] = (((b[i]>>6) & 0x03) ^ 0x2 ) - 0x2;
    }
}

void MatrixVectorMul_keypair(const unsigned char *seed, uint8_t *sk, uint16_t res[SABER_K][SABER_N], uint16_t mod)
{
	int32_t i,j,k;
	uint16_t temp_ar[SABER_N],temp_ar1[SABER_N];

	for(i=0;i<SABER_K;i++){
		expand(sk+(i*SABER_N/4),temp_ar1);
		for(j=0;j<SABER_K;j++){
			GenMatrix_poly(temp_ar, seed, i+j);			
			toom_cook_4way_mem_asm(temp_ar, temp_ar1, res[j]);
		}
	}
}

void MatrixVectorMul_encryption(const unsigned char *seed, uint8_t *sk, unsigned char *ciphertext, uint16_t mod)
{
	uint16_t acc[SABER_N]; 
	int32_t i,j,k;
	uint16_t res[SABER_N],temp_ar1[SABER_N];

	for(i=0;i<SABER_K;i++) {
		for(j=0;j<SABER_N;j++) {
			res[j]=0; acc[j]=0;
		}
		for(j=0;j<SABER_K;j++) {
			GenMatrix_poly(acc, seed, i+j);
			expand(sk+(j*SABER_N/4),temp_ar1);
			toom_cook_4way_mem_asm(acc, temp_ar1, res);
		}
		
		// Now one polynomial of the output vector is ready.
		// Rounding: perform bit manipulation before packing into ciphertext 
		for(k=0;k<SABER_N;k++) {
			res[k]=res[k]+h1;
			res[k]=(res[k]>>(SABER_EQ-SABER_EP));
		}
		POLp2BS(ciphertext, res, i);
	}	
}

void VectorMul(const unsigned char *byte_array, uint8_t *sk,uint16_t res[SABER_N])
{
	uint32_t j;
	uint16_t pkcl[SABER_N],temp_ar1[SABER_N];

	// vector-vector scalar multiplication with mod p
	for(j=0;j<SABER_K;j++){
		BS2POLp(j, byte_array, pkcl);
		expand(sk+(j*SABER_N/4),temp_ar1);
		toom_cook_4way_mem_asm(pkcl, temp_ar1, res);
	}
}

unsigned char MatrixVectorMul_encryption_cmp(const unsigned char *seed, uint8_t *sk, unsigned char *ciphertext, uint16_t mod)
{
	unsigned char fail = 0;
	uint16_t acc[SABER_N],temp_ar1[SABER_N]; 
	int32_t i,j,k;
	uint16_t res[SABER_N];

	for(i=0;i<SABER_K;i++) {
		for(j=0;j<SABER_N;j++) {
			res[j]=0; acc[j]=0;
		}
		for(j=0;j<SABER_K;j++) {
			GenMatrix_poly(acc, seed, i+j);
			expand(sk+(j*SABER_N/4),temp_ar1);
			toom_cook_4way_mem_asm(acc, temp_ar1, res);
		}
		// Now one polynomial of the output vector is ready.
		// Rounding: perform bit manipulation before packing into ciphertext 
		for(k=0;k<SABER_N;k++) {
			res[k]=res[k]+h1;
			res[k]=(res[k]>>(SABER_EQ-SABER_EP));
		}
		
		fail |= POLp2BS_cmp(ciphertext, res, i);
	}
	return fail;
}

unsigned char indcpa_kem_enc_cmp(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{
	unsigned char fail = 0;

	uint32_t i,j;
	uint8_t skpv1[SABER_K*SABER_N/4];
	uint16_t message_bit;
	uint16_t vprime[SABER_N];

	GenSecret_new(skpv1,noiseseed);//generate secret from constant-time binomial distribution

	fail |= MatrixVectorMul_encryption_cmp(&pk[SABER_POLYVECCOMPRESSEDBYTES], skpv1, ciphertext, SABER_Q-1);

//********************client matrix-vector multiplication ends************************************

	for(i=0;i<SABER_N;i++)
		vprime[i]=0;

	VectorMul(pk, skpv1, vprime);

	for(j=0; j<SABER_KEYBYTES; j++) {
		for(i=0; i<8; i++) {
			message_bit = ((message_received[j]>>i) & 0x01);
			message_bit = (message_bit<<(SABER_EP-1));
			vprime[j*8+i]=vprime[j*8+i]- message_bit;
		}
	}

	for(i=0;i<SABER_N;i++) {
		vprime[i]=(vprime[i]+h1)>>(SABER_EP-SABER_ET);
	}

	#if Saber_type == 1
		fail |= SABER_pack_3bit_cmp(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], vprime);
	#elif Saber_type == 2
		fail |= SABER_pack_5bit_cmp(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], vprime);
	#elif Saber_type == 3
		fail |= SABER_pack_3bit_cmp(&ciphertext[SABER_POLYVECCOMPRESSEDBYTES], vprime);
	#endif

	fail = ~fail + 1;
	fail >>= 63;

	return (unsigned char)fail;
}












