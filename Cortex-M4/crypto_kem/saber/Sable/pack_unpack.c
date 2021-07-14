#include "pack_unpack.h"

void SABER_pack_3bit(uint8_t *bytes, uint16_t *data){

	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;
	
	offset_byte=0;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=3*j;
		offset_data=8*j;
		bytes[offset_byte + 0]= (data[offset_data + 0] & 0x7) | ( (data[offset_data + 1] & 0x7)<<3 ) | ((data[offset_data + 2] & 0x3)<<6);
		bytes[offset_byte + 1]= ((data[offset_data + 2] >> 2 ) & 0x01)  | ( (data[offset_data + 3] & 0x7)<<1 ) | ( (data[offset_data + 4] & 0x7)<<4 ) | (((data[offset_data + 5]) & 0x01)<<7);
		bytes[offset_byte + 2]= ((data[offset_data + 5] >> 1 ) & 0x03) | ( (data[offset_data + 6] & 0x7)<<2 ) | ( (data[offset_data + 7] & 0x7)<<5 );
	}
}

void SABER_un_pack3bit(uint8_t *bytes, uint16_t *data){

	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;	
	
	offset_byte=0;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=3*j;
		offset_data=8*j;
		data[offset_data + 0] = (bytes[offset_byte+0])&0x07;
		data[offset_data + 1] = ( (bytes[offset_byte+0])>>3 )&0x07;
		data[offset_data + 2] = ( ( (bytes[offset_byte+0])>>6 )&0x03) | ( ( (bytes[offset_byte+1])&0x01)<<2 );
		data[offset_data + 3] = ( (bytes[offset_byte+1])>>1 )&0x07;
		data[offset_data + 4] = ( (bytes[offset_byte+1])>>4 )&0x07;
		data[offset_data + 5] = ( ( (bytes[offset_byte+1])>>7 )&0x01) | ( ( (bytes[offset_byte+2])&0x03)<<1 );
		data[offset_data + 6] = ( (bytes[offset_byte+2]>>2)&0x07 );
		data[offset_data + 7] = ( (bytes[offset_byte+2]>>5)&0x07 );
	}

}

void SABER_pack_5bit(uint8_t *bytes, uint16_t *data){

	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;
	
	offset_byte=0;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=5*j;
		offset_data=8*j;
		bytes[offset_byte + 0]= (data[offset_data + 0] & 0x1f) | ( (data[offset_data + 1] & 0x07)<<5 );
		bytes[offset_byte + 1]= ((data[offset_data + 1] >> 3 ) & 0x03)  | ( (data[offset_data + 2] & 0x1f)<<2 ) | ( (data[offset_data + 3] & 0x01)<<7 );
		bytes[offset_byte + 2]= ((data[offset_data + 3] >> 1 ) & 0x0f)  | ( (data[offset_data + 4] & 0x0f)<<4 );
		bytes[offset_byte + 3]= ((data[offset_data + 4] >> 4 ) & 0x01)  | ( (data[offset_data + 5] & 0x1f)<<1 ) | ( (data[offset_data + 6] & 0x03)<<6 );
		bytes[offset_byte + 4]= ((data[offset_data + 6] >> 2 ) & 0x07)  | ( (data[offset_data + 7] & 0x1f)<<3 );
	}
}

void SABER_un_pack5bit(uint8_t *bytes, uint16_t *data){

	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;	
	
	offset_byte=0;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=5*j;
		offset_data=8*j;
		data[offset_data + 0] = (bytes[offset_byte+0])&0x1f;
		data[offset_data + 1] = ( ( (bytes[offset_byte+0])>>5 )&0x07) | ( ( (bytes[offset_byte+1])&0x03)<<3 );
		data[offset_data + 2] = ( ( (bytes[offset_byte+1])>>2 )&0x1f);
		data[offset_data + 3] = ( ( (bytes[offset_byte+1])>>7 )&0x01) | ( ( (bytes[offset_byte+2])&0x0f)<<1 );
		data[offset_data + 4] = ( ( (bytes[offset_byte+2])>>4 )&0x0f) | ( ( (bytes[offset_byte+3])&0x01)<<4 );
		data[offset_data + 5] = ( ( (bytes[offset_byte+3])>>1 )&0x1f);
		data[offset_data + 6] = ( ( (bytes[offset_byte+3])>>6 )&0x03) | ( ( (bytes[offset_byte+4])&0x07)<<2 );
		data[offset_data + 7] = ( (bytes[offset_byte+4]>>3)&0x1f );
	}	
}

