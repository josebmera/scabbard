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
#include "mlwr_params.h"

typedef struct
{
  uint16_t coeffs[mlwr_N];
} poly;

typedef struct{
  poly vec[mlwr_K];
} polyvec;

void GenSecret(uint16_t r[mlwr_K][mlwr_N],const unsigned char *seed);

#endif
