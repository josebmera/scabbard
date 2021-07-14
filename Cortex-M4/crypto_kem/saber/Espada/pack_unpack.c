#include "pack_unpack.h"

void mlwr_pack_7bit(uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<mlwr_N/8;i++){
		offset_byte = 7*i;
		offset_data = 8*i;
		bytes[offset_byte + 0] = ( data[ offset_data + 0 ] & (0x7f)) | ((data[ offset_data + 1 ] & 0x01) << 7);
		bytes[offset_byte + 1] = ( (data[ offset_data + 1 ] >>1) & 0x3f ) | ((data[ offset_data + 2 ] & 0x03) << 6);
		bytes[offset_byte + 2] = ( (data[ offset_data + 2 ] >>2) & 0x1f ) | ((data[ offset_data + 3 ] & 0x07) << 5);
		bytes[offset_byte + 3] = ( (data[ offset_data + 3 ] >>3) & 0x0f ) | ((data[ offset_data + 4 ] & 0x0f) << 4);
		bytes[offset_byte + 4] = ( (data[ offset_data + 4 ] >>4) & 0x07 ) | ((data[ offset_data + 5 ] & 0x1f) << 3);
		bytes[offset_byte + 5] = ( (data[ offset_data + 5 ] >>5) & 0x03 ) | ((data[ offset_data + 6 ] & 0x3f) << 2);
		bytes[offset_byte + 6] = ( (data[ offset_data + 6 ] >>6) & 0x01 ) | ((data[ offset_data + 7 ] & 0x7f) << 1);
	}
}

void mlwr_un_pack7bit(uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<mlwr_N/8;i++){
		offset_byte = 7*i;
		offset_data = 8*i;
		data[offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0x7f));
		data[offset_data + 1]= ( (bytes[ offset_byte + 0 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 1 ] & 0x3f)<<1);		
		data[offset_data + 2]= ( (bytes[ offset_byte + 1 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 2 ] & 0x1f)<<2);
		data[offset_data + 3]= ( (bytes[ offset_byte + 2 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 3 ] & 0x0f)<<3);
		data[offset_data + 4]= ( (bytes[ offset_byte + 3 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 4 ] & 0x07)<<4);
		data[offset_data + 5]= ( (bytes[ offset_byte + 4 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 5 ] & 0x03)<<5);		
		data[offset_data + 6]= ( (bytes[ offset_byte + 5 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 6 ] & 0x01)<<6);
		data[offset_data + 7]= ( (bytes[ offset_byte + 6 ]>>1) & (0x7f));				
	}
}

void POLVECp2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N])
{
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<mlwr_K;i++){
		offset_byte1=i*(mlwr_N*13)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+13*j;
			offset_data=8*j;
			bytes[offset_byte + 0]= ( data[i][ offset_data + 0 ] & (0xff));

			bytes[offset_byte + 1]= ( (data[i][ offset_data + 0 ] >>8) & 0x1f ) | ((data[i][ offset_data + 1 ] & 0x07) << 5);

			bytes[offset_byte + 2]= ( (data[i][ offset_data + 1 ] >>3) & 0xff );

			bytes[offset_byte + 3]= ( (data[i][ offset_data + 1 ] >>11) & 0x03 ) | ((data[i][ offset_data + 2 ] & 0x3f) << 2);

			bytes[offset_byte + 4]= ( (data[i][ offset_data + 2 ] >>6) & 0x7f ) | ( (data[i][ offset_data + 3 ] & 0x01) << 7 );

			bytes[offset_byte + 5]= ( (data[i][ offset_data + 3 ] >>1) & 0xff );

			bytes[offset_byte + 6]= ( (data[i][ offset_data + 3 ] >>9) & 0x0f ) | ( (data[i][ offset_data + 4 ] & 0x0f) << 4 );

			bytes[offset_byte + 7]= ( (data[i][ offset_data + 4] >>4) & 0xff );

			bytes[offset_byte + 8]= ( (data[i][ offset_data + 4 ] >>12) & 0x01 ) | ( (data[i][ offset_data + 5 ] & 0x7f) << 1 );

			bytes[offset_byte + 9]= ( (data[i][ offset_data + 5 ] >>7) & 0x3f ) | ( (data[i][ offset_data + 6 ] & 0x03) << 6 );

			bytes[offset_byte + 10]= ( (data[i][ offset_data + 6 ] >>2) & 0xff );

			bytes[offset_byte + 11]= ( (data[i][ offset_data + 6 ] >>10) & 0x07 ) | ( (data[i][ offset_data + 7 ] & 0x1f) << 3 );

			bytes[offset_byte + 12]= ( (data[i][ offset_data + 7 ] >>5) & 0xff );

		}
	}
}