void POLVECp2BS(uint8_t *bytes, uint16_t data[SABER_K][SABER_N]){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	#if Saber_type == 3
  	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*10)/8;
		for(j=0;j<SABER_N/4;j++){
			offset_byte=offset_byte1+5*j;
			offset_data=4*j;
			
			bytes[offset_byte + 0]= ( data[i][ offset_data + 0 ] & (0xff));
			bytes[offset_byte + 1]= ( (data[i][ offset_data + 0 ] >>8) & 0x03 ) | ((data[i][ offset_data + 1 ] & 0x3f) << 2);
			bytes[offset_byte + 2]= ( (data[i][ offset_data + 1 ] >>6) & 0x0f ) | ( (data[i][ offset_data + 2 ] &0x0f) << 4);
			bytes[offset_byte + 3]= ( (data[i][ offset_data + 2 ] >>4) & 0x3f ) | ((data[i][ offset_data + 3 ] & 0x03) << 6);
			bytes[offset_byte + 4]= ( (data[i][ offset_data + 3 ] >>2) & 0xff );
		}
	}

	#elif Saber_type == 2
  	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*9)/8;
		for(j=0;j<SABER_N/8;j++){
			offset_byte=offset_byte1+9*j;
			offset_data=8*j;
			
			bytes[offset_byte + 0] = ( data[i][ offset_data + 0 ] & (0xff));
			bytes[offset_byte + 1] = ( (data[i][ offset_data + 0 ] >>8) & 0x01 ) | ((data[i][ offset_data + 1 ] & 0x7f) << 1);
			bytes[offset_byte + 2] = ( (data[i][ offset_data + 1 ] >>7) & 0x03 ) | ((data[i][ offset_data + 2 ] & 0x3f) << 2);
			bytes[offset_byte + 3] = ( (data[i][ offset_data + 2 ] >>6) & 0x07 ) | ((data[i][ offset_data + 3 ] & 0x1f) << 3);
			bytes[offset_byte + 4] = ( (data[i][ offset_data + 3 ] >>5) & 0x0f ) | ((data[i][ offset_data + 4 ] & 0x0f) << 4);
			bytes[offset_byte + 5] = ( (data[i][ offset_data + 4 ] >>4) & 0x1f ) | ((data[i][ offset_data + 5 ] & 0x07) << 5);
			bytes[offset_byte + 6] = ( (data[i][ offset_data + 5 ] >>3) & 0x3f ) | ((data[i][ offset_data + 6 ] & 0x03) << 6);
			bytes[offset_byte + 7] = ( (data[i][ offset_data + 6 ] >>2) & 0x7f ) | ((data[i][ offset_data + 7 ] & 0x01) << 7);
			bytes[offset_byte + 8] = ( (data[i][ offset_data + 7 ] >>1) & 0xff );
			
		}
	}
	#elif Saber_type == 1
  	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*9)/8;
		for(j=0;j<SABER_N/8;j++){
			offset_byte=offset_byte1+9*j;
			offset_data=8*j;
			
			bytes[offset_byte + 0] = ( data[i][ offset_data + 0 ] & (0xff));
			bytes[offset_byte + 1] = ( (data[i][ offset_data + 0 ] >>8) & 0x01 ) | ((data[i][ offset_data + 1 ] & 0x7f) << 1);
			bytes[offset_byte + 2] = ( (data[i][ offset_data + 1 ] >>7) & 0x03 ) | ((data[i][ offset_data + 2 ] & 0x3f) << 2);
			bytes[offset_byte + 3] = ( (data[i][ offset_data + 2 ] >>6) & 0x07 ) | ((data[i][ offset_data + 3 ] & 0x1f) << 3);
			bytes[offset_byte + 4] = ( (data[i][ offset_data + 3 ] >>5) & 0x0f ) | ((data[i][ offset_data + 4 ] & 0x0f) << 4);
			bytes[offset_byte + 5] = ( (data[i][ offset_data + 4 ] >>4) & 0x1f ) | ((data[i][ offset_data + 5 ] & 0x07) << 5);
			bytes[offset_byte + 6] = ( (data[i][ offset_data + 5 ] >>3) & 0x3f ) | ((data[i][ offset_data + 6 ] & 0x03) << 6);
			bytes[offset_byte + 7] = ( (data[i][ offset_data + 6 ] >>2) & 0x7f ) | ((data[i][ offset_data + 7 ] & 0x01) << 7);
			bytes[offset_byte + 8] = ( (data[i][ offset_data + 7 ] >>1) & 0xff );
			
		}
	}
