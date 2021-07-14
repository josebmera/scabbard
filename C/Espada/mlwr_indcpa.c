#include <string.h>
#include <stdint.h>
#include "mlwr_indcpa.h"
#include "poly.h"
#include "pack_unpack.h"
#include "poly_mul.c"
#include "rng.h"
#include "fips202.h"
#include "mlwr_params.h"





/*-----------------------------------------------------------------------------------
	This routine generates a=[Matrix K x K] of 64-coefficient polynomials 
-------------------------------------------------------------------------------------*/

#define h1 (1<<(mlwr_EQ-mlwr_EP-1)) //2^(EQ-EP-1)

#define h2 ( (1<<(mlwr_EP-5)) - (1<<(mlwr_EP-mlwr_ET-1)) + (1<<(mlwr_EQ-mlwr_EP-1)))

void InnerProd(uint16_t pkcl[mlwr_K][mlwr_N],uint16_t bw_ar[mlwr_K][3][3][N_SM_16],uint16_t res[mlwr_N]);
//void MatrixVectorMul(polyvec *a, uint16_t bw_ar[mlwr_K][3][3][N_SM_16], uint16_t res[mlwr_K][mlwr_N], uint16_t mod, int16_t transpose);
void MatrixVectorMul_keygen(polyvec *a, uint16_t bw_ar[mlwr_K][3][3][N_SM_16], uint16_t res[mlwr_K][mlwr_N]);
void MatrixVectorMul_enc(polyvec *a, uint16_t bw_ar[mlwr_K][3][3][N_SM_16], uint16_t res[mlwr_K][mlwr_N]);

void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec);

void GenMatrix(polyvec *a, const unsigned char *seed) 
{
  unsigned int one_vector=mlwr_EQ*mlwr_N/8;
  unsigned int byte_bank_length=mlwr_K*mlwr_K*one_vector;
  unsigned char buf[byte_bank_length];

  uint16_t temp_ar[mlwr_N];

  int i,j,k;
  uint16_t mod = modQ;

  shake128(buf,byte_bank_length,seed,mlwr_SEEDBYTES);
  
  for(i=0;i<mlwr_K;i++)
  {
    for(j=0;j<mlwr_K;j++)
    {
	BS2POL(buf+(i*mlwr_K+j)*one_vector,temp_ar);
	for(k=0;k<mlwr_N;k++){
		a[i].vec[j].coeffs[k] = (temp_ar[k])& mod ;
	}
    }
  }


}


void indcpa_kem_keypair(unsigned char *pk, unsigned char *sk)
{
  polyvec a[mlwr_K];// skpv;

  uint16_t skpv[mlwr_K][mlwr_N];
 
  unsigned char seed[mlwr_SEEDBYTES];
  unsigned char noiseseed[mlwr_COINBYTES];
  int32_t i,j;
  uint16_t mod_q=modQ;


  uint16_t res[mlwr_K][mlwr_N];

  uint16_t bw_ar[mlwr_K][3][3][N_SM_16];

  randombytes(seed, mlwr_SEEDBYTES);
  shake128(seed, mlwr_SEEDBYTES, seed, mlwr_SEEDBYTES); // for not revealing system RNG state
  randombytes(noiseseed, mlwr_COINBYTES);
  //c1=cpucycles();
  GenMatrix(a, seed);	//sample matrix A
  //c2=cpucycles();
  //count +=(c2-c1);
  GenSecret(skpv,noiseseed);//generate secret from constant-time binomial distribution

 
  //------------------------do the matrix vector multiplication and rounding------------

	//pre-computation B
	for(i=0;i<mlwr_K;i++)
		evaluation_single((const uint16_t *)skpv[i], bw_ar[i]);


	/*for(i=0;i<mlwr_K;i++){
		for(j=0;j<mlwr_N;j++){
			res[i][j]=0;
		}
	}*/
	
	MatrixVectorMul_keygen(a,bw_ar,res);
	
	//MatrixVectorMul(a,bw_ar,res,modQ,1);
  	
	//-----now rounding
	for(i=0;i<mlwr_K;i++){ //shift right 1 bits
		for(j=0;j<mlwr_N;j++){
			res[i][j]=(res[i][j] + h1) & (mod_q);
			res[i][j]=(res[i][j]>>(mlwr_EQ-mlwr_EP));
		}
	}
	
	//------------------unload and pack sk=9 x (64 coefficients of 9 bits)-------
		
	//POLVEC2BS(sk, skpv, modQ);
	POLSEC2BS(sk, skpv);

	//------------------unload and pack pk=256 bits seed and 9 x (64 coefficients of 9 bits)-------

	
	POLVEC2BS(pk, res, modP); // load the public-key coefficients



	for(i=0;i<mlwr_SEEDBYTES;i++){ // now load the seedbytes in PK. Easy since seed bytes are kept in byte format.
		pk[mlwr_POLYVECCOMPRESSEDBYTES + i]=seed[i]; 
	}

}


