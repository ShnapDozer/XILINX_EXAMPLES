#include "driver/XADC.h"

#include "xil_io.h"

u16 convertToMv(u16 data) {
	return data * CONVERION_COEF_MV;
}

u16 getDataFromChannel(UINTPTR addres) {
	return Xil_In32(addres);
}
