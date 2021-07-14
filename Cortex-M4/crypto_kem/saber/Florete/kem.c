#include "params.h"
#include <string.h>
#include <stdint.h>
#include <stdio.h>
#include "rlwr_indcpa.h"
#include "kem.h"
#include "verify.h"
#include "randombytes.h"
#include "fips202.h"
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

int crypto_kem_keypair(unsigned char *pk, unsigned char *sk)
{
  int i;
 
  indcpa_kem_keypair(pk, sk);					      // sk[0:rlwr_INDCPA_SECRETKEYBYTES-1] <-- sk
  for(i=0;i<rlwr_INDCPA_PUBLICKEYBYTES;i++)
    sk[i+rlwr_INDCPA_SECRETKEYBYTES] = pk[i];			      // sk[rlwr_INDCPA_SECRETKEYBYTES:rlwr_INDCPA_SECRETKEYBYTES+rlwr_INDCPA_SECRETKEYBYTES-1] <-- pk	

  sha3_256(sk+rlwr_SECRETKEYBYTES-64, pk, rlwr_INDCPA_PUBLICKEYBYTES);  // Then hash(pk) is appended.	

  randombytes(sk+rlwr_SECRETKEYBYTES-rlwr_KEYBYTES , rlwr_KEYBYTES );    // Remaining part of sk contains a pseudo-random number. 
								      																								// This is output when check in crypto_kem_dec() fails. 
  return(0);	
}

int crypto_kem_enc(unsigned char *c, unsigned char *k, const unsigned char *pk)
{
  int i;
  unsigned char kr[64];                             	  // Will contain key, coins
  unsigned char buf[96];                          

  randombytes(buf, 32);

	sha3_256(buf,buf,32);            			  // BUF[0:31] <-- random message (will be used as the key for client) Note: hash doesnot release system RNG output

  sha3_256(buf+32, pk, rlwr_INDCPA_PUBLICKEYBYTES);    // BUF[32:63] <-- Hash(public key);  Multitarget countermeasure for coins + contributory KEM 

  sha3_512(kr, buf, 64);				// kr[0:63] <-- Hash(buf[0:63]);  	
  
  for(i=0;i<rlwr_N/24;i++){// 3*8 where 3->repetition and transfer them in byte have to devide by 8 
  	buf[i] = buf[i];
  	buf[(rlwr_N/24)+i] = buf[i];
  	buf[2*(rlwr_N/24)+i] = buf[i];
  }
   						  								// K^ <-- kr[0:31]
							  								// noiseseed (r) <-- kr[32:63];	
  indcpa_kem_enc(buf, kr+32, pk,  c);	// buf1[0:96] contains message; kr[32:63] contains randomness r;  


  sha3_256(kr+32, c, rlwr_BYTES_CCA_DEC);              

  sha3_256(k, kr, 64);                          					// hash concatenation of pre-k and h(c) to k 

  return(0);	
}


int crypto_kem_dec(unsigned char *k, const unsigned char *c, const unsigned char *sk)
{
  int i, fail;
  //unsigned char cmp[rlwr_BYTES_CCA_DEC];
  unsigned char buf[96];
  unsigned char kr[64];                             // Will contain key, coins
  const unsigned char *pk = sk + rlwr_INDCPA_SECRETKEYBYTES;
	
  indcpa_kem_dec(sk, c, buf);			     // buf[0:31] <-- message
 	
 
 
  original_msg(buf,buf);
 
  // Multitarget countermeasure for coins + contributory KEM 
  for(i=0;i<32;i++)                                  // Save hash by storing h(pk) in sk 
    buf[32+i] = sk[rlwr_SECRETKEYBYTES-64+i];      
     
  sha3_512(kr, buf, 64);
  for(i=0;i<rlwr_N/24;i++){// 3*8 where 3->repetition and transfer them in byte have to devide by 8 
  	buf[i] = buf[i];
  	buf[(rlwr_N/24)+i] = buf[i];
  	buf[(rlwr_N/24)+(2*i)] = buf[i];
  }
  fail = indcpa_kem_enc_cmp(buf, kr+32, pk, c);
  //indcpa_kem_enc(buf, kr+32, pk, cmp);
 
  //fail = verify(c, cmp, rlwr_BYTES_CCA_DEC);

  sha3_256(kr+32, c, rlwr_BYTES_CCA_DEC);        		     // overwrite coins in kr with h(c)  

  cmov(kr, sk+rlwr_SECRETKEYBYTES-rlwr_KEYBYTES, rlwr_KEYBYTES, fail); 

  sha3_256(k, kr, 64);                          	   	     // hash concatenation of pre-k and h(c) to k

  return(0);	
}
