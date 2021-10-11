#ifndef PACK_UNPACK_H
#define PACK_UNPACK_H

#include <stdio.h>
#include <stdint.h>
#include "params.h"


void rlwr_pack_1bit(uint8_t *bytes, uint16_t *data);

void rlwr_un_pack1bit(const uint8_t *bytes, uint16_t *data);

void rlwr_pack_4bit(uint8_t *bytes, uint16_t *data);

void rlwr_un_pack4bit(const uint8_t *bytes, uint16_t *data);

void rlwr_pack_10bit(uint8_t *bytes, uint16_t *data);

void rlwr_un_pack10bit(const uint8_t *bytes, uint16_t *data);

void rlwr_pack_9bit(uint8_t *bytes, uint16_t *data);

void rlwr_un_pack9bit(const uint8_t *bytes, uint16_t *data);

unsigned char rlwr_pack_9bit_cmp(uint8_t *bytes, uint16_t *data);

unsigned char rlwr_pack_4bit_cmp(uint8_t *bytes, uint16_t *data);

void POLSEC2BS(uint8_t *bytes, uint16_t data[rlwr_N]);

void BS2POLSEC(const unsigned char *bytes, uint16_t data[rlwr_N]);

#endif
