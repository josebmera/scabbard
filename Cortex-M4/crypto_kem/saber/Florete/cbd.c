/*---------------------------------------------------------------------
This file has been adapted from the implementation 
(available at, Public Domain https://github.com/pq-crystals/kyber) 
of "CRYSTALS – Kyber: a CCA-secure module-lattice-based KEM"
by : Joppe Bos, Leo Ducas, Eike Kiltz, Tancrede Lepoint, 
Vadim Lyubashevsky, John M. Schanck, Peter Schwabe & Damien stehle
----------------------------------------------------------------------*/
#include "api.h"
#include<stdint.h>
#include "params.h"
#include "cbd.h"

void cbd(uint16_t *r, const unsigned char *buf)
{
	uint16_t Qmod_minus1=rlwr_Q-1;
	uint16_t d, a[4], b[4];
	int i;

	for(i=0;i<rlwr_N/4;i++)
	{
		d = buf[i];
	    	a[0] =  d & 0x1;
	    	b[0] = (d >> 1) & 0x1;
	    	a[1] = (d >> 2) & 0x1;
	    	b[1] = (d >> 3) & 0x1;
	    	a[2] = (d >> 4) & 0x1;
	    	b[2] = (d >> 5) & 0x1;
	    	a[3] = (d >> 6) & 0x1;
	    	b[3] = (d >> 7) & 0x1;

	    	r[4*i+0] = (uint16_t)(a[0]  - b[0]) & Qmod_minus1;
	    	r[4*i+1] = (uint16_t)(a[1]  - b[1]) & Qmod_minus1;
	    	r[4*i+2] = (uint16_t)(a[2]  - b[2]) & Qmod_minus1;
	    	r[4*i+3] = (uint16_t)(a[3]  - b[3]) & Qmod_minus1;
	  }

}
