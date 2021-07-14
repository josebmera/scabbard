/*---------------------------------------------------------------------
This file has been adapted from the implementation 
(available at, Public Domain https://github.com/pq-crystals/kyber) 
of "CRYSTALS – Kyber: a CCA-secure module-lattice-based KEM"
by : Joppe Bos, Leo Ducas, Eike Kiltz, Tancrede Lepoint, 
Vadim Lyubashevsky, John M. Schanck, Peter Schwabe & Damien stehle
----------------------------------------------------------------------*/
#include <stdio.h>
#include "api.h"
#include "poly.h"
#include "cbd.h"
#include "fips202.h"



void GenSecret(uint16_t r[SABER_K][SABER_N],const unsigned char *seed){


		uint32_t i;

		uint8_t buf[SABER_NOISEBUFSIZE];//SABER_MU*SABER_N*SABER_K/8

		shake128(buf, SABER_NOISEBUFSIZE, seed,SABER_NOISESEEDBYTES);

		for(i=0;i<SABER_K;i++)
		{
			cbd(r[i],buf+i*SABER_MU*SABER_N/8);
		}
}

void GenSecret_new(uint8_t r1[(SABER_K*SABER_N)/4], const unsigned char *seed)
{
		uint32_t i,k,l;
		uint8_t buf[SABER_NOISEBUFSIZE];
		uint8_t d;
		uint16_t a[4], b[4];

		shake128(buf, SABER_NOISEBUFSIZE, seed,SABER_NOISESEEDBYTES);
		
			
		for(k=0;k<SABER_K;k++)
		{
			l = k*SABER_MU*SABER_N/8;
			for(i=0;i<SABER_N/4;i++)
			{
				d = buf[l+i];
			    	a[0] =  d & 0x1;
			    	b[0] = (d >> 1) & 0x1;
			    	a[1] = (d >> 2) & 0x1;
			    	b[1] = (d >> 3) & 0x1;
			    	a[2] = (d >> 4) & 0x1;
			    	b[2] = (d >> 5) & 0x1;
			    	a[3] = (d >> 6) & 0x1;
			    	b[3] = (d >> 7) & 0x1;

				r1[l+i] = ((a[0]  - b[0])&0x03)| (((a[1]  - b[1]) & 0x03) << 2) | (((a[2]  - b[2]) & 0x03) << 4) | (((a[3]  - b[3]) & 0x03) << 6);
			  }
		}
}




