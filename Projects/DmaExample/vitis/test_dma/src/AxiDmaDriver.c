#include "AxiDmaDriver.h"

#include "xil_printf.h"

int setupDma(XScuGic *interruptController) {
    XAxiDma_Config *axiDmaConfig;

    axiDmaConfig = XAxiDma_LookupConfig(DMA_DEVICE_ID);
	if (!axiDmaConfig) {
		xil_printf("error - no config found for %d\r\n", DMA_DEVICE_ID);
		return XST_FAILURE;
	}

    int status;
	status = XAxiDma_CfgInitialize(&_axiDma, axiDmaConfig);
	if (status != XST_SUCCESS) {
		xil_printf("error - initialization dma failed %d\r\n", status);
		return XST_FAILURE;
	}

    if(XAxiDma_HasSg(&_axiDma)){
		xil_printf("error - dma device configured as SG mode \r\n");
		return XST_FAILURE;
	}

    status = XScuGic_Connect(interruptController, RX_INTR_ID, (XInterruptHandler)dmaRxIntrHandler, &_axiDma);
    if (status != XST_SUCCESS) {
		xil_printf("error - failed rx connect intc\r\n");
		return XST_FAILURE;
	}
    
    status = XScuGic_Connect(interruptController, TX_INTR_ID, (XInterruptHandler)dmaTxIntrHandler, &_axiDma);
    if (status != XST_SUCCESS) {
		xil_printf("error - failed tx connect intc\r\n");
		return XST_FAILURE;
	}

    XScuGic_Enable(interruptController, RX_INTR_ID);
	XScuGic_Enable(interruptController, TX_INTR_ID);

    XAxiDma_IntrDisable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE); // Disable all interrupts before setup
	XAxiDma_IntrDisable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

	XAxiDma_IntrEnable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DMA_TO_DEVICE); // Enable all interrupts
	XAxiDma_IntrEnable(&_axiDma, XAXIDMA_IRQ_ALL_MASK, XAXIDMA_DEVICE_TO_DMA);

    return XST_SUCCESS;
}

void dmaRxIntrHandler(void *callback) {
    XAxiDma *axiDmaInst = (XAxiDma*)callback;

    u32 irqStatus = XAxiDma_IntrGetIrq(axiDmaInst, XAXIDMA_DEVICE_TO_DMA); // Read pending interrupts
    XAxiDma_IntrAckIrq(axiDmaInst, irqStatus, XAXIDMA_DEVICE_TO_DMA); // Acknowledge pending interrupts

    if (!(irqStatus & XAXIDMA_IRQ_ALL_MASK)) { // If no interrupt is asserted, we do not do anything
		return;
	} else if ((irqStatus & XAXIDMA_IRQ_ERROR_MASK)) { // If error interrupt is asserted, reset the hardware to recover from the error, and return with no further processing
		xil_printf("error - dma rx\r\n");
        
        XAxiDma_Reset(axiDmaInst); // Reset should never fail for transmit channel

		int timeOut = RESET_TIMEOUT_COUNTER;
		while (timeOut) {
			if (XAxiDma_ResetIsDone(axiDmaInst)) {
				break;
			}

			timeOut -= 1;
		}

		return;
	} else if ((irqStatus & XAXIDMA_IRQ_IOC_MASK)) { // If Completion interrupt is asserted
		xil_printf("done - dma rx complete\r\n");
	}
}

void dmaTxIntrHandler(void *callback) {
    XAxiDma *axiDmaInst = (XAxiDma*)callback;

    u32 irqStatus = XAxiDma_IntrGetIrq(axiDmaInst, XAXIDMA_DMA_TO_DEVICE); // Read pending interrupts
    XAxiDma_IntrAckIrq(axiDmaInst, irqStatus, XAXIDMA_DMA_TO_DEVICE); // Acknowledge pending interrupts

    if (!(irqStatus & XAXIDMA_IRQ_ALL_MASK)) { // If no interrupt is asserted, we do not do anything
		return;
	} else if ((irqStatus & XAXIDMA_IRQ_ERROR_MASK)) { // If error interrupt is asserted, reset the hardware to recover from the error, and return with no further processing
		xil_printf("error - dma tx\r\n");
        
        XAxiDma_Reset(axiDmaInst); // Reset should never fail for transmit channel

		int timeOut = RESET_TIMEOUT_COUNTER;
		while (timeOut) {
			if (XAxiDma_ResetIsDone(axiDmaInst)) {
				break;
			}

			timeOut -= 1;
		}

		return;
	} else if ((irqStatus & XAXIDMA_IRQ_IOC_MASK)) { // If Completion interrupt is asserted
		xil_printf("done - dma tx complete\r\n");
	}
}

u32 checkDmaIdle(u32 baseAddres, u32 offset) {
    return (XAxiDma_ReadReg(baseAddres, offset) & XAXIDMA_IDLE_MASK);
}