void POLp2BS(uint8_t *bytes, uint16_t data[mlwr_N], uint16_t pol_vec_index)
{
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	
		offset_byte1=pol_vec_index*(mlwr_N*13)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+13*j;
			offset_data=8*j;
			bytes[offset_byte + 0]= ( data[ offset_data + 0 ] & (0xff));

			bytes[offset_byte + 1]= ( (data[ offset_data + 0 ] >>8) & 0x1f ) | ((data[ offset_data + 1 ] & 0x07) << 5);

			bytes[offset_byte + 2]= ( (data[ offset_data + 1 ] >>3) & 0xff );

			bytes[offset_byte + 3]= ( (data[ offset_data + 1 ] >>11) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2);

			bytes[offset_byte + 4]= ( (data[ offset_data + 2 ] >>6) & 0x7f ) | ( (data[ offset_data + 3 ] & 0x01) << 7 );

			bytes[offset_byte + 5]= ( (data[ offset_data + 3 ] >>1) & 0xff );

			bytes[offset_byte + 6]= ( (data[ offset_data + 3 ] >>9) & 0x0f ) | ( (data[ offset_data + 4 ] & 0x0f) << 4 );

			bytes[offset_byte + 7]= ( (data[ offset_data + 4] >>4) & 0xff );

			bytes[offset_byte + 8]= ( (data[ offset_data + 4 ] >>12) & 0x01 ) | ( (data[ offset_data + 5 ] & 0x7f) << 1 );

			bytes[offset_byte + 9]= ( (data[ offset_data + 5 ] >>7) & 0x3f ) | ( (data[ offset_data + 6 ] & 0x03) << 6 );

			bytes[offset_byte + 10]= ( (data[ offset_data + 6 ] >>2) & 0xff );

			bytes[offset_byte + 11]= ( (data[ offset_data + 6 ] >>10) & 0x07 ) | ( (data[ offset_data + 7 ] & 0x1f) << 3 );

			bytes[offset_byte + 12]= ( (data[ offset_data + 7 ] >>5) & 0xff );

		}
	
}






void BS2POLp(uint16_t pol_index, const unsigned char *bytes, uint16_t data[mlwr_N])
{
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
		offset_byte1=pol_index*(mlwr_N*13)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+13*j;
			offset_data=8*j;
			data[offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) | ((bytes[offset_byte + 1] & 0x1f)<<8);
			data[offset_data + 1]= ( bytes[ offset_byte + 1 ]>>5 & (0x07)) | ((bytes[offset_byte + 2] & 0xff)<<3) | ((bytes[offset_byte + 3] & 0x03)<<11);
			data[offset_data + 2]= ( bytes[ offset_byte + 3 ]>>2 & (0x3f)) | ((bytes[offset_byte + 4] & 0x7f)<<6);
			data[offset_data + 3]= ( bytes[ offset_byte + 4 ]>>7 & (0x01)) | ((bytes[offset_byte + 5] & 0xff)<<1) | ((bytes[offset_byte + 6] & 0x0f)<<9);
			data[offset_data + 4]= ( bytes[ offset_byte + 6 ]>>4 & (0x0f)) | ((bytes[offset_byte + 7] & 0xff)<<4) | ((bytes[offset_byte + 8] & 0x01)<<12);
			data[offset_data + 5]= ( bytes[ offset_byte + 8]>>1 & (0x7f)) | ((bytes[offset_byte + 9] & 0x3f)<<7);
			data[offset_data + 6]= ( bytes[ offset_byte + 9]>>6 & (0x03)) | ((bytes[offset_byte + 10] & 0xff)<<2) | ((bytes[offset_byte + 11] & 0x07)<<10);
			data[offset_data + 7]= ( bytes[ offset_byte + 11]>>3 & (0x1f)) | ((bytes[offset_byte + 12] & 0xff)<<5);
		}
	
}









