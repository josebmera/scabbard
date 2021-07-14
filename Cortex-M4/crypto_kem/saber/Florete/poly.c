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



void GenSecret(uint16_t r[rlwr_N],const unsigned char *seed){

		int32_t buf_size= rlwr_MU*rlwr_N/8;

		uint8_t buf[buf_size];

		shake128(buf, buf_size, seed,rlwr_NOISESEEDBYTES);

		cbd(r,buf);
}
