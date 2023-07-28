#ifndef XADCDRIVER_H
#define XADCDRIVER_H

#include "xil_types.h"

#include "xadcps.h"
#include "xscugic.h"
#include "xparameters.h"

#include "FreeRTOS.h"
#include "portmacro.h"

#define XADC_DEVICE_ID XPAR_PS7_XADC_0_DEVICE_ID

XAdcPs xadcDevice;

void setupXadc();
void setupXadcWithInterrupt(XScuGic *interruptController);

void xadcInterruptHandler(void *pair);

float getAdcDataFromChannel(u8 addres);

#endif