#else
#error "Unsupported SABER parameter."
#endif

}

void BS2POLVECp(const unsigned char *bytes, uint16_t data[SABER_K][SABER_N]){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	#if Saber_type == 3
  	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*10)/8;
		for(j=0;j<SABER_N/4;j++){
			offset_byte=offset_byte1+5*j;
			offset_data=4*j;
			data[i][offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x03)<<8);
			data[i][offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 2 ] & 0x0f)<<6);		
			data[i][offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 3 ] & 0x3f)<<4);
			data[i][offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 4 ] & 0xff)<<2);		

		}
	}


	#elif Saber_type == 2
  	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*9)/8;
		for(j=0;j<SABER_N/8;j++){
			offset_byte=offset_byte1+9*j;
			offset_data=8*j;
			
			data[i][offset_data + 0]= (bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x01)<<8);
			data[i][offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 2 ] & 0x03)<<7);	
			data[i][offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 3 ] & 0x07)<<6);
			data[i][offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 4 ] & 0x0f)<<5);
			data[i][offset_data + 4]= ( (bytes[ offset_byte + 4 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 5 ] & 0x1f)<<4);
			data[i][offset_data + 5]= ( (bytes[ offset_byte + 5 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 6 ] & 0x3f)<<3);
			data[i][offset_data + 6]= ( (bytes[ offset_byte + 6 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 7 ] & 0x7f)<<2);
			data[i][offset_data + 7]= ( (bytes[ offset_byte + 7 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 8 ] & 0xff)<<1);	
		}
	}
	#elif Saber_type == 1
  	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*9)/8;
		for(j=0;j<SABER_N/8;j++){
			offset_byte=offset_byte1+9*j;
			offset_data=8*j;
			
			data[i][offset_data + 0]= (bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x01)<<8);
			data[i][offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 2 ] & 0x03)<<7);	
			data[i][offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 3 ] & 0x07)<<6);
			data[i][offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 4 ] & 0x0f)<<5);
			data[i][offset_data + 4]= ( (bytes[ offset_byte + 4 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 5 ] & 0x1f)<<4);
			data[i][offset_data + 5]= ( (bytes[ offset_byte + 5 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 6 ] & 0x3f)<<3);
			data[i][offset_data + 6]= ( (bytes[ offset_byte + 6 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 7 ] & 0x7f)<<2);
			data[i][offset_data + 7]= ( (bytes[ offset_byte + 7 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 8 ] & 0xff)<<1);
		}
	}
#else
#error "Unsupported SABER parameter."
#endif
}



