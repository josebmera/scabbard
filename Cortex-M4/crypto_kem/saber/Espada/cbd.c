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

uint16_t load_littleendian(const unsigned char *x, int bytes)
{
  int i;
  uint16_t r = x[0];
  for(i=1;i<bytes;i++)
    r |= (uint16_t)x[i] << (8*i);
  return r;
}


void cbd(uint16_t *r, const unsigned char *buf)
{
	uint32_t t,d;
	uint16_t a[4], b[4];
  	int i,j;

  	for(i=0;i<mlwr_N/4;i++)
  	{
	    	t = load_littleendian(buf+3*i,3);
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

	    	r[4*i+0] = (a[0]  - b[0]);
	    	r[4*i+1] = (a[1]  - b[1]);
	    	r[4*i+2] = (a[2]  - b[2]);
	    	r[4*i+3] = (a[3]  - b[3]);

  	}
	
}