void indcpa_kem_enc(unsigned char *message_received, unsigned char *noiseseed, const unsigned char *pk, unsigned char *ciphertext)
{
	uint32_t i,j,k;
	polyvec a[mlwr_K];		// skpv;
	unsigned char seed[mlwr_SEEDBYTES];
	uint16_t pkcl[mlwr_K][mlwr_N]; 	//public key of received by the client



	uint16_t skpv1[mlwr_K][mlwr_N];

	uint16_t message[mlwr_N];

	uint16_t res[mlwr_K][mlwr_N];
	uint16_t mod_p=modP;
	uint16_t mod_q=modQ;
	
	uint16_t vprime[mlwr_N];

	

	unsigned char msk_c[mlwr_SCALEBYTES_KEM];
	
	uint16_t bw_ar[mlwr_K][3][3][N_SM_16];	 
	
	for(i=0;i<mlwr_SEEDBYTES;i++){ // extract the seedbytes from Public Key.
		seed[i]=pk[ mlwr_POLYVECCOMPRESSEDBYTES + i]; 
	}

	GenMatrix(a, seed);				

	GenSecret(skpv1,noiseseed);//generate secret from constant-time binomial distribution

	//pre-computation B	
	for(i=0;i<mlwr_K;i++)
		evaluation_single((const uint16_t *)skpv1[i], bw_ar[i]);
		
		
	//-----------------matrix-vector multiplication and rounding

	/*for(i=0;i<mlwr_K;i++){
		for(j=0;j<mlwr_N;j++){
			res[i][j]=0;
		}
	}*/
	
	//MatrixVectorMul(a,bw_ar,res,modQ,0);
	MatrixVectorMul_enc(a,bw_ar,res);
	  //-----now rounding

	for(i=0;i<mlwr_K;i++){ //shift right 1 bits
		for(j=0;j<mlwr_N;j++){
			res[i][j]=( res[i][j]+ h1 ) & mod_q;
			res[i][j]=(res[i][j]>> (mlwr_EQ-mlwr_EP) );
		}
	}

	POLVEC2BS(ciphertext, res, modP);
	
	

//*******************client matrix-vector multiplication ends************************************

	//------now calculate the v'

	//-------unpack the public_key

	//pkcl is the b in the protocol
	BS2POLVEC(pk,pkcl,modP);



	for(i=0;i<mlwr_N;i++)
		vprime[i]=0;

	for(i=0;i<mlwr_K;i++){
		for(j=0;j<mlwr_N;j++){
			skpv1[i][j]=skpv1[i][j] & (mod_p);
		}
	}

	// vector-vector scalar multiplication with mod p
	InnerProd(pkcl,bw_ar,vprime);

	//addition of h1 to vprime
	for(i=0;i<mlwr_N;i++)
		vprime[i]=vprime[i]+h1;

	
	// unpack message_received;
	for(j=0; j<mlwr_KEYBYTES; j++)
	{
		//8/4=2
		for(i=0; i<2; i++)
		{
			message[2*j+i] = ((message_received[j]>>4*i) & 0x0f);
		}
	}
	
	// message encoding
	for(i=0; i<mlwr_N; i++)
	{
		message[i] = (message[i]<<(mlwr_EP-4));		
	}
	
	
	for(k=0;k<mlwr_N;k++)
	{
		vprime[k]=( (vprime[k] - message[k]) & (mod_p) )>>(mlwr_EP-mlwr_ET);
	}

	mlwr_pack_7bit(msk_c, vprime);

	for(j=0;j<mlwr_SCALEBYTES_KEM;j++){
		ciphertext[mlwr_POLYVECCOMPRESSEDBYTES + j] = msk_c[j];
	}
}