void POLVECq2BS(uint8_t *bytes, uint16_t data[SABER_K][SABER_N]){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*11)/8;
		for(j=0;j<SABER_N/8;j++){
			offset_byte=offset_byte1+11*j;
			offset_data=8*j;
			
			bytes[offset_byte + 0] = ( data[i][ offset_data + 0 ] & (0xff));
			bytes[offset_byte + 1] = ( (data[i][ offset_data + 0 ] >>8) & 0x07 ) | ((data[i][ offset_data + 1 ] & 0x1f) << 3);
			bytes[offset_byte + 2] = ( (data[i][ offset_data + 1 ] >>5) & 0x3f ) | ((data[i][ offset_data + 2 ] & 0x03) << 6);
			bytes[offset_byte + 3] = ( (data[i][ offset_data + 2 ] >>2) & 0xff );
			bytes[offset_byte + 4] = ( (data[i][ offset_data + 2 ] >>10) & 0x01 ) | ((data[i][ offset_data + 3 ] & 0x7f) << 1);
			bytes[offset_byte + 5] = ( (data[i][ offset_data + 3 ] >>7) & 0x0f ) | ((data[i][ offset_data + 4 ] & 0x0f) << 4);
			bytes[offset_byte + 6] = ( (data[i][ offset_data + 4 ] >>4) & 0x7f ) | ((data[i][ offset_data + 5 ] & 0x01) << 7);
			bytes[offset_byte + 7] = ( (data[i][ offset_data + 5 ] >>1) & 0xff );
			bytes[offset_byte + 8] = ( (data[i][ offset_data + 5 ] >>9) & 0x03 ) | ((data[i][ offset_data + 6 ] & 0x3f) << 2);
			bytes[offset_byte + 9] = ( (data[i][ offset_data + 6 ] >>6) & 0x1f ) | ((data[i][ offset_data + 7 ] & 0x07) << 5);
			bytes[offset_byte + 10] = ( (data[i][ offset_data + 7 ] >>3) & 0xff );
		}
	}


}

void BS2POLVECq(const unsigned char *bytes, uint16_t data[SABER_K][SABER_N]){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*11)/8;
		for(j=0;j<SABER_N/8;j++){
			offset_byte=offset_byte1+11*j;
			offset_data=8*j;
			
			data[i][offset_data + 0]= bytes[ offset_byte + 0 ] |  ((bytes[ offset_byte + 1 ] & 0x07)<<8);
			data[i][offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 2 ] & 0x3f)<<5);
			data[i][offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 3 ] & 0xff)<<2) |  ((bytes[ offset_byte + 4 ] & 0x01)<<10);
			data[i][offset_data + 3]= ( (bytes[ offset_byte + 4 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 5 ] & 0x0f)<<7);
			data[i][offset_data + 4]= ( (bytes[ offset_byte + 5 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 6 ] & 0x7f)<<4);
			data[i][offset_data + 5]= ( (bytes[ offset_byte + 6 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 7 ] & 0xff)<<1) |  ((bytes[ offset_byte + 8 ] & 0x03)<<9);
			data[i][offset_data + 6]= ( (bytes[ offset_byte + 8 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 9 ] & 0x1f)<<6);
			data[i][offset_data + 7]= ( (bytes[ offset_byte + 9 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 10 ] & 0xff)<<3);
		}
	}


}

void BS2POL(const unsigned char *bytes, uint16_t data[SABER_N]){ //only BS2POLq no BS2POLp
	
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;	
	
	offset_byte=0;

	for(j=0;j<SABER_N/8;j++){
		offset_byte=11*j;
		offset_data=8*j;
			
		data[offset_data + 0]= bytes[ offset_byte + 0 ] |  ((bytes[ offset_byte + 1 ] & 0x07)<<8);
		data[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 2 ] & 0x3f)<<5);
		data[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 3 ] & 0xff)<<2) |  ((bytes[ offset_byte + 4 ] & 0x01)<<10);
		data[offset_data + 3]= ( (bytes[ offset_byte + 4 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 5 ] & 0x0f)<<7);
		data[offset_data + 4]= ( (bytes[ offset_byte + 5 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 6 ] & 0x7f)<<4);
		data[offset_data + 5]= ( (bytes[ offset_byte + 6 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 7 ] & 0xff)<<1) |  ((bytes[ offset_byte + 8 ] & 0x03)<<9);
		data[offset_data + 6]= ( (bytes[ offset_byte + 8 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 9 ] & 0x1f)<<6);
		data[offset_data + 7]= ( (bytes[ offset_byte + 9 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 10 ] & 0xff)<<3);
	}


}


