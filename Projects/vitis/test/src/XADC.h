
#ifndef XADC_H
#define XADC_H

#include "xil_types.h"

#define VPVN_CH 	(XPAR_XADC_WIZ_0_BASEADDR + 0x20C)
#define VAUX0_CH 	(XPAR_XADC_WIZ_0_BASEADDR + 0x240)
#define VAUX8_CH 	(XPAR_XADC_WIZ_0_BASEADDR + 0x260)

#define CONVERION_COEF_MV 0.015

u16 convertToMv(u16 data);
u16 getDataFromChannel(UINTPTR addres);

#endif
