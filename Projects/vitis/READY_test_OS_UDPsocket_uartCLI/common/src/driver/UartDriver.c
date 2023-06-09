#include "driver/UartDriver.h"

#include "xil_printf.h"
#include "xil_exception.h"

#include "xstatus.h"
#include "xscugic.h"
#include "xuartps.h"

XUartPs uartDevice;
SemaphoreHandle_t txComplete = NULL;
QueueHandle_t rxQueue = NULL;

void setupUart(uint32_t baudRate, UBaseType_t queueSize, XScuGic *interruptController) {
	BaseType_t status;
	XUartPs_Config *uartConfig;

	rxQueue = xQueueCreate(queueSize, sizeof(char));
	configASSERT(rxQueue);

	txComplete = xSemaphoreCreateBinary();
	configASSERT(txComplete);
	xSemaphoreTake(txComplete, 0);

	uartConfig = XUartPs_LookupConfig(UART_DEVICE_ID); // Initialize the UART driver so that it's ready to use Look up the configuration in the config table, then initialize it.
	configASSERT(uartConfig != NULL);

	status = XUartPs_CfgInitialize(&uartDevice, uartConfig, uartConfig->BaseAddress);
	configASSERT(status == XST_SUCCESS);
	(void)status;

	status = XUartPs_SelfTest(&uartDevice); // Check hardware build
	configASSERT(status == XST_SUCCESS);
	(void)status;

	status = XScuGic_Connect(interruptController, UART_INT_ID, (Xil_ExceptionHandler)XUartPs_InterruptHandler, (void *) &uartDevice);
	configASSERT(status == XST_SUCCESS);
	(void)status;


	XUartPs_WriteReg(uartConfig->BaseAddress, XUARTPS_ISR_OFFSET, XUARTPS_IXR_MASK ); // Ensure interrupts start clear.
	XScuGic_Enable(interruptController, UART_INT_ID); // Enable the interrupt for the device

	XUartPs_SetHandler(&uartDevice, (XUartPs_Handler)uartHandler, &uartDevice);// wtf this work

	u32 interruptMask = // Enable the interrupt of the UART so interrupts will occur, setup a local loopback so data that is sent will be received.
			XUARTPS_IXR_TOUT | XUARTPS_IXR_PARITY | XUARTPS_IXR_FRAMING |
			XUARTPS_IXR_OVER | XUARTPS_IXR_TXEMPTY | XUARTPS_IXR_RXFULL |
			XUARTPS_IXR_RXOVR;


	XUartPs_SetInterruptMask(&uartDevice, interruptMask);
	XUartPs_SetOperMode(&uartDevice, XUARTPS_OPER_MODE_NORMAL);
	XUartPs_SetBaudRate(&uartDevice, baudRate);
	XUartPs_SetRecvTimeout(&uartDevice, 8);
}

void uartHandler(void *pvNotUsed) {

	configASSERT(pvNotUsed == &uartDevice);

	extern unsigned int XUartPs_SendBuffer(XUartPs *InstancePtr);

	BaseType_t xHigherPriorityTaskWoken = pdFALSE;
	
	uint32_t ulActiveInterrupts;
	ulActiveInterrupts = XUartPs_ReadReg(XPAR_PS7_UART_1_BASEADDR,  XUARTPS_IMR_OFFSET); // Read the interrupt ID register to see which interrupt is active.
	ulActiveInterrupts &= XUartPs_ReadReg(XPAR_PS7_UART_1_BASEADDR,  XUARTPS_ISR_OFFSET);

	if((ulActiveInterrupts & serRECEIVE_INTERRUPT_MASK) != 0) { // Are any receive events of interest active?
		
		uint32_t ulChannelStatusRegister;
		ulChannelStatusRegister = XUartPs_ReadReg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_SR_OFFSET); // Read the Channel Status Register to determine if there is any data in the RX FIFO.
		while((ulChannelStatusRegister & XUARTPS_SR_RXEMPTY) == 0) { // Move data from the Rx FIFO to the Rx queue.
			char receiveChar;
			receiveChar = XUartPs_ReadReg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_FIFO_OFFSET);

			xQueueSendFromISR(rxQueue, &receiveChar, &xHigherPriorityTaskWoken);
			ulChannelStatusRegister = XUartPs_ReadReg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_SR_OFFSET);
		}
	}

	if((ulActiveInterrupts & serTRANSMIT_IINTERRUPT_MASK) != 0) // Are any transmit events of interest active?
	{
		if( uartDevice.SendBuffer.RemainingBytes == 0 )
		{
			xSemaphoreGiveFromISR( txComplete, &xHigherPriorityTaskWoken );

			XUartPs_WriteReg( XPAR_PS7_UART_1_BASEADDR, XUARTPS_IDR_OFFSET, XUARTPS_IXR_TXEMPTY ); // No more data to transmit.
		}
		else
		{
			XUartPs_SendBuffer(&uartDevice); // More data to send.
		}
	}

	portYIELD_FROM_ISR(xHigherPriorityTaskWoken); // will request a context switch if executing this handler caused a task to leave the blocked state
	XUartPs_WriteReg(XPAR_PS7_UART_1_BASEADDR, XUARTPS_ISR_OFFSET, ulActiveInterrupts); // Clear the interrupt status.

}

BaseType_t uartGetChar(char *readBuffer, TickType_t maxDelay) {
		BaseType_t status;

		status = xQueueReceive(rxQueue, readBuffer, maxDelay);
		return status;
}

unsigned int uartGetLine(char *readBuffer, TickType_t maxDelay) {
	BaseType_t status;

	char receiveByte;
	unsigned int receiveCount = 0;
	while(1) {
		status = xQueueReceive(rxQueue, &receiveByte, maxDelay);
		configASSERT(status);
		(void)status;

		if(receiveByte == 13) {
			break;
		} else {
			readBuffer[receiveCount++] = receiveByte;
		}

	}
		
	return receiveCount;
}

void uartPutString(const char * const writeBugffer, unsigned short bufferSize) {
		const TickType_t maxDelay = 200UL / portTICK_PERIOD_MS;

		XUartPs_Send(&uartDevice, (void *) writeBugffer, bufferSize);
		xSemaphoreTake(txComplete, maxDelay);
}

