#include "Common.h"

#include <limits.h>

#include <stdint.h>
#include <stdbool.h>

#include "xparameters.h"
#include "xil_exception.h"

XScuGic_Config* interruptConfig = NULL;

unsigned short _crc16LookupTable[] = {
	0x0000, 0xC0C1, 0xC181, 0x0140, 0xC301, 0x03C0, 0x0280, 0xC241,
	0xC601, 0x06C0, 0x0780, 0xC741, 0x0500, 0xC5C1, 0xC481, 0x0440,
	0xCC01, 0x0CC0, 0x0D80, 0xCD41, 0x0F00, 0xCFC1, 0xCE81, 0x0E40,
	0x0A00, 0xCAC1, 0xCB81, 0x0B40, 0xC901, 0x09C0, 0x0880, 0xC841,
	0xD801, 0x18C0, 0x1980, 0xD941, 0x1B00, 0xDBC1, 0xDA81, 0x1A40,
	0x1E00, 0xDEC1, 0xDF81, 0x1F40, 0xDD01, 0x1DC0, 0x1C80, 0xDC41,
	0x1400, 0xD4C1, 0xD581, 0x1540, 0xD701, 0x17C0, 0x1680, 0xD641,
	0xD201, 0x12C0, 0x1380, 0xD341, 0x1100, 0xD1C1, 0xD081, 0x1040,
	0xF001, 0x30C0, 0x3180, 0xF141, 0x3300, 0xF3C1, 0xF281, 0x3240,
	0x3600, 0xF6C1, 0xF781, 0x3740, 0xF501, 0x35C0, 0x3480, 0xF441,
	0x3C00, 0xFCC1, 0xFD81, 0x3D40, 0xFF01, 0x3FC0, 0x3E80, 0xFE41,
	0xFA01, 0x3AC0, 0x3B80, 0xFB41, 0x3900, 0xF9C1, 0xF881, 0x3840,
	0x2800, 0xE8C1, 0xE981, 0x2940, 0xEB01, 0x2BC0, 0x2A80, 0xEA41,
	0xEE01, 0x2EC0, 0x2F80, 0xEF41, 0x2D00, 0xEDC1, 0xEC81, 0x2C40,
	0xE401, 0x24C0, 0x2580, 0xE541, 0x2700, 0xE7C1, 0xE681, 0x2640,
	0x2200, 0xE2C1, 0xE381, 0x2340, 0xE101, 0x21C0, 0x2080, 0xE041,
	0xA001, 0x60C0, 0x6180, 0xA141, 0x6300, 0xA3C1, 0xA281, 0x6240,
	0x6600, 0xA6C1, 0xA781, 0x6740, 0xA501, 0x65C0, 0x6480, 0xA441,
	0x6C00, 0xACC1, 0xAD81, 0x6D40, 0xAF01, 0x6FC0, 0x6E80, 0xAE41,
	0xAA01, 0x6AC0, 0x6B80, 0xAB41, 0x6900, 0xA9C1, 0xA881, 0x6840,
	0x7800, 0xB8C1, 0xB981, 0x7940, 0xBB01, 0x7BC0, 0x7A80, 0xBA41,
	0xBE01, 0x7EC0, 0x7F80, 0xBF41, 0x7D00, 0xBDC1, 0xBC81, 0x7C40,
	0xB401, 0x74C0, 0x7580, 0xB541, 0x7700, 0xB7C1, 0xB681, 0x7640,
	0x7200, 0xB2C1, 0xB381, 0x7340, 0xB101, 0x71C0, 0x7080, 0xB041,
	0x5000, 0x90C1, 0x9181, 0x5140, 0x9301, 0x53C0, 0x5280, 0x9241,
	0x9601, 0x56C0, 0x5780, 0x9741, 0x5500, 0x95C1, 0x9481, 0x5440,
	0x9C01, 0x5CC0, 0x5D80, 0x9D41, 0x5F00, 0x9FC1, 0x9E81, 0x5E40,
	0x5A00, 0x9AC1, 0x9B81, 0x5B40, 0x9901, 0x59C0, 0x5880, 0x9841,
	0x8801, 0x48C0, 0x4980, 0x8941, 0x4B00, 0x8BC1, 0x8A81, 0x4A40,
	0x4E00, 0x8EC1, 0x8F81, 0x4F40, 0x8D01, 0x4DC0, 0x4C80, 0x8C41,
	0x4400, 0x84C1, 0x8581, 0x4540, 0x8701, 0x47C0, 0x4680, 0x8641,
	0x8201, 0x42C0, 0x4380, 0x8341, 0x4100, 0x81C1, 0x8081, 0x4040
};

void setupInterruptSystem(XScuGic* interruptController) {
	interruptConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	MESSAGE_ASSERT((interruptConfig != NULL), "error - XScuGic lookup config");
	MESSAGE_ASSERT((interruptConfig->CpuBaseAddress == (configINTERRUPT_CONTROLLER_BASE_ADDRESS + configINTERRUPT_CONTROLLER_CPU_INTERFACE_OFFSET)), "error - XScuGic CpuBaseAddress != defines");
	MESSAGE_ASSERT((interruptConfig->DistBaseAddress == configINTERRUPT_CONTROLLER_BASE_ADDRESS), "error - XScuGic DistBaseAddress != defines");

	BaseType_t status;
	status = XScuGic_CfgInitialize(interruptController, interruptConfig, interruptConfig->CpuBaseAddress);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XScuGic config initialize");

	vPortInstallFreeRTOSVectorTable();

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, interruptController);
	Xil_ExceptionEnable();
}

crc16 getCrcValue(const char* data, size_t dataSize) {
	crc16 crcValue = 0xFFFF;

	for(int i = 0; i < dataSize; ++i) {
		unsigned char index;
		index = (unsigned char)crcValue ^ data[i];

		crcValue = (crcValue >> 8) & 0x00FF;
		crcValue ^= _crc16LookupTable[index];
	}

	return crcValue;
}

void messageAssertCalled(const char *fileName, unsigned long lineNumber, const char *assertMessage) {
	
	volatile const char *localFileName = fileName; 
	volatile uint32_t localLineNumber = lineNumber; 
	volatile const char *localAssertMessage = assertMessage; 

	(void) localFileName;
	(void) localLineNumber;
	(void) localAssertMessage;

	xil_printf("assert - message: %s\r\n file %s, line %lu\r\n", localAssertMessage, localFileName, localLineNumber);

	volatile uint32_t ul = 0;
	taskENTER_CRITICAL();
	{
		while(ul == 0)
		{
			__asm volatile("NOP");
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



void setupVtpg() {
    XV_tpg_Initialize(&_testPatternGenerator, XPAR_V_TPG_0_DEVICE_ID);

    XV_tpg_Set_width(&_testPatternGenerator, 4096);
    XV_tpg_Set_height(&_testPatternGenerator, 64);

    XV_tpg_Set_ZplateHorContDelta(&_testPatternGenerator, 2);
    XV_tpg_Set_ZplateHorContStart(&_testPatternGenerator, 2);
    XV_tpg_Set_ZplateVerContDelta(&_testPatternGenerator, 2);
    XV_tpg_Set_ZplateVerContStart(&_testPatternGenerator, 2);

    XV_tpg_Set_motionSpeed(&_testPatternGenerator, 2);
    XV_tpg_Set_motionEn(&_testPatternGenerator, 1);

    XV_tpg_EnableAutoRestart(&_testPatternGenerator);
    XV_tpg_Start(&_testPatternGenerator);

    XV_tpg_Set_bckgndId(&_testPatternGenerator, 1);

}