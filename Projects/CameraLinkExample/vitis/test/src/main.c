#include <stdbool.h>
#include <stddef.h>

#include "xil_printf.h"

#include "Common.h"
#include "driver/AxiDmaDriver.h"

#define NORMAL_TASK_PRIORITI 1
#define DMA_BUFF_SIZE 1024

TaskHandle_t readCameraTaskHandle;
void readCameraTask(void* arg) {
	xil_printf("start - readCamera\r\n");

	bool whichBuff = true;
	u32 *dmaWriteBuff;
	u32 *dmaRxBuffOne;
	u32 *dmaRxBuffTwo;

	dmaRxBuffOne = pvPortMalloc(sizeof(u32)*DMA_BUFF_SIZE);
	dmaRxBuffTwo = pvPortMalloc(sizeof(u32)*DMA_BUFF_SIZE);

	Xil_DCacheFlushRange((UINTPTR)dmaRxBuffOne, sizeof(u32)*DMA_BUFF_SIZE);
    Xil_DCacheFlushRange((UINTPTR)dmaRxBuffTwo, sizeof(u32)*DMA_BUFF_SIZE);

	BaseType_t status;
	dmaWriteBuff = whichBuff ? dmaRxBuffOne : dmaRxBuffTwo;
	for(;;) {
		status = dmaStartTransfer((UINTPTR)dmaWriteBuff, sizeof(u32)*DMA_BUFF_SIZE, XAXIDMA_DEVICE_TO_DMA);
//		MESSAGE_ASSERT((status == XST_SUCCESS), "error - start dmaStartTransfer");

		xSemaphoreTake(transferDmaComplete, portMAX_DELAY);
		if(transferDmaError) {
			xil_printf("error - dma transfer, return\r\n");
			setupDma(&xInterruptController);
		}

		for(int i = 0; i < DMA_BUFF_SIZE; ++i) {
			xil_printf("%d ", dmaWriteBuff[i]);
		}

		xil_printf("\r\n\r\n");

		whichBuff = !whichBuff;
		dmaWriteBuff = whichBuff ? dmaRxBuffOne : dmaRxBuffTwo;

		xSemaphoreGive(transferDmaComplete);
	}

}

int main() {
	xil_printf("\n\r\n\rstart - app\n\r");

	Xil_DCacheDisable();

	setupInterruptSystem(&xInterruptController);
	setupUart(&xInterruptController, 115200, 1000);
	setupDma(&xInterruptController);
	xil_printf("done - setup hardware\n\r");

	xTaskCreate(readCameraTask,
					(const char*) "readCameraTask",
					1024,
					NULL,
					NORMAL_TASK_PRIORITI,
					&readCameraTaskHandle);

	vTaskStartScheduler();

	for(;;){ }
	return 0;

}