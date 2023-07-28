//#ifndef AXI_DMA_DRIVER_H
//#define AXI_DMA_DRIVER_H
//
//#include <stdbool.h>
//
//#include "xil_types.h"
//
//#include "xaxidma.h"
//#include "xscugic.h"
//#include "xparameters.h"
//
//#include "FreeRTOS.h"
//#include "queue.h"
//#include "semphr.h"
//#include "portmacro.h"
//
//#define DMA_RX_ENABLE
//
//#define DMA_DEVICE_ID 			XPAR_AXIDMA_0_DEVICE_ID
//#define DMA_DEVICE_BASEADD      XPAR_AXIDMA_0_BASEADDR
//
//#ifdef DMA_RX_ENABLE
//#define RX_INTR_ID          XPAR_FABRIC_AXIDMA_0_VEC_ID
//#endif
//#ifdef DMA_TX_ENABLE
//#define TX_INTR_ID		    XPAR_FABRIC_AXIDMA_0_MM2S_INTROUT_VEC_ID
//#endif
//
//#define RESET_TIMEOUT_COUNTER   10000 // Timeout loop counter for reset
//
//SemaphoreHandle_t transferDmaComplete;
//bool transferDmaError;
//
//XAxiDma _axiDma;
//
//void setupDma(XScuGic *interruptController);
//BaseType_t dmaStartTransfer(UINTPTR buffAddr, u32 length, int direction);
//
//void dmaRxIntrHandler(void *callback);
//void dmaTxIntrHandler(void *callback);
//
//#endif
//