void POLVEC2BS(uint8_t *bytes, uint16_t data[SABER_K][SABER_N], uint16_t modulus){

	if(modulus==2048)
		POLVECq2BS(bytes, data);
	else
		POLVECp2BS(bytes, data);
}

void BS2POLVEC(const unsigned char *bytes, uint16_t data[SABER_K][SABER_N], uint16_t modulus){

	if(modulus==2048)
		BS2POLVECq(bytes, data);
	else
		BS2POLVECp(bytes, data);

}

void POLp2BS(uint8_t *bytes, uint16_t data[SABER_N], uint16_t pol_vec_index){
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	#if Saber_type == 3
  	offset_byte=0;
	offset_byte1=pol_vec_index*(SABER_N*10)/8;
	for(j=0;j<SABER_N/4;j++){
		offset_byte=offset_byte1+5*j;
		offset_data=4*j;
		bytes[offset_byte + 0]= ( data[offset_data + 0 ] & (0xff));
		bytes[offset_byte + 1]= ( (data[offset_data + 0 ] >>8) & 0x03 ) | ((data[offset_data + 1 ] & 0x3f) << 2);

		bytes[offset_byte + 2]= ( (data[offset_data + 1 ] >>6) & 0x0f ) | ( (data[offset_data + 2 ] &0x0f) << 4);

		bytes[offset_byte + 3]= ( (data[offset_data + 2 ] >>4) & 0x3f ) | ((data[offset_data + 3 ] & 0x03) << 6);

		bytes[offset_byte + 4]= ( (data[offset_data + 3 ] >>2) & 0xff );
	}

	#elif Saber_type == 2
  	offset_byte=0;
	offset_byte1=pol_vec_index*(SABER_N*9)/8;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=offset_byte1+9*j;
		offset_data=8*j;
			
		bytes[offset_byte + 0] = ( data[ offset_data + 0 ] & (0xff));
		bytes[offset_byte + 1] = ( (data[ offset_data + 0 ] >>8) & 0x01 ) | ((data[ offset_data + 1 ] & 0x7f) << 1);
		bytes[offset_byte + 2] = ( (data[ offset_data + 1 ] >>7) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2);
		bytes[offset_byte + 3] = ( (data[ offset_data + 2 ] >>6) & 0x07 ) | ((data[ offset_data + 3 ] & 0x1f) << 3);
		bytes[offset_byte + 4] = ( (data[ offset_data + 3 ] >>5) & 0x0f ) | ((data[ offset_data + 4 ] & 0x0f) << 4);
		bytes[offset_byte + 5] = ( (data[ offset_data + 4 ] >>4) & 0x1f ) | ((data[ offset_data + 5 ] & 0x07) << 5);
		bytes[offset_byte + 6] = ( (data[ offset_data + 5 ] >>3) & 0x3f ) | ((data[ offset_data + 6 ] & 0x03) << 6);
		bytes[offset_byte + 7] = ( (data[ offset_data + 6 ] >>2) & 0x7f ) | ((data[ offset_data + 7 ] & 0x01) << 7);
		bytes[offset_byte + 8] = ( (data[ offset_data + 7 ] >>1) & 0xff );
	}
	#elif Saber_type == 1
  	offset_byte=0;
	offset_byte1=pol_vec_index*(SABER_N*9)/8;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=offset_byte1+9*j;
		offset_data=8*j;
			
		bytes[offset_byte + 0] = ( data[ offset_data + 0 ] & (0xff));
		bytes[offset_byte + 1] = ( (data[ offset_data + 0 ] >>8) & 0x01 ) | ((data[ offset_data + 1 ] & 0x7f) << 1);
		bytes[offset_byte + 2] = ( (data[ offset_data + 1 ] >>7) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2);
		bytes[offset_byte + 3] = ( (data[ offset_data + 2 ] >>6) & 0x07 ) | ((data[ offset_data + 3 ] & 0x1f) << 3);
		bytes[offset_byte + 4] = ( (data[ offset_data + 3 ] >>5) & 0x0f ) | ((data[ offset_data + 4 ] & 0x0f) << 4);
		bytes[offset_byte + 5] = ( (data[ offset_data + 4 ] >>4) & 0x1f ) | ((data[ offset_data + 5 ] & 0x07) << 5);
		bytes[offset_byte + 6] = ( (data[ offset_data + 5 ] >>3) & 0x3f ) | ((data[ offset_data + 6 ] & 0x03) << 6);
		bytes[offset_byte + 7] = ( (data[ offset_data + 6 ] >>2) & 0x7f ) | ((data[ offset_data + 7 ] & 0x01) << 7);
		bytes[offset_byte + 8] = ( (data[ offset_data + 7 ] >>1) & 0xff );
	}