void BS2POLVECp(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N])
{
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<mlwr_K;i++){
		offset_byte1=i*(mlwr_N*13)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+13*j;
			offset_data=8*j;
			data[i][offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) | ((bytes[offset_byte + 1] & 0x1f)<<8);
			data[i][offset_data + 1]= ( bytes[ offset_byte + 1 ]>>5 & (0x07)) | ((bytes[offset_byte + 2] & 0xff)<<3) | ((bytes[offset_byte + 3] & 0x03)<<11);
			data[i][offset_data + 2]= ( bytes[ offset_byte + 3 ]>>2 & (0x3f)) | ((bytes[offset_byte + 4] & 0x7f)<<6);
			data[i][offset_data + 3]= ( bytes[ offset_byte + 4 ]>>7 & (0x01)) | ((bytes[offset_byte + 5] & 0xff)<<1) | ((bytes[offset_byte + 6] & 0x0f)<<9);
			data[i][offset_data + 4]= ( bytes[ offset_byte + 6 ]>>4 & (0x0f)) | ((bytes[offset_byte + 7] & 0xff)<<4) | ((bytes[offset_byte + 8] & 0x01)<<12);
			data[i][offset_data + 5]= ( bytes[ offset_byte + 8]>>1 & (0x7f)) | ((bytes[offset_byte + 9] & 0x3f)<<7);
			data[i][offset_data + 6]= ( bytes[ offset_byte + 9]>>6 & (0x03)) | ((bytes[offset_byte + 10] & 0xff)<<2) | ((bytes[offset_byte + 11] & 0x07)<<10);
			data[i][offset_data + 7]= ( bytes[ offset_byte + 11]>>3 & (0x1f)) | ((bytes[offset_byte + 12] & 0xff)<<5);
		}
	}
}



void POLVECq2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N]){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<mlwr_K;i++){
		offset_byte1=i*(mlwr_N*15)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+15*j;
			offset_data=8*j;
			
			bytes[offset_byte + 0]= ( data[i][ offset_data + 0 ] & (0xff));
			bytes[offset_byte + 1]= ( (data[i][ offset_data + 0 ] >>8) & 0x7f ) | ((data[i][ offset_data + 1 ] & 0x01) << 7);
			bytes[offset_byte + 2]= ( (data[i][ offset_data + 1 ] >>1) & 0xff );
			bytes[offset_byte + 3]= ( (data[i][ offset_data + 1 ] >>9) & 0x3f ) | ((data[i][ offset_data + 2 ] & 0x03) << 6);
			bytes[offset_byte + 4]= ( (data[i][ offset_data + 2 ] >>2) & 0xff );
			bytes[offset_byte + 5]= ( (data[i][ offset_data + 2 ] >>10) & 0x1f ) | ((data[i][ offset_data + 3 ] & 0x07) << 5);
			bytes[offset_byte + 6]= ( (data[i][ offset_data + 3 ] >>3) & 0xff );
			bytes[offset_byte + 7]= ( (data[i][ offset_data + 3] >>11) & 0x0f ) | ( (data[i][ offset_data + 4 ] & 0x0f) << 4 );
			bytes[offset_byte + 8]= ( (data[i][ offset_data + 4 ] >>4) & 0xff );
			bytes[offset_byte + 9]= ( (data[i][ offset_data + 4 ] >>12) & 0x07 ) | ( (data[i][ offset_data + 5 ] & 0x1f) << 3 );
			bytes[offset_byte + 10]= ( (data[i][ offset_data + 5 ] >>5) & 0xff );
			bytes[offset_byte + 11]= ( (data[i][ offset_data + 5 ] >>13) & 0x03 ) | ( (data[i][ offset_data + 6 ] & 0x3f) << 2 );
			bytes[offset_byte + 12]= ( (data[i][ offset_data + 6 ] >>6) & 0xff );
			bytes[offset_byte + 13]= ( (data[i][ offset_data + 6 ] >>14) & 0x01 ) | ( (data[i][ offset_data + 7 ] & 0x7f) << 1 );
			bytes[offset_byte + 14]= ( (data[i][ offset_data + 7 ] >>7) & 0xff );

		}
	}


}

