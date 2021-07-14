#ifndef PACK_UNPACK_H
#define PACK_UNPACK_H

#include <stdio.h>
#include<stdint.h>
#include "SABER_params.h"


void SABER_pack_3bit(uint8_t *bytes, uint16_t *data);

void SABER_un_pack3bit(uint8_t *bytes, uint16_t *data);

void SABER_pack_5bit(uint8_t *bytes, uint16_t *data);

void SABER_un_pack5bit(uint8_t *bytes, uint16_t *ar);

void BS2POL(const unsigned char *bytes, uint16_t data[SABER_N]);

void POLVEC2BS(uint8_t *bytes, uint16_t data[SABER_K][SABER_N], uint16_t modulus);

void BS2POLVEC(const unsigned char *bytes, uint16_t data[SABER_K][SABER_N], uint16_t modulus);

void POLSEC2BS(uint8_t *bytes, uint16_t data[SABER_K][SABER_N]);

void BS2POLSEC(const unsigned char *bytes, uint16_t data[SABER_K][SABER_N]);

#endif
