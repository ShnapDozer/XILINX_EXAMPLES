#include <unistd.h>
#include <stdlib.h>

#include "FreeRTOS.h"
#include "task.h"

#include "xil_cache.h"
#include "xil_printf.h"

#include "driver/NetworkDriver.h"
#include "driver/UartDriver.h"

#include "Common.h"
#include "CLI.h"

#define NORMAL_TASK_PRIORITI 1
#define UART_QUEUE_SIZE 10

void networkThread();

void printTask();
TaskHandle_t printTaskHandle;

void uartCliTask();
TaskHandle_t uartCliTaskHandle;


void testCommand(char* args) {
	char * arg = strtok (args," ");

	while(arg != NULL) {
		xil_printf("testCommand - %s \r\n", arg);
		arg = strtok (NULL, " ");
	}
}

extern XScuGic xInterruptController;

int main() {

	xil_printf("\n\r\n\rstart - app\n\r");
	Xil_DCacheDisable();

	setupInterruptSystem(&xInterruptController);
	setupUart(115200, UART_QUEUE_SIZE, &xInterruptController);

	addCommand("testCommand", (cmdCallBackPtr) testCommand);

	sys_thread_new("udpNetworkThread",
				(void(*)(void*))networkThread,
				NULL,
				THREAD_STACKSIZE,
				DEFAULT_THREAD_PRIO);

	xTaskCreate(uartCliTask,
				(const char*) "uartCliTask",
				configMINIMAL_STACK_SIZE,
				NULL,
				NORMAL_TASK_PRIORITI,
				&uartCliTaskHandle);

//	xTaskCreate(printTask,
//			(const char*) "PrintTask",
//			configMINIMAL_STACK_SIZE,
//			NULL,
//			NORMAL_TASK_PRIORITI,
//			&printTaskHandle);

	vTaskStartScheduler();

	for(;;){ }
	return 0;
}

void networkThread() {
	xil_printf("start - networkThread\r\n");
	setupNetwork();

	udpSocketApp(5001, 1000);
}

void uartCliTask() {
	xil_printf("start - uartCliTask\r\n");
	char readBuffer [100];

	for(;;) {
		xil_printf("\n->\r");
		uartGetLine(readBuffer, portMAX_DELAY);
		findCommand(readBuffer);
		vTaskDelay(100);
	}


}

void printTask(void*pvParameters) {
	xil_printf("start - printTask\r\n");

	unsigned int counter = 0;

	for(;;) {
		xil_printf("%d\n\r", counter++);

		vTaskDelay(100);
	}
}



