#include <stdbool.h>
#include <stddef.h>

#include "xil_printf.h"
#include "xparameters.h"

#include "Common.h"
#include "driver/AxiVdmaDriver.h"
#include "driver/UartDriver.h"

#define NORMAL_TASK_PRIORITI 1
#define DMA_BUFF_SIZE 1024

#define WRITE_BASE_ADDR   (0x100000 + 0x01000000)

TaskHandle_t readCameraDataTaskHandle;
void readCameraDataTask(void* arg);

TaskHandle_t readCameraUartTaskHandle;
void readCameraUartTask(void* arg);

int main() {
	xil_printf("\n\r\n\rstart - app\n\r");

	Xil_DCacheDisable();

	setupInterruptSystem(&xInterruptController);
	setupUart(&xInterruptController, 115200, 1000);
	setupVtpg();
	setupVdma(&xInterruptController, WRITE_BASE_ADDR, NULL);
	xil_printf("done - setup hardware\n\r");

	xTaskCreate(readCameraDataTask,
					(const char*) "readCameraDataTask",
					DMA_BUFF_SIZE*10,
					NULL,
					NORMAL_TASK_PRIORITI,
					&readCameraDataTaskHandle);

	xTaskCreate(readCameraUartTask,
				(const char*) "readCameraDataTask",
				DMA_BUFF_SIZE,
				NULL,
				NORMAL_TASK_PRIORITI,
				&readCameraUartTaskHandle);

	vTaskStartScheduler();

	for(;;){ }
	return 0;

}

void readCameraDataTask(void* arg) {


	for(;;) {
		vdma_startTransfer(&_axiVdma);

		vdma_debugReportStatus(&_axiVdma, 8);

		u8 pixel;
		xil_printf("Frame:\n\r");
		for(int i = 0; i < FRAME_HORIZONTAL_LEN*FRAME_VERTICAL_LEN; ++i) {
			pixel = (u8)*(char*)(WRITE_BASE_ADDR + i);

			if(i % FRAME_HORIZONTAL_LEN == 0) {
				xil_printf("\n\r");
			}

			xil_printf("%d ", pixel);
		}
		xil_printf("\n\r");

	}
}

void readCameraUartTask(void* arg) {
	xil_printf("start - readCameraUartTask\r\n");

	char message[100] = "r PixelFormat\r";
	uartPutString(&message, 100);

	uartGetLine(&message, portMAX_DELAY);
	xil_printf("Read: %s \r\n", message);
	uartGetLine(&message, portMAX_DELAY);
	xil_printf("Read: %s \r\n", message);
	uartGetLine(&message, portMAX_DELAY);
	xil_printf("Read: %s \r\n", message);
	uartGetLine(&message, portMAX_DELAY);
	xil_printf("Read: %s \r\n", message);

	for(;;) {

	}
}