/*---------------------------------------------------------------------
This file has been adapted from the implementation 
(available at, Public Domain https://github.com/pq-crystals/kyber) 
of "CRYSTALS – Kyber: a CCA-secure module-lattice-based KEM"
by : Joppe Bos, Leo Ducas, Eike Kiltz, Tancrede Lepoint, 
Vadim Lyubashevsky, John M. Schanck, Peter Schwabe & Damien stehle
----------------------------------------------------------------------*/

#include "api.h"
#include <stdint.h>
#include "params.h"

uint64_t load_littleendian(const unsigned char *x, int bytes)
{
  int i;
  uint64_t r = x[0];
  for(i=1;i<bytes;i++)
    r |= (uint64_t)x[i] << (8*i);
  return r;
}


void cbd(uint16_t *r, const unsigned char *buf)
{
	uint16_t Qmod_minus1=SABER_Q-1;
	uint16_t t,d, a[8], b[8];
	int i;

	for(i=0;i<SABER_N/8;i++)
	{
	    	t = load_littleendian(buf+2*i,2);
	    	//printf("\n%d----->%u",i,t);
		d = t;
	    	a[0] =  d & 0x1;
	    	b[0] = (d >> 1) & 0x1;
	    	a[1] = (d >> 2) & 0x1;
	    	b[1] = (d >> 3) & 0x1;
	    	a[2] = (d >> 4) & 0x1;
	    	b[2] = (d >> 5) & 0x1;
	    	a[3] = (d >> 6) & 0x1;
	    	b[3] = (d >> 7) & 0x1;
	    	a[4] = (d >> 8) & 0x1;
	    	b[4] = (d >> 9) & 0x1;
	    	a[5] = (d >> 10) & 0x1;
	    	b[5] = (d >> 11) & 0x1;
	    	a[6] = (d >> 12) & 0x1;
	    	b[6] = (d >> 13) & 0x1;
	    	a[7] = (d >> 14) & 0x1;
	    	b[7] = (d >> 15) & 0x1;

		/*for(j=0;j<8;j++)
		{
			printf("\na[%d]=%u",j,a[j]);
			printf("\nb[%d]=%u",j,b[j]);
		}*/



	    	r[8*i+0] = (uint16_t)(a[0]  - b[0]) & Qmod_minus1;
	    	r[8*i+1] = (uint16_t)(a[1]  - b[1]) & Qmod_minus1;
	    	r[8*i+2] = (uint16_t)(a[2]  - b[2]) & Qmod_minus1;
	    	r[8*i+3] = (uint16_t)(a[3]  - b[3]) & Qmod_minus1;
	    	r[8*i+4] = (uint16_t)(a[4]  - b[4]) & Qmod_minus1;
	    	r[8*i+5] = (uint16_t)(a[5]  - b[5]) & Qmod_minus1;
	    	r[8*i+6] = (uint16_t)(a[6]  - b[6]) & Qmod_minus1;
	    	r[8*i+7] = (uint16_t)(a[7]  - b[7]) & Qmod_minus1;

	  }

}