#else
#error "Unsupported SABER parameter."
#endif
}

void BS2POLp(uint16_t pol_index, const unsigned char *bytes, uint16_t pol[]){
	
	uint32_t j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	#if Saber_type == 3
  	offset_byte=0;
	offset_byte1=pol_index*(SABER_N*10)/8;
	for(j=0;j<SABER_N/4;j++){
		offset_byte=offset_byte1+5*j;
		offset_data=4*j;
		pol[offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x03)<<8);
		pol[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 2 ] & 0x0f)<<6);		
		pol[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 3 ] & 0x3f)<<4);
		pol[offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 4 ] & 0xff)<<2);		
	}
	#elif Saber_type == 2
  	offset_byte=0;
	offset_byte1=pol_index*(SABER_N*9)/8;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=offset_byte1+9*j;
		offset_data=8*j;	
		pol[offset_data + 0]= (bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x01)<<8);
		pol[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 2 ] & 0x03)<<7);	
		pol[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 3 ] & 0x07)<<6);
		pol[offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 4 ] & 0x0f)<<5);
		pol[offset_data + 4]= ( (bytes[ offset_byte + 4 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 5 ] & 0x1f)<<4);
		pol[offset_data + 5]= ( (bytes[ offset_byte + 5 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 6 ] & 0x3f)<<3);
		pol[offset_data + 6]= ( (bytes[ offset_byte + 6 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 7 ] & 0x7f)<<2);
		pol[offset_data + 7]= ( (bytes[ offset_byte + 7 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 8 ] & 0xff)<<1);	
	}
	#elif Saber_type == 1
  	offset_byte=0;
	offset_byte1=pol_index*(SABER_N*9)/8;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=offset_byte1+9*j;
		offset_data=8*j;	
		pol[offset_data + 0]= (bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x01)<<8);
		pol[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 2 ] & 0x03)<<7);	
		pol[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 3 ] & 0x07)<<6);
		pol[offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 4 ] & 0x0f)<<5);
		pol[offset_data + 4]= ( (bytes[ offset_byte + 4 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 5 ] & 0x1f)<<4);
		pol[offset_data + 5]= ( (bytes[ offset_byte + 5 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 6 ] & 0x3f)<<3);
		pol[offset_data + 6]= ( (bytes[ offset_byte + 6 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 7 ] & 0x7f)<<2);
		pol[offset_data + 7]= ( (bytes[ offset_byte + 7 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 8 ] & 0xff)<<1);	
	}
#else
#error "Unsupported SABER parameter."
#endif
}

