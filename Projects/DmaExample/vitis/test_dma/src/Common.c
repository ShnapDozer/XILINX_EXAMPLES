#include "Common.h"

#include "xparameters.h"

#include "xil_exception.h"

XScuGic_Config* interruptConfig = NULL;

void setupInterruptSystem(XScuGic* interruptController) {
	int status = 0;

	interruptConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);

	status = XScuGic_CfgInitialize(interruptController, interruptConfig, interruptConfig->CpuBaseAddress);

	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, interruptController);
	Xil_ExceptionEnable();
}

void vAssertCalled(const char * pcFile, unsigned long ulLine) {

}
