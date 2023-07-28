#ifndef AXIVDMA_DRIVER_H
#define AXIVDMA_DRIVER_H

#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"

#include "xparameters.h"
#include "xscugic.h"
#include "xaxivdma.h"

#define VDMA_DEVICE_ID      XPAR_AXIVDMA_0_DEVICE_ID
#define INTC_DEVICE_ID		XPAR_SCUGIC_SINGLE_DEVICE_ID

//Frame size related constants
#define FRAME_HORIZONTAL_LEN  4096*2
#define FRAME_VERTICAL_LEN    64
#define NUMBER_OF_READ_FRAMES	3
#define NUMBER_OF_WRITE_FRAMES	3

#define AXIVDMA_WRITE_ENABLE

#ifdef AXIVDMA_WRITE_ENABLE
#define WRITE_INTR_ID		XPAR_FABRIC_AXI_VDMA_0_S2MM_INTROUT_INTR
#endif

#ifdef AXIVDMA_READ_ENABLE
#define READ_INTR_ID		XPAR_FABRIC_AXIVDMA_0_MM2S_INTROUT_VEC_ID
#endif

XAxiVdma _axiVdma;

void setupVdma(XScuGic *interruptController, UINTPTR writeBaseAddress, UINTPTR readBaseAddress);

int vdma_setupRead(XAxiVdma *instancePtr, UINTPTR readBaseAddress);
int vdma_setupWrite(XAxiVdma * instancePtr, UINTPTR writeBaseAddress);
int vdma_startTransfer(XAxiVdma *instancePtr);

void vdma_readCallBack(void *callbackRef, u32 mask);
void vdma_readErrorCallBack(void *callbackRef, u32 mask);
void vdma_writeCallBack(void *callbackRef, u32 mask);
void vdma_writeErrorCallBack(void *callbackRef, u32 mask);

void vdma_debugReportStatus(XAxiVdma *XVdmaPtr, u32 PixelWidthInBits);

#endif

