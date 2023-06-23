#include "Common.h"

#include <limits.h>

#include "xparameters.h"
#include "xil_exception.h"

XScuGic_Config* interruptConfig = NULL;

void setupInterruptSystem(XScuGic* interruptController) {
	interruptConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	configASSERT(interruptConfig);
	configASSERT(interruptConfig->CpuBaseAddress == (configINTERRUPT_CONTROLLER_BASE_ADDRESS + configINTERRUPT_CONTROLLER_CPU_INTERFACE_OFFSET));
	configASSERT(interruptConfig->DistBaseAddress == configINTERRUPT_CONTROLLER_BASE_ADDRESS);

	BaseType_t status;
	status = XScuGic_CfgInitialize(interruptController, interruptConfig, interruptConfig->CpuBaseAddress);
	configASSERT(status == XST_SUCCESS);

	vPortInstallFreeRTOSVectorTable();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, interruptController);
	Xil_ExceptionEnable();
}

void vAssertCalled(const char * pcFile, unsigned long ulLine) {
	volatile unsigned long ul = 0;

	(void) pcFile;
	(void) ulLine;

	taskENTER_CRITICAL();
	{
		while(ul == 0) { // Set ul to a non-zero value using the debugger to step out of this function.
			portNOP();
		}
	}
	taskEXIT_CRITICAL();
}

void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName)
{
	(void) pcTaskName;
	(void) pxTask;

	/* Run time stack overflow checking is performed if configCHECK_FOR_STACK_OVERFLOW is defined to 1 or 2.  
    This hook function is called if a stack overflow is detected. */
	taskDISABLE_INTERRUPTS();
	for(;;);
}

void vApplicationIdleHook(void)
{
    volatile size_t xFreeHeapSpace, xMinimumEverFreeHeapSpace;

	/* This is just a trivial example of an idle hook.  It is called on each cycle of the idle task.  It must *NOT* attempt to block.  In this case the
	idle task just queries the amount of FreeRTOS heap that remains.  See the memory management section on the http://www.FreeRTOS.org web site for memory
	management options.  If there is a lot of heap memory free then the	configTOTAL_HEAP_SIZE value in FreeRTOSConfig.h can be reduced to free up RAM. */
	xFreeHeapSpace = xPortGetFreeHeapSize();
	xMinimumEverFreeHeapSpace = xPortGetMinimumEverFreeHeapSize();

	(void) xFreeHeapSpace; // Remove compiler warning about xFreeHeapSpace being set but never used. 
	(void) xMinimumEverFreeHeapSpace;
}

void vApplicationTickHook(void) {
	#if(mainSELECTED_APPLICATION == 1)
	{
		/* The full demo includes a software timer demo/test that requires
		prodding periodically from the tick interrupt. */
		vTimerPeriodicISRTests();

		/* Call the periodic queue overwrite from ISR demo. */
		vQueueOverwritePeriodicISRDemo();

		/* Call the periodic event group from ISR demo. */
		vPeriodicEventGroupsProcessing();

		/* Use task notifications from an interrupt. */
		xNotifyTaskFromISR();

		/* Use mutexes from interrupts. */
		vInterruptSemaphorePeriodicTest();

		/* Writes to stream buffer byte by byte to test the stream buffer trigger
		level functionality. */
		vPeriodicStreamBufferProcessing();

		/* Writes a string to a string buffer four bytes at a time to demonstrate
		a stream being sent from an interrupt to a task. */
		vBasicStreamBufferSendFromISR();

		#if(configUSE_QUEUE_SETS == 1)
		{
			vQueueSetAccessQueueSetFromISR();
		}
		#endif

		/* Test flop alignment in interrupts - calling printf from an interrupt
		is BAD! */
		#if(configASSERT_DEFINED == 1)
		{
		char cBuf[ 20 ];
		UBaseType_t uxSavedInterruptStatus;

			uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
			{
				sprintf(cBuf, "%1.3f", 1.234);
			}
			portCLEAR_INTERRUPT_MASK_FROM_ISR(uxSavedInterruptStatus);

			configASSERT(strcmp(cBuf, "1.234") == 0);
		}
		#endif /* configASSERT_DEFINED */
	}
	#endif
}

void vApplicationMallocFailedHook(void) {
	/* Called if a call to pvPortMalloc() fails because there is insufficient free memory available in the FreeRTOS heap.  pvPortMalloc() is called
	internally by FreeRTOS API functions that create tasks, queues, software timers, and semaphores.  The size of the FreeRTOS heap is set by the
	configTOTAL_HEAP_SIZE configuration constant in FreeRTOSConfig.h. */
	taskDISABLE_INTERRUPTS();
	for(;;);
}

void *memcpy(void *pvDest, const void *pvSource, size_t xBytes) { // The compiler used during development seems to err unless these volatiles are	included at -O3 optimisation.  
	volatile unsigned char *pcDest = (volatile unsigned char *) pvDest, *pcSource = (volatile unsigned char *) pvSource;
	size_t x;

	if(pvDest != pvSource) {// Extremely crude standard library implementations in lieu of having a C library. 
		for(x = 0; x < xBytes; x++) {
			pcDest[ x ] = pcSource[ x ];
		}
	}

	return pvDest;
}

void *memset(void *pvDest, int iValue, size_t xBytes) { // The compiler used during development seems to err unless these volatiles are	included at -O3 optimisation.  
	volatile unsigned char * volatile pcDest = (volatile unsigned char * volatile) pvDest;
	volatile size_t x;

	for(x = 0; x < xBytes; x++) {// Extremely crude standard library implementations in lieu of having a C library. 
		pcDest[ x ] = (unsigned char) iValue;
	}

	return pvDest;
}

int memcmp(const void *pvMem1, const void *pvMem2, size_t xBytes) {
	const volatile unsigned char *pucMem1 = pvMem1, *pucMem2 = pvMem2;
	volatile size_t x;

	/* Extremely crude standard library implementations in lieu of having a C
	library. */
	for(x = 0; x < xBytes; x++)
	{
		if(pucMem1[ x ] != pucMem2[ x ])
		{
			break;
		}
	}

	return xBytes - x;
}

void vInitialiseTimerForRunTimeStats(void) {
	XScuWdt_Config *pxWatchDogInstance;
	pxWatchDogInstance = XScuWdt_LookupConfig(XPAR_SCUWDT_0_DEVICE_ID);
	XScuWdt_CfgInitialize(&xWatchDogInstance, pxWatchDogInstance, pxWatchDogInstance->BaseAddr);

	uint32_t ulValue;
	const uint32_t ulMaxDivisor = 0xff;
	const uint32_t ulDivisorShift = 0x08;
	ulValue = XScuWdt_GetControlReg(&xWatchDogInstance);
	ulValue |= ulMaxDivisor << ulDivisorShift;
	XScuWdt_SetControlReg(&xWatchDogInstance, ulValue);

	XScuWdt_LoadWdt(&xWatchDogInstance, UINT_MAX);
	XScuWdt_SetTimerMode(&xWatchDogInstance);
	XScuWdt_Start(&xWatchDogInstance);
}
