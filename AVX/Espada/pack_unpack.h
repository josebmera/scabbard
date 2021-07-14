#ifndef PACK_UNPACK_H
#define PACK_UNPACK_H

#include <stdio.h>
#include<stdint.h>
#include "mlwr_params.h"


void mlwr_pack_7bit(uint8_t *bytes, uint16_t *data);

void mlwr_un_pack7bit(uint8_t *bytes, uint16_t *data);

void POLVECq2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N]);

void BS2POLVECq(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N]);

void POLVECp2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N]);

void BS2POLVECp(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N]);

void BS2POL(const unsigned char *bytes, uint16_t data[mlwr_N]);

void POLVEC2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N], uint16_t modulus);

void BS2POLVEC(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N], uint16_t modulus);

void POLSEC2BS(uint8_t *bytes, uint16_t data[mlwr_K][mlwr_N]);

void BS2POLSEC(const unsigned char *bytes, uint16_t data[mlwr_K][mlwr_N]);

#endif