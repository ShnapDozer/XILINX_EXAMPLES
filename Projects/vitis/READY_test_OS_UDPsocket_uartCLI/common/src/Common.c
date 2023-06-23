#include "Common.h"

#include "xparameters.h"

#include "xil_exception.h"

#include "FreeRTOS.h"
#include "task.h"

XScuGic_Config* interruptConfig = NULL;

void setupInterruptSystem(XScuGic* interruptController) {
	int status = 0;

	interruptConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
	configASSERT(interruptConfig);
	configASSERT(interruptConfig->CpuBaseAddress == (configINTERRUPT_CONTROLLER_BASE_ADDRESS + configINTERRUPT_CONTROLLER_CPU_INTERFACE_OFFSET));
	configASSERT(interruptConfig->DistBaseAddress == configINTERRUPT_CONTROLLER_BASE_ADDRESS);

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