unsigned char POLp2BS_cmp(uint8_t *bytes, uint16_t data[SABER_N], uint16_t pol_vec_index)
{
	unsigned char fail = 0;
	
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	#if Saber_type == 3
  	offset_byte1=pol_vec_index*(SABER_N*10)/8;
	for(j=0;j<SABER_N/4;j++){
		offset_byte=offset_byte1+5*j;
		offset_data=4*j;
		fail |= (bytes[offset_byte + 0]) ^ ( data[offset_data + 0 ] & (0xff));
		fail |= (bytes[offset_byte + 1]) ^ (( (data[offset_data + 0 ] >>8) & 0x03 ) | ((data[offset_data + 1 ] & 0x3f) << 2));
		fail |= (bytes[offset_byte + 2]) ^ (( (data[offset_data + 1 ] >>6) & 0x0f ) | ( (data[offset_data + 2 ] &0x0f) << 4));
		fail |= (bytes[offset_byte + 3]) ^ (( (data[offset_data + 2 ] >>4) & 0x3f ) | ((data[offset_data + 3 ] & 0x03) << 6));
		fail |= (bytes[offset_byte + 4]) ^ ( (data[offset_data + 3 ] >>2) & 0xff );
		}
	#elif Saber_type == 2
  	offset_byte=0;
	offset_byte1=pol_vec_index*(SABER_N*9)/8;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=offset_byte1+9*j;
		offset_data=8*j;	
		fail |= bytes[offset_byte + 0] ^ ( data[ offset_data + 0 ] & (0xff));
		fail |= bytes[offset_byte + 1] ^ (( (data[ offset_data + 0 ] >>8) & 0x01 ) | ((data[ offset_data + 1 ] & 0x7f) << 1));
		fail |= bytes[offset_byte + 2] ^ (( (data[ offset_data + 1 ] >>7) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2));
		fail |= bytes[offset_byte + 3] ^ (( (data[ offset_data + 2 ] >>6) & 0x07 ) | ((data[ offset_data + 3 ] & 0x1f) << 3));
		fail |= bytes[offset_byte + 4] ^ (( (data[ offset_data + 3 ] >>5) & 0x0f ) | ((data[ offset_data + 4 ] & 0x0f) << 4));
		fail |= bytes[offset_byte + 5] ^ (( (data[ offset_data + 4 ] >>4) & 0x1f ) | ((data[ offset_data + 5 ] & 0x07) << 5));
		fail |= bytes[offset_byte + 6] ^ (( (data[ offset_data + 5 ] >>3) & 0x3f ) | ((data[ offset_data + 6 ] & 0x03) << 6));
		fail |= bytes[offset_byte + 7] ^ (( (data[ offset_data + 6 ] >>2) & 0x7f ) | ((data[ offset_data + 7 ] & 0x01) << 7));
		fail |= bytes[offset_byte + 8] ^ ( (data[ offset_data + 7 ] >>1) & 0xff );
	}
	#elif Saber_type == 1
  	offset_byte=0;
	offset_byte1=pol_vec_index*(SABER_N*9)/8;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=offset_byte1+9*j;
		offset_data=8*j;	
		fail |= bytes[offset_byte + 0] ^ ( data[ offset_data + 0 ] & (0xff));
		fail |= bytes[offset_byte + 1] ^ (( (data[ offset_data + 0 ] >>8) & 0x01 ) | ((data[ offset_data + 1 ] & 0x7f) << 1));
		fail |= bytes[offset_byte + 2] ^ (( (data[ offset_data + 1 ] >>7) & 0x03 ) | ((data[ offset_data + 2 ] & 0x3f) << 2));
		fail |= bytes[offset_byte + 3] ^ (( (data[ offset_data + 2 ] >>6) & 0x07 ) | ((data[ offset_data + 3 ] & 0x1f) << 3));
		fail |= bytes[offset_byte + 4] ^ (( (data[ offset_data + 3 ] >>5) & 0x0f ) | ((data[ offset_data + 4 ] & 0x0f) << 4));
		fail |= bytes[offset_byte + 5] ^ (( (data[ offset_data + 4 ] >>4) & 0x1f ) | ((data[ offset_data + 5 ] & 0x07) << 5));
		fail |= bytes[offset_byte + 6] ^ (( (data[ offset_data + 5 ] >>3) & 0x3f ) | ((data[ offset_data + 6 ] & 0x03) << 6));
		fail |= bytes[offset_byte + 7] ^ (( (data[ offset_data + 6 ] >>2) & 0x7f ) | ((data[ offset_data + 7 ] & 0x01) << 7));
		fail |= bytes[offset_byte + 8] ^ ( (data[ offset_data + 7 ] >>1) & 0xff );
	}
#else
#error "Unsupported SABER parameter."
#endif			
	return fail;
}

