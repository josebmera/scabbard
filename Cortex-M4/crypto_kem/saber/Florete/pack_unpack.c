#include "pack_unpack.h"

void rlwr_pack_4bit(uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/2;i++){
		offset_byte=i;
		offset_data=2*i;
		bytes[offset_byte + 0]= (data[offset_data + 0] & 0x0f) | ( (data[offset_data + 1] & 0x0f)<<4 );
	}
}

void rlwr_un_pack4bit(const uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/2;i++){
		offset_byte=i;
		offset_data=2*i;
		data[offset_data + 0] = (bytes[offset_byte+0])&0x0f;
		data[offset_data + 1] = ( (bytes[offset_byte+0])>>4 )&0x0f;
	}
}

void rlwr_pack_10bit(uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/4;i++){
		offset_byte = 5*i;
		offset_data = 4*i;
		bytes[offset_byte + 0] = ( data[ offset_data + 0 ] & (0xff));
		bytes[offset_byte + 1] = ( (data[ offset_data + 0 ] >>8) & 0x03 ) | ((data[ offset_data + 1 ] & 0x3f) << 2);
		bytes[offset_byte + 2] = ( (data[ offset_data + 1 ] >>6) & 0x0f ) | ( (data[ offset_data + 2 ] &0x0f) << 4);
		bytes[offset_byte + 3] = ( (data[ offset_data + 2 ] >>4) & 0x3f ) | ((data[ offset_data + 3 ] & 0x03) << 6);
		bytes[offset_byte + 4] = ( (data[ offset_data + 3 ] >>2) & 0xff );
	}
}

void rlwr_un_pack10bit(const uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/4;i++){
		offset_byte = 5*i;
		offset_data = 4*i;
		data[offset_data + 0]= ( bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x03)<<8);
		data[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 2 ] & 0x0f)<<6);		
		data[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 3 ] & 0x3f)<<4);
		data[offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 4 ] & 0xff)<<2);		
	}
}

void rlwr_pack_9bit(uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/8;i++){
		offset_byte = 9*i;
		offset_data = 8*i;
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
}

void rlwr_un_pack9bit(const uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/8;i++){
		offset_byte = 9*i;
		offset_data = 8*i;
		data[offset_data + 0]= (bytes[ offset_byte + 0 ] & (0xff)) |  ((bytes[ offset_byte + 1 ] & 0x01)<<8);
		data[offset_data + 1]= ( (bytes[ offset_byte + 1 ]>>1) & (0x7f)) |  ((bytes[ offset_byte + 2 ] & 0x03)<<7);	
		data[offset_data + 2]= ( (bytes[ offset_byte + 2 ]>>2) & (0x3f)) |  ((bytes[ offset_byte + 3 ] & 0x07)<<6);
		data[offset_data + 3]= ( (bytes[ offset_byte + 3 ]>>3) & (0x1f)) |  ((bytes[ offset_byte + 4 ] & 0x0f)<<5);
		data[offset_data + 4]= ( (bytes[ offset_byte + 4 ]>>4) & (0x0f)) |  ((bytes[ offset_byte + 5 ] & 0x1f)<<4);
		data[offset_data + 5]= ( (bytes[ offset_byte + 5 ]>>5) & (0x07)) |  ((bytes[ offset_byte + 6 ] & 0x3f)<<3);
		data[offset_data + 6]= ( (bytes[ offset_byte + 6 ]>>6) & (0x03)) |  ((bytes[ offset_byte + 7 ] & 0x7f)<<2);
		data[offset_data + 7]= ( (bytes[ offset_byte + 7 ]>>7) & (0x01)) |  ((bytes[ offset_byte + 8 ] & 0xff)<<1);		
	}
}