void BS2POLVECq(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N]){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<mlwr_K;i++){
		offset_byte1=i*(mlwr_N*15)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+15*j;
			offset_data=8*j;
			data[i][offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) | ((bytes[offset_byte + 1] & 0x7f)<<8);
			data[i][offset_data + 1]= ( bytes[ offset_byte + 1 ]>>7 & (0x01)) | ((bytes[offset_byte + 2] & 0xff)<<1) | ((bytes[offset_byte + 3] & 0x3f)<<9);
			data[i][offset_data + 2]= ( bytes[ offset_byte + 3 ]>>6 & (0x03)) | ((bytes[offset_byte + 4] & 0xff)<<2) | ((bytes[offset_byte + 5] & 0x1f)<<10);;
			data[i][offset_data + 3]= ( bytes[ offset_byte + 5 ]>>5 & (0x07)) | ((bytes[offset_byte + 6] & 0xff)<<3) | ((bytes[offset_byte + 7] & 0x0f)<<11);
			data[i][offset_data + 4]= ( bytes[ offset_byte + 7 ]>>4 & (0x0f)) | ((bytes[offset_byte + 8] & 0xff)<<4) | ((bytes[offset_byte + 9] & 0x07)<<12);
			data[i][offset_data + 5]= ( bytes[ offset_byte + 9 ]>>3 & (0x1f)) | ((bytes[offset_byte + 10] & 0xff)<<5) | ((bytes[offset_byte + 11] & 0x03)<<13);
			data[i][offset_data + 6]= ( bytes[ offset_byte + 11]>>2 & (0x3f)) | ((bytes[offset_byte + 12] & 0xff)<<6) | ((bytes[offset_byte + 13] & 0x01)<<14);
			data[i][offset_data + 7]= ( bytes[ offset_byte + 13]>>1 & (0x7f)) | ((bytes[offset_byte + 14] & 0xff)<<7);
			
		}
	}


}

void BS2POL(const unsigned char *bytes, uint16_t data[mlwr_N]){ //only BS2POLq no BS2POLp
	
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;	
	
	offset_byte=0;

		for(j=0;j<mlwr_N/8;j++){
			offset_byte=15*j;
			offset_data=8*j;
			data[offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) | ((bytes[offset_byte + 1] & 0x7f)<<8);
			data[offset_data + 1]= ( bytes[ offset_byte + 1 ]>>7 & (0x01)) | ((bytes[offset_byte + 2] & 0xff)<<1) | ((bytes[offset_byte + 3] & 0x3f)<<9);
			data[offset_data + 2]= ( bytes[ offset_byte + 3 ]>>6 & (0x03)) | ((bytes[offset_byte + 4] & 0xff)<<2) | ((bytes[offset_byte + 5] & 0x1f)<<10);;
			data[offset_data + 3]= ( bytes[ offset_byte + 5 ]>>5 & (0x07)) | ((bytes[offset_byte + 6] & 0xff)<<3) | ((bytes[offset_byte + 7] & 0x0f)<<11);
			data[offset_data + 4]= ( bytes[ offset_byte + 7 ]>>4 & (0x0f)) | ((bytes[offset_byte + 8] & 0xff)<<4) | ((bytes[offset_byte + 9] & 0x07)<<12);
			data[offset_data + 5]= ( bytes[ offset_byte + 9 ]>>3 & (0x1f)) | ((bytes[offset_byte + 10] & 0xff)<<5) | ((bytes[offset_byte + 11] & 0x03)<<13);
			data[offset_data + 6]= ( bytes[ offset_byte + 11]>>2 & (0x3f)) | ((bytes[offset_byte + 12] & 0xff)<<6) | ((bytes[offset_byte + 13] & 0x01)<<14);
			data[offset_data + 7]= ( bytes[ offset_byte + 13]>>1 & (0x7f)) | ((bytes[offset_byte + 14] & 0xff)<<7);
			
		}

}