void indcpa_kem_dec(const unsigned char *sk, const unsigned char *ciphertext, unsigned char *message_dec)
{

	uint32_t i,j;
	
	
	uint16_t sksv[mlwr_K][mlwr_N]; //secret key of the server
	

	uint16_t pksv[mlwr_K][mlwr_N];
	
	uint8_t scale_ar[mlwr_SCALEBYTES_KEM];
	
	uint16_t mod_p=modP;

	uint16_t v[mlwr_N];

	uint16_t op[mlwr_N];
	
	uint16_t bw_ar[mlwr_K][3][3][N_SM_16];
	
	
	//BS2POLVEC(sk, sksv, modQ); //sksv is the secret-key
	BS2POLSEC(sk, sksv);
	BS2POLVEC(ciphertext, pksv, modP); //pksv is the ciphertext
	
	// vector-vector scalar multiplication with mod p
	for(i=0;i<mlwr_N;i++)
		v[i]=0;

	for(i=0;i<mlwr_K;i++){
		for(j=0;j<mlwr_N;j++){
			sksv[i][j]=(uint16_t)sksv[i][j] & (modP);
		}
	}
	
	for(i=0;i<mlwr_K;i++)
		evaluation_single((const uint16_t *)sksv[i], bw_ar[i]);
		
	InnerProd(pksv,bw_ar,v);
	
	
	//Extraction
	for(i=0;i<mlwr_SCALEBYTES_KEM;i++){
		scale_ar[i]=ciphertext[mlwr_POLYVECCOMPRESSEDBYTES+i];
	}

	mlwr_un_pack7bit(scale_ar, op);

	//addition of h2
	for(i=0;i<mlwr_N;i++){
		v[i]= ( ( v[i] + h2 - (op[i]<<(mlwr_EP-mlwr_ET)) ) & (mod_p) ) >> (mlwr_EP-4);
	}
	
	// pack decrypted message
	
	POL2MSG(v, message_dec);
	
}