void rlwr_pack_1bit(uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data;
	for(i=0;i<rlwr_N/8;i++){
		offset_data = 8*i;
		bytes[i] = ( data[ offset_data + 0 ] & 0x01)|(( data[ offset_data + 1 ] & 0x01)<<1)|(( data[ offset_data + 2 ] & 0x01)<<2)|(( data[ offset_data + 3 ] & 0x01)<<3)|(( data[ offset_data + 4 ] & 0x01)<<4)|(( data[ offset_data + 5] & 0x01)<<5)|(( data[ offset_data + 6 ] & 0x01)<<6)|(( data[ offset_data + 7 ] & 0x01)<<7);
	}
}

void rlwr_un_pack1bit(const uint8_t *bytes, uint16_t *data){

	uint32_t i;
	uint32_t offset_data;
	for(i=0;i<rlwr_N/8;i++){
		offset_data = 8*i;
		data[offset_data] = bytes[i] & 0x01;
		data[offset_data+1] = (bytes[i]>>1) & 0x01;
		data[offset_data+2] = (bytes[i]>>2) & 0x01;
		data[offset_data+3] = (bytes[i]>>3) & 0x01;
		data[offset_data+4] = (bytes[i]>>4) & 0x01;
		data[offset_data+5] = (bytes[i]>>5) & 0x01;
		data[offset_data+6] = (bytes[i]>>6) & 0x01;
		data[offset_data+7] = (bytes[i]>>7) & 0x01;
	}
}
unsigned char rlwr_pack_9bit_cmp(uint8_t *bytes, uint16_t *data)
{
	unsigned char fail = 0;
	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/8;i++){
		offset_byte = 9*i;
		offset_data = 8*i;
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
	return fail;
}

unsigned char rlwr_pack_3bit_cmp(uint8_t *bytes, uint16_t *data)
{
	unsigned char fail = 0;
	uint32_t i;
	uint32_t offset_data,offset_byte;
	for(i=0;i<rlwr_N/8;i++){
		offset_byte=3*i;
		offset_data=8*i;
		fail |= bytes[offset_byte + 0] ^ ((data[offset_data + 0] & 0x7) | ( (data[offset_data + 1] & 0x7)<<3 ) | ((data[offset_data + 2] & 0x3)<<6));
		fail |= bytes[offset_byte + 1] ^ (((data[offset_data + 2] >> 2 ) & 0x01)  | ( (data[offset_data + 3] & 0x7)<<1 ) | ( (data[offset_data + 4] & 0x7)<<4 ) | (((data[offset_data + 5]) & 0x01)<<7));
		fail |= bytes[offset_byte + 2] ^ (((data[offset_data + 5] >> 1 ) & 0x03) | ( (data[offset_data + 6] & 0x7)<<2 ) | ( (data[offset_data + 7] & 0x7)<<5 ));
	}
	return fail;
}

void POLSEC2BS(uint8_t *bytes, uint16_t data[rlwr_N])
{
	uint32_t i;
	uint32_t offset_data=0,offset_byte=0;	
	
	for(i=0;i<rlwr_N/4;i++){
		offset_byte=i;
		offset_data=4*i;
		bytes[offset_byte] = (data[offset_data] & 0x03) | ((data[offset_data+1] & 0x03)<<2) | ((data[offset_data+2] & 0x03)<<4) | ((data[offset_data+3] & 0x03)<<6);
	}
}

void BS2POLSEC(const unsigned char *bytes, uint16_t data[rlwr_N])
{
	uint32_t i;
	uint32_t offset_data=0,offset_byte=0;	
	
	for(i=0;i<rlwr_N/4;i++){
		offset_byte=i;
		offset_data=4*i;
		data[offset_data]   = ( (bytes[offset_byte] & 0x03) ^ 0x2 ) - 0x2;
		data[offset_data+1] = ( ((bytes[offset_byte]>>2) & 0x03) ^ 0x2 ) - 0x2;
		data[offset_data+2] = ( ((bytes[offset_byte]>>4) & 0x03) ^ 0x2 ) - 0x2;
		data[offset_data+3] = ( ((bytes[offset_byte]>>6) & 0x03) ^ 0x2 ) - 0x2;
	}
}




