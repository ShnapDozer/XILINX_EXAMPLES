#include "driver/AxiDmaDriver.h"

#include "FreeRTOS.h"
#include "portmacro.h"

#include "xbasic_types.h"
#include "xil_printf.h"

#include "Common.h"

void setupDma(XScuGic *interruptController) {
	transferDmaComplete = xSemaphoreCreateBinary();
	MESSAGE_ASSERT((transferDmaComplete != NULL), "error - XAxiDma semaphore create binary");

	xSemaphoreTake(transferDmaComplete, 0);

    XAxiDma_Config *axiDmaConfig;
    axiDmaConfig = XAxiDma_LookupConfig(DMA_DEVICE_ID);
	MESSAGE_ASSERT((axiDmaConfig != NULL), "error - XAxiDma lookup config");

    BaseType_t status;
	status = XAxiDma_CfgInitialize(&_axiDma, axiDmaConfig);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiDma config initialize");

	MESSAGE_ASSERT((XAxiDma_HasSg(&_axiDma) == FALSE), "error - XAxiDma has sg");

	#ifdef DMA_RX_ENABLE

    status = XScuGic_Connect(interruptController, RX_INTR_ID, (XInterruptHandler)dmaRxIntrHandler, &_axiDma);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiDma XScuGic connect RX_INTR_ID");

	#endif

	#ifdef DMA_TX_ENABLE

    status = XScuGic_Connect(interruptController, TX_INTR_ID, (XInterruptHandler)dmaTxIntrHandler, &_axiDma);
	MESSAGE_ASSERT(status == XST_SUCCESS, "error - XAxiDma XScuGic connect TX_INTR_ID");
	
	#endif

	#ifdef DMA_RX_ENABLE
    XScuGic_Enable(interruptController, RX_INTR_ID);
	#endif

	#ifdef DMA_TX_ENABLE
	XScuGic_Enable(interruptController, TX_INTR_ID);
	#endif

    XAxiDma_IntrDisable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE); // Disable all interrupts before setup
	XAxiDma_IntrDisable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

	XAxiDma_IntrEnable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE); // Enable all interrupts
	XAxiDma_IntrEnable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

	xSemaphoreGive(transferDmaComplete);
}

void dmaRxIntrHandler(void *callback) {
    XAxiDma *axiDmaInst = (XAxiDma*)callback;

    u32 irqStatus = XAxiDma_IntrGetIrq(axiDmaInst, XAXIDMA_DEVICE_TO_DMA); // Read pending interrupts
    XAxiDma_IntrAckIrq(axiDmaInst, irqStatus, XAXIDMA_DEVICE_TO_DMA); // Acknowledge pending interrupts

    if (!(irqStatus & XAXIDMA_IRQ_ALL_MASK)) {

    	// If no interrupt is asserted, we do not do anything

	} else if ((irqStatus & XAXIDMA_IRQ_ERROR_MASK)) {

		transferDmaError = true;
		// If error interrupt is asserted, reset the hardware to recover from the error, and return with no further processing
        
        XAxiDma_Reset(axiDmaInst); // Reset should never fail for transmit channel

		int timeOut = RESET_TIMEOUT_COUNTER;
		while (timeOut) {
			if (XAxiDma_ResetIsDone(axiDmaInst)) {
				break;
			}

			timeOut -= 1;
		}

	} else if ((irqStatus & XAXIDMA_IRQ_IOC_MASK)) {

		// If Completion interrupt is asserted

	}

    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    xSemaphoreGiveFromISR(transferDmaComplete, xHigherPriorityTaskWoken);
}

void dmaTxIntrHandler(void *callback) {
    XAxiDma *axiDmaInst = (XAxiDma*)callback;

    u32 irqStatus = XAxiDma_IntrGetIrq(axiDmaInst, XAXIDMA_DMA_TO_DEVICE); // Read pending interrupts
    XAxiDma_IntrAckIrq(axiDmaInst, irqStatus, XAXIDMA_DMA_TO_DEVICE); // Acknowledge pending interrupts

    if (!(irqStatus & XAXIDMA_IRQ_ALL_MASK)) { // If no interrupt is asserted, we do not do anything

	} else if ((irqStatus & XAXIDMA_IRQ_ERROR_MASK)) { // If error interrupt is asserted, reset the hardware to recover from the error, and return with no further processing
		transferDmaError = true;
        
        XAxiDma_Reset(axiDmaInst); // Reset should never fail for transmit channel

		int timeOut = RESET_TIMEOUT_COUNTER;
		while (timeOut) {
			if (XAxiDma_ResetIsDone(axiDmaInst)) {
				break;
			}

			timeOut -= 1;
		}
	} else if ((irqStatus & XAXIDMA_IRQ_IOC_MASK)) { // If Completion interrupt is asserted
		xil_printf("done - dma tx complete\r\n");
	}

    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    xSemaphoreGiveFromISR(transferDmaComplete, xHigherPriorityTaskWoken);
}

BaseType_t dmaStartTransfer(UINTPTR buffAddr, u32 length,	int direction) {

	if((transferDmaComplete != NULL) && (xSemaphoreTake(transferDmaComplete, (TickType_t)10) == pdTRUE)) {
		transferDmaError = false;
		XAxiDma_SimpleTransfer(&_axiDma, buffAddr, length, direction);
		return XST_SUCCESS;
	}

	return XST_FAILURE;
}