void MatrixVectorMul_keygen(polyvec *a, uint16_t bw_ar[mlwr_K][3][3][N_SM_16], uint16_t res[mlwr_K][mlwr_N]){
 
	int32_t i,j,k;

	uint16_t result_final[2*mlwr_N],tmp[mlwr_N];
	
//----------------------initialization and precomputation of B--------------------------

	uint16_t w_ar[3][3][N_SM_16_RES];
	
//----------------------initialization and precomputation of B ends---------------------

		for(i=0;i<mlwr_K;i++){
			//----------------------make it the result holder zero--------------------------
			/*for(j=0;j<3;j++){
				for(l=0;l<3;l++){
					for(k=0;k<N_SM_16_RES;k++){
						w_ar[j][l][k]=0;
					}
				}	
			}*/
			memset(w_ar,0,3*3*N_SM_16_RES*sizeof(uint16_t));
			memset(result_final,0,2*mlwr_N*sizeof(uint16_t));
			/*for(k=0;k<2*mlwr_N;k++){
				result_final[k]=0;
			}*/
			//----------------------make it the result holder zero ends---------------------

			for(j=0;j<mlwr_K;j++){
				for(k=0;k<mlwr_N;k++)
					tmp[k]=(uint16_t)a[j].vec[i].coeffs[k];
				//------here goes the eval everytime
				//c1=cpucycles();
				TC_evaluation(tmp, bw_ar[j], w_ar);
				//c2=cpucycles();
				//count+=(c2-c1);

				if(j==mlwr_K-1){
					
					TC_interpolation(w_ar,result_final);
					
				//----------polynomial reduction----------------
					for(k=mlwr_N;k<2*mlwr_N;k++){
						res[i][k-mlwr_N]=(result_final[k-mlwr_N]-result_final[k]);//&(mod);
					}
				//----------polynomial reduction ends-----------
					
				}			
			}
		}
}
void MatrixVectorMul_enc(polyvec *a, uint16_t bw_ar[mlwr_K][3][3][N_SM_16], uint16_t res[mlwr_K][mlwr_N]){
 
	int32_t i,j,k;

	uint16_t result_final[2*mlwr_N],tmp[mlwr_N];
	
//----------------------initialization and precomputation of B--------------------------

	uint16_t w_ar[3][3][N_SM_16_RES];
	
		for(i=0;i<mlwr_K;i++){
			//----------------------make it the result holder zero--------------------------
			/*for(j=0;j<3;j++){
				for(l=0;l<3;l++){
					for(k=0;k<N_SM_16_RES;k++){
						w_ar[j][l][k]=0;
					}
				}	
			}*/
			memset(w_ar,0,3*3*N_SM_16_RES*sizeof(uint16_t));
			memset(result_final,0,2*mlwr_N*sizeof(uint16_t));
			/*for(k=0;k<2*mlwr_N;k++){
				result_final[k]=0;
			}*/
			//----------------------make it the result holder zero ends---------------------

			for(j=0;j<mlwr_K;j++){
				for(k=0;k<mlwr_N;k++)
					tmp[k]=(uint16_t)a[i].vec[j].coeffs[k];
				//------here goes the eval everytime
				//c1=cpucycles();
				TC_evaluation(tmp, bw_ar[j], w_ar);
				//TC_evaluation((const uint16_t *)&a[i].vec[j], bw_ar[j], w_ar);
				//c2=cpucycles();
				//count+=(c2-c1);
				if(j==mlwr_K-1){
					TC_interpolation(w_ar,result_final);
				//----------polynomial reduction----------------
					for(k=mlwr_N;k<2*mlwr_N;k++){
						res[i][k-mlwr_N]=(result_final[k-mlwr_N]-result_final[k]);//&(mod);
					}
				//----------polynomial reduction ends-----------
					
				}			
			}
		}
				

}
void POL2MSG(uint16_t *message_dec_unpacked, unsigned char *message_dec){

	int32_t i,j;

	for(j=0; j<mlwr_KEYBYTES; j++)
	{
		message_dec[j] = 0;
		for(i=0; i<2; i++)
		message_dec[j] = message_dec[j] | (message_dec_unpacked[j*2 + i] <<4*i);
	} 

}


void InnerProd(uint16_t pkcl[mlwr_K][mlwr_N],uint16_t bw_ar[mlwr_K][3][3][N_SM_16],uint16_t res[mlwr_N]){


	uint32_t j,k;
	uint16_t result_final[2*mlwr_N];

	//----------------------initialization and precomputation of B--------------------------

	uint16_t w_ar[3][3][N_SM_16_RES];

//----------------------initialization and precomputation of B ends---------------------


			//----------------------make it the result holder zero--------------------------
		/*for(j=0;j<3;j++){
			for(l=0;l<3;l++){
				for(k=0;k<N_SM_16_RES;k++){
					w_ar[j][l][k]=0;
				}
			}	
		}*/
		memset(w_ar,0,3*3*N_SM_16_RES*sizeof(uint16_t));
		memset(result_final,0,2*mlwr_N*sizeof(uint16_t));
		/*for(k=0;k<2*mlwr_N;k++){
			result_final[k]=0;
		}*/
		//----------------------make it the result holder zero ends---------------------
		for(j=0;j<mlwr_K;j++){
			//------here goes the eval everytime
			TC_evaluation((const uint16_t *)pkcl[j], bw_ar[j], w_ar);

			if(j==mlwr_K-1){
				TC_interpolation(w_ar,result_final);
				//----------polynomial reduction----------------
				for(k=mlwr_N;k<2*mlwr_N;k++){
					res[k-mlwr_N]=(result_final[k-mlwr_N]-result_final[k]);//&(mod);
				}
			//----------polynomial reduction ends-----------
				
			}			
		}
}

