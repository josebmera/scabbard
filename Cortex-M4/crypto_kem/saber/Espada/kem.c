#include "params.h"
#include <string.h>
#include <stdint.h>
#include <stdio.h>
#include "mlwr_indcpa.h"
#include "kem.h"
#include "verify.h"
#include "randombytes.h"
#include "fips202.h"

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk)
{
  int i;
 
  indcpa_kem_keypair(pk, sk);					      // sk[0:mlwr_INDCPA_SECRETKEYBYTES-1] <-- sk
  for(i=0;i<mlwr_INDCPA_PUBLICKEYBYTES;i++)
    sk[i+mlwr_INDCPA_SECRETKEYBYTES] = pk[i];			      // sk[mlwr_INDCPA_SECRETKEYBYTES:mlwr_INDCPA_SECRETKEYBYTES+mlwr_INDCPA_SECRETKEYBYTES-1] <-- pk	

  sha3_256(sk+mlwr_SECRETKEYBYTES-64, pk, mlwr_INDCPA_PUBLICKEYBYTES);  // Then hash(pk) is appended.	

  randombytes(sk+mlwr_SECRETKEYBYTES-mlwr_KEYBYTES , mlwr_KEYBYTES );    // Remaining part of sk contains a pseudo-random number. 
								      																								// This is output when check in crypto_kem_dec() fails. 
  return(0);	
}

int crypto_kem_enc(unsigned char *c, unsigned char *k, const unsigned char *pk)
{
  unsigned char kr[64];                             	  // Will contain key, coins
  unsigned char buf[64];                          

  randombytes(buf, 32);

  sha3_256(buf,buf,32);            			  // BUF[0:31] <-- random message (will be used as the key for client) Note: hash doesnot release system RNG output

  sha3_256(buf+32, pk, mlwr_INDCPA_PUBLICKEYBYTES);    // BUF[32:63] <-- Hash(public key);  Multitarget countermeasure for coins + contributory KEM 

  sha3_512(kr, buf, 64);				// kr[0:63] <-- Hash(buf[0:63]);  	
							  								// K^ <-- kr[0:31]
							  								// noiseseed (r) <-- kr[32:63];	
  indcpa_kem_enc(buf, kr+32, pk,  c);	// buf[0:31] contains message; kr[32:63] contains randomness r;  

  sha3_256(kr+32, c, mlwr_BYTES_CCA_DEC);              

  sha3_256(k, kr, 64);                          					// hash concatenation of pre-k and h(c) to k 

  return(0);	
}


int crypto_kem_dec(unsigned char *k, const unsigned char *c, const unsigned char *sk)
{
  int i, fail;
  unsigned char buf[64];
  unsigned char kr[64];                             // Will contain key, coins
  const unsigned char *pk = sk + mlwr_INDCPA_SECRETKEYBYTES;
	
   indcpa_kem_dec(sk, c, buf);			     // buf[0:31] <-- message
	
	
	

  // Multitarget countermeasure for coins + contributory KEM 
  for(i=0;i<32;i++)                                  // Save hash by storing h(pk) in sk 
    buf[32+i] = sk[mlwr_SECRETKEYBYTES-64+i]; 

  sha3_512(kr, buf, 64);

   fail = indcpa_kem_enc_cmp(buf, kr+32, pk, c);

  sha3_256(kr+32, c, mlwr_BYTES_CCA_DEC);        		     // overwrite coins in kr with h(c)  

  cmov(kr, sk+mlwr_SECRETKEYBYTES-mlwr_KEYBYTES, mlwr_KEYBYTES, fail); 

  sha3_256(k, kr, 64);                          	   	     // hash concatenation of pre-k and h(c) to k

  return(0);	
}

