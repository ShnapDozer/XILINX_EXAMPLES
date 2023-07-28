#ifndef AXI_DMA_DRIVER_H
#define AXI_DMA_DRIVER_H

#include <stdbool.h>

#include "xaxidma.h"
#include "xscugic.h"
#include "xparameters.h"

#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"

#define DMA_DEVICE_ID 			XPAR_AXI_DMA_0_DEVICE_ID
#define DMA_DEVICE_BASEADD      XPAR_AXI_DMA_0_BASEADDR
#define INTC_DEVICE_ID			XPAR_SCUGIC_SINGLE_DEVICE_ID

#define RX_INTR_ID XPAR_FABRIC_AXIDMA_0_S2MM_INTROUT_VEC_ID
#define TX_INTR_ID XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID


#define RESET_TIMEOUT_COUNTER	10000 // Timeout loop counter for reset

SemaphoreHandle_t txDmaComplete;

XAxiDma _axiDma;

void setupDma(XScuGic *interruptController);
void dmaRxIntrHandler(void *callback);
void dmaTxIntrHandler(void *callback);
BaseType_t dmaStartTransfer(UINTPTR buffAddr, u32 length, int direction);
u32 dmaCheckIdle(u32 baseAddres, u32 offset);

#endif

