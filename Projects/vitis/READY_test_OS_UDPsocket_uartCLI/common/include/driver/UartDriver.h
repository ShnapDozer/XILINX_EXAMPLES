#ifndef UART_DRIVER_H
#define UART_DRIVER_H

#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"

#include "xparameters.h"
#include "xscugic.h"
#include "xuartps.h"

#define UART_DEVICE_ID	XPAR_XUARTPS_0_DEVICE_ID
#define UART_INT_ID	XPAR_XUARTPS_1_INTR
#define serRECEIVE_INTERRUPT_MASK (XUARTPS_IXR_RXOVR | XUARTPS_IXR_RXFULL | XUARTPS_IXR_TOUT) 	// The UART interrupts of interest when receiving.
#define serTRANSMIT_IINTERRUPT_MASK ( XUARTPS_IXR_TXEMPTY ) 									// The UART interrupts of interest when transmitting.

extern XUartPs uartDevice;
extern SemaphoreHandle_t txComplete;
extern QueueHandle_t rxQueue;

extern void setupUart(uint32_t baudRate, UBaseType_t queueSize, XScuGic *interruptController);

extern void uartHandler(void *pvNotUsed);
extern BaseType_t uartGetChar(char *readBuffer, TickType_t maxDelay);
extern unsigned int uartGetLine(char *readBuffer, TickType_t maxDelay);
extern void uartPutString(const char * const writeBugffer, unsigned short bufferSize);

#endif

