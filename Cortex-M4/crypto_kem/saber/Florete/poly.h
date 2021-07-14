/*---------------------------------------------------------------------
This file has been adapted from the implementation 
(available at, Public Domain https://github.com/pq-crystals/kyber) 
of "CRYSTALS – Kyber: a CCA-secure module-lattice-based KEM"
by : Joppe Bos, Leo Ducas, Eike Kiltz, Tancrede Lepoint, 
Vadim Lyubashevsky, John M. Schanck, Peter Schwabe & Damien stehle
----------------------------------------------------------------------*/

#ifndef POLY_H
#define POLY_H

#include <stdint.h>
#include "params.h"

typedef struct
{
  uint16_t coeffs[rlwr_N];
} poly;

void GenSecret(uint16_t *r,const unsigned char *seed);

#endif