void POLVEC2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N], uint16_t modulus){

	if(modulus==8191)
		POLVECp2BS(bytes, data);
	else if(modulus==32767)
		POLVECq2BS(bytes, data);
}

void BS2POLVEC(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N], uint16_t modulus){

	if(modulus==8191)
		BS2POLVECp(bytes, data);
	else if(modulus==32767)
		BS2POLVECq(bytes, data);
}

/*unsigned char POLp2BS_cmp(uint8_t *bytes, uint16_t data[mlwr_N], uint16_t pol_vec_index)
{
	unsigned char fail = 0;
	
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;

		offset_byte1=pol_vec_index*(mlwr_N*13)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+13*j;
			offset_data=8*j;
			fail |= bytes[offset_byte + 0] ^ ( data[ offset_data + 0 ] & (0xff));

			fail |= bytes[offset_byte + 1] ^ (( (data[ offset_data + 0 ] >>8) & 0x1f ) | ((data[ offset_data + 1 ] & 0x07) << 5));

			fail |= bytes[offset_byte + 2] ^ ( (data[ offset_data + 1 ] >>3) & 0xff );

			fail |= bytes[offset_byte + 3] ^ (( (data[ offset_data + 1 ] >>11) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2));

			fail |= bytes[offset_byte + 4] ^ (( (data[ offset_data + 2 ] >>6) & 0x7f ) | ( (data[ offset_data + 3 ] & 0x01) << 7 ));

			fail |= bytes[offset_byte + 5] ^ ( (data[ offset_data + 3 ] >>1) & 0xff );

			fail |= bytes[offset_byte + 6]= (( (data[ offset_data + 3 ] >>9) & 0x0f ) | ( (data[ offset_data + 4 ] & 0x0f) << 4 ));

			fail |= bytes[offset_byte + 7] ^ ( (data[ offset_data + 4] >>4) & 0xff );

			fail |= bytes[offset_byte + 8] ^ ( ((data[ offset_data + 4 ] >>12) & 0x01 ) | ( (data[ offset_data + 5 ] & 0x7f) << 1 ));

			fail |= bytes[offset_byte + 9] ^ (( (data[ offset_data + 5 ] >>7) & 0x3f ) | ( (data[ offset_data + 6 ] & 0x03) << 6 ));

			fail |= bytes[offset_byte + 10] ^ ( (data[ offset_data + 6 ] >>2) & 0xff );

			fail |= bytes[offset_byte + 11] ^ (( (data[ offset_data + 6 ] >>10) & 0x07 ) | ( (data[ offset_data + 7 ] & 0x1f) << 3 ));

			fail |= bytes[offset_byte + 12] ^ ( (data[ offset_data + 7 ] >>5) & 0xff );
			
			}

	return fail;
}*/

