#ifndef INDCPA_H
#define INDCPA_H

void indcpa_kem_keypair(unsigned char *pk_byte, unsigned char *sk_byte);
void indcpa_kem_enc(unsigned char *message_received_byte, unsigned char *noiseseed, const unsigned char *pk_byte, unsigned char *ciphertext_byte);
void indcpa_kem_dec(const unsigned char *sk_byte, const unsigned char *ciphertext_byte, unsigned char *message_dec_byte);
void original_msg(unsigned char *buf1_byte,unsigned char *buf_byte);
unsigned char indcpa_kem_enc_cmp(unsigned char *message_received_byte, unsigned char *noiseseed, const unsigned char *pk_byte, unsigned char *ciphertext_byte);

#endif

