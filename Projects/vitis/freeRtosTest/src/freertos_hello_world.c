#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "timers.h"

#include "xil_printf.h"
#include "xparameters.h"

#include "AD5065.h"
#include "XADC.h"

#define DELAY_10_SECONDS	10000UL
#define DELAY_1_SECOND		1000UL
#define DELAY_001_SECOND	10UL

//static float getVoltageFromConsole(float voltageRef);
//static char input(char *buff, int size);

static void readVoltageTask(void *pvParameters);
static void printVoltageTask(void *pvParameters);
//static void setupVoltageTask(void *pvParameters);

static TaskHandle_t xReadVoltageTask;
static TaskHandle_t xPrintVoltageTask;
//static TaskHandle_t xSetupVoltageTask;

u16 currentVoltage;
float voltageRef = 2.5;

int main( void )
{
	xil_printf("Init sucsess!\r\n");

	xTaskCreate(readVoltageTask,
				(const char *) "readVoltageTask",
				configMINIMAL_STACK_SIZE,
				NULL,
				tskIDLE_PRIORITY,
				&xReadVoltageTask );

	xTaskCreate(printVoltageTask,
				(const char *) "printVoltageTask",
				configMINIMAL_STACK_SIZE,
				NULL,
				tskIDLE_PRIORITY,
				&xPrintVoltageTask );

//	xTaskCreate(setupVoltageTask,
//				(const char *) "setupVoltageTask",
//				configMINIMAL_STACK_SIZE,
//				NULL,
//				tskIDLE_PRIORITY,
//				&xSetupVoltageTask );


	vTaskStartScheduler();
	for( ;; );
}

static void readVoltageTask( void *pvParameters ) {
	const TickType_t x001second = pdMS_TO_TICKS(DELAY_001_SECOND);
	for( ;; ) {
		currentVoltage = convertToMv(getDataFromChannel(VPVN_CH));

		vTaskDelay(x001second);
	}
}

static void printVoltageTask(void *pvParameters) {
	const TickType_t x1second = pdMS_TO_TICKS(DELAY_1_SECOND);
	for( ;; ) {
		xil_printf("current voltage: %03dmv\n\r", currentVoltage);

		vTaskDelay(x1second);
	}
}

//static void setupVoltageTask(void *pvParameters) {
//	const TickType_t x10second = pdMS_TO_TICKS(DELAY_10_SECONDS);
//	for( ;; ) {
//		float voltage = getVoltageFromConsole(voltageRef);
//		setBothDacVoltage(XPAR_AD5065_DUAL_DAC_AXI_0_BASEADDR, voltage, voltageRef);
//
//		vTaskDelay(x10second);
//	}
//}
//
//static float getVoltageFromConsole(float voltageRef) {
//	print("Set DAC voltage level:\n");
//
//	const int size = 32;
//	char buff[size];
//	input(buff, size);
//
//	float voltage = atof(buff);
//
//	if (voltage < 0 || voltage > voltageRef) {
//		printf("Incorrect input value: %f\n", voltage);
//		printf("The value must be between 0 and %f\n", voltageRef);
//
//		voltage = 0;
//	} else	{
//		printf("The DAC voltage is ~ %f\n", voltage);
//	}
//
//	return voltage;
//
//}
//
//static char input(char *buff, int size) {
//	memset(buff, 0x00, size);
//
//	int i = 0;
//	char in;
//	while (1) {
//		in = XUartPs_RecvByte(XPAR_PS7_UART_1_BASEADDR); // reading from terminal
//
//		if (in == 13) {
//			break;
//		} else {
//			if (i < size) {
//				buff[i] = in;
//				i++;
//			} else if (i == size) {
//				xil_printf("\n The buffer is overflowing!!!\n");
//			}
//		}
//	}
//	return 0;
//}