unsigned char SABER_pack_3bit_cmp(uint8_t *bytes, uint16_t *data)
{
	unsigned char fail = 0;

	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;
	
	offset_byte=0;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=3*j;
		offset_data=8*j;
		fail |= (bytes[offset_byte + 0]) ^ ((data[offset_data + 0] & 0x7) | ( (data[offset_data + 1] & 0x7)<<3 ) | ((data[offset_data + 2] & 0x3)<<6));
		fail |= (bytes[offset_byte + 1]) ^ (((data[offset_data + 2] >> 2 ) & 0x01)  | ( (data[offset_data + 3] & 0x7)<<1 ) | ( (data[offset_data + 4] & 0x7)<<4 ) | (((data[offset_data + 5]) & 0x01)<<7));
		fail |= (bytes[offset_byte + 2]) ^ (((data[offset_data + 5] >> 1 ) & 0x03) | ( (data[offset_data + 6] & 0x7)<<2 ) | ( (data[offset_data + 7] & 0x7)<<5 ));
	}
	return fail;
}

unsigned char SABER_pack_5bit_cmp(uint8_t *bytes, uint16_t *data)
{
	unsigned char fail = 0;

	uint32_t j;
	uint32_t offset_data=0,offset_byte=0;
	
	offset_byte=0;
	for(j=0;j<SABER_N/8;j++){
		offset_byte=5*j;
		offset_data=8*j;
		fail |= bytes[offset_byte + 0] ^ ((data[offset_data + 0] & 0x1f) | ( (data[offset_data + 1] & 0x07)<<5 ));
		fail |= bytes[offset_byte + 1] ^ (((data[offset_data + 1] >> 3 ) & 0x03)  | ( (data[offset_data + 2] & 0x1f)<<2 ) | ( (data[offset_data + 3] & 0x01)<<7 ));
		fail |= bytes[offset_byte + 2] ^ (((data[offset_data + 3] >> 1 ) & 0x0f)  | ( (data[offset_data + 4] & 0x0f)<<4 ));
		fail |= bytes[offset_byte + 3] ^ (((data[offset_data + 4] >> 4 ) & 0x01)  | ( (data[offset_data + 5] & 0x1f)<<1 ) | ( (data[offset_data + 6] & 0x03)<<6 ));
		fail |= bytes[offset_byte + 4] ^ (((data[offset_data + 6] >> 2 ) & 0x07)  | ( (data[offset_data + 7] & 0x1f)<<3 ));
	}
	return fail;
}

void POLSEC2BS(uint8_t *bytes, uint16_t data[SABER_K][SABER_N])
{
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*2)/8;
		for(j=0;j<SABER_N/4;j++){
			offset_byte=offset_byte1+j;
			offset_data=4*j;
			bytes[offset_byte] = (data[i][offset_data] & 0x03) | ((data[i][offset_data+1] & 0x03)<<2) | ((data[i][offset_data+2] & 0x03)<<4) | ((data[i][offset_data+3] & 0x03)<<6);
		}
	}
}

void BS2POLSEC(const unsigned char *bytes, uint16_t data[SABER_K][SABER_N])
{
	uint32_t i,j;
	uint32_t offset_data=0,offset_byte=0,offset_byte1=0;	
	
	offset_byte=0;
	for(i=0;i<SABER_K;i++){
		offset_byte1=i*(SABER_N*2)/8;
		for(j=0;j<SABER_N/4;j++){
			offset_byte=offset_byte1+j;
			offset_data=4*j;
			data[i][offset_data]   = ( (bytes[offset_byte] & 0x03) ^ 0x2 ) - 0x2;
			data[i][offset_data+1] = ( ((bytes[offset_byte]>>2) & 0x03) ^ 0x2 ) - 0x2;
			data[i][offset_data+2] = ( ((bytes[offset_byte]>>4) & 0x03) ^ 0x2 ) - 0x2;
			data[i][offset_data+3] = ( ((bytes[offset_byte]>>6) & 0x03) ^ 0x2 ) - 0x2;

		}
	}
}