unsigned char POLp2BS_cmp(uint8_t *bytes, uint16_t data[mlwr_N], uint16_t pol_vec_index)
{
	unsigned char fail = 0;
	
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;

		offset_byte1=pol_vec_index*(mlwr_N*13)/8;
		for(j=0;j<mlwr_N/8;j++){
			offset_byte=offset_byte1+13*j;
			offset_data=8*j;
			fail |= bytes[offset_byte + 0] ^ ( data[ offset_data + 0 ] & (0xff));

			fail |= bytes[offset_byte + 1] ^ (( (data[ offset_data + 0 ] >>8) & 0x1f ) | ((data[ offset_data + 1 ] & 0x07) << 5));

			fail |= bytes[offset_byte + 2] ^ ( (data[ offset_data + 1 ] >>3) & 0xff );

			fail |= bytes[offset_byte + 3] ^ (( (data[ offset_data + 1 ] >>11) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2));

			fail |= bytes[offset_byte + 4] ^ (( (data[ offset_data + 2 ] >>6) & 0x7f ) | ( (data[ offset_data + 3 ] & 0x01) << 7 ));

			fail |= bytes[offset_byte + 5] ^ ( (data[ offset_data + 3 ] >>1) & 0xff );

			fail |= bytes[offset_byte + 6]= (( (data[ offset_data + 3 ] >>9) & 0x0f ) | ( (data[ offset_data + 4 ] & 0x0f) << 4 ));

			fail |= bytes[offset_byte + 7] ^ ( (data[ offset_data + 4] >>4) & 0xff );

			fail |= bytes[offset_byte + 8] ^ ( ((data[ offset_data + 4 ] >>12) & 0x01 ) | ( (data[ offset_data + 5 ] & 0x7f) << 1 ));

			fail |= bytes[offset_byte + 9] ^ (( (data[ offset_data + 5 ] >>7) & 0x3f ) | ( (data[ offset_data + 6 ] & 0x03) << 6 ));

			fail |= bytes[offset_byte + 10] ^ ( (data[ offset_data + 6 ] >>2) & 0xff );

			fail |= bytes[offset_byte + 11] ^ (( (data[ offset_data + 6 ] >>10) & 0x07 ) | ( (data[ offset_data + 7 ] & 0x1f) << 3 ));

			fail |= bytes[offset_byte + 12] ^ ( (data[ offset_data + 7 ] >>5) & 0xff );
			
			}

	return fail;
}

unsigned char mlwr_pack_7bit_cmp(uint8_t *bytes, uint16_t *data)
{
	unsigned char fail = 0;

	uint32_t i;
	uint32_t offset_data=0,offset_byte=0;
	
	offset_byte=0;
	for(i=0;i<mlwr_N/8;i++){
		offset_byte = 7*i;
		offset_data = 8*i;
		fail |= bytes[offset_byte + 0] ^ (( data[ offset_data + 0 ] & (0x7f)) | ((data[ offset_data + 1 ] & 0x01) << 7));
		fail |= bytes[offset_byte + 1] ^ (( (data[ offset_data + 1 ] >>1) & 0x3f ) | ((data[ offset_data + 2 ] & 0x03) << 6));
		fail |= bytes[offset_byte + 2] ^ (( (data[ offset_data + 2 ] >>2) & 0x1f ) | ((data[ offset_data + 3 ] & 0x07) << 5));
		fail |= bytes[offset_byte + 3] ^ (( (data[ offset_data + 3 ] >>3) & 0x0f ) | ((data[ offset_data + 4 ] & 0x0f) << 4));
		fail |= bytes[offset_byte + 4] ^ (( (data[ offset_data + 4 ] >>4) & 0x07 ) | ((data[ offset_data + 5 ] & 0x1f) << 3));
		fail |= bytes[offset_byte + 5] ^ (( (data[ offset_data + 5 ] >>5) & 0x03 ) | ((data[ offset_data + 6 ] & 0x3f) << 2));
		fail |= bytes[offset_byte + 6] ^ (( (data[ offset_data + 6 ] >>6) & 0x01 ) | ((data[ offset_data + 7 ] & 0x7f) << 1));
		
	}
	return fail;
}
void POLSEC2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N])
{
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<mlwr_K;i++){
		offset_byte1=i*(mlwr_N*4)/8;
		for(j=0;j<mlwr_N/2;j++){
			offset_byte=offset_byte1+j;
			offset_data=2*j;

			bytes[offset_byte] = (data[i][offset_data] & 0x0f) | ((data[i][offset_data+1] & 0x0f)<<4);
		}
	}
}

void BS2POLSEC(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N])
{
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<mlwr_K;i++){
		offset_byte1=i*(mlwr_N*4)/8;
		for(j=0;j<mlwr_N/2;j++){
			offset_byte=offset_byte1+j;
			offset_data=2*j;

			data[i][offset_data]   = ( (bytes[offset_byte] & 0x0f) ^ 0x8 ) - 0x8;
			data[i][offset_data+1] = ( ((bytes[offset_byte] & 0xf0)>>4) ^ 0x8 ) - 0x8;

		}
	}
}

