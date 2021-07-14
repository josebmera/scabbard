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



void GenSecret(uint16_t r[mlwr_K][mlwr_N],const unsigned char *seed){


		uint32_t i;

		int32_t buf_size= mlwr_MU*mlwr_N*mlwr_K/8;

		uint8_t buf[buf_size];

		shake128(buf, buf_size, seed,mlwr_NOISESEEDBYTES);

		for(i=0;i<mlwr_K;i++)
		{
			cbd(r[i],buf+i*mlwr_MU*mlwr_N/8);
		}
}

void GenSecret_new(uint8_t r1[(mlwr_K*mlwr_N)/2], unsigned char *seed)
{
		uint32_t i,j,k,l,l1;
		int32_t buf_size= mlwr_MU*mlwr_N*mlwr_K/8;
		uint8_t buf[buf_size];
		
		uint32_t t,d;
		uint16_t a[4], b[4];

		shake128(buf, buf_size, seed,mlwr_NOISESEEDBYTES);
		
			
		for(k=0;k<mlwr_K;k++)
		{
			l = k*mlwr_MU*mlwr_N/8;
			for(i=0;i<mlwr_N/4;i++)
		  	{
		  		l1 = k*mlwr_N/2+2*i;
			    	t = load_littleendian(buf+l+3*i,3);
			    	d = 0;
			    	for(j=0;j<3;j++)
			      		d += (t >> j) & 0x249249;

			    	a[0] =  d & 0x7;
			    	b[0] = (d >>  3) & 0x7;
			    	a[1] = (d >>  6) & 0x7;
			    	b[1] = (d >>  9) & 0x7;
			    	a[2] = (d >> 12) & 0x7;
			    	b[2] = (d >> 15) & 0x7;
			    	a[3] = (d >> 18) & 0x7;
			    	b[3] = (d >> 21);

			    	r1[l1+0] = ((a[0]  - b[0])&0x0f)| (((a[1]  - b[1]) & 0x0f) << 4);
			    	r1[l1+1] = ((a[2]  - b[2])&0x0f)| (((a[3]  - b[3]) & 0x0f) << 4);
			    	
		  	}
		}
}

