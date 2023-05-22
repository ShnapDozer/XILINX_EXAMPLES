#include <stdio.h>
#include <stdlib.h>
#include <sleep.h>

#include "platform.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xil_printf.h"

#include "AD5065.h"
#include "XADC.h"

float getVoltageFromConsole(float voltageRef);
char input(char *buff, int size);


int main() {
	float voltageRef = 2.5;

	init_platform();

	while(1) {

		float voltage = getVoltageFromConsole(voltageRef);
		setBothDacVoltage(XPAR_AD5065_DUAL_DAC_AXI_0_BASEADDR, voltage, voltageRef);
		usleep(100000);

		xil_printf("data: %03dmv\n\r", convertToMv(getDataFromChannel(VPVN_CH)));
		xil_printf("data0: %03dmv\n\r", convertToMv(getDataFromChannel(VAUX0_CH)));
		xil_printf("data8: %03dmv\n\r", convertToMv(getDataFromChannel(VAUX8_CH)));
	}

	cleanup_platform();
	return 0;
}

float getVoltageFromConsole(float voltageRef) {
	print("Set DAC voltage level:\n");

	const int size = 32;
	char buff[size];
	input(buff, size);

	float voltage = atof(buff);

	if (voltage < 0 || voltage > voltageRef) {
		printf("Incorrect input value: %f\n", voltage);
		printf("The value must be between 0 and %f\n", voltageRef);

		voltage = 0;
	} else	{
		printf("The DAC voltage is ~ %f\n", voltage);
	}

	return voltage;

}

char input(char *buff, int size) {
	memset(buff, 0x00, size);

	int i = 0;
	char in;
	while (1) {
		in = XUartPs_RecvByte(XPAR_PS7_UART_1_BASEADDR); // reading from terminal

		if (in == 13) {
			break;
		} else {
			if (i < size) {
				buff[i] = in;
				i++;
			} else if (i == size) {
				xil_printf("\n The buffer is overflowing!!!\n");
			}
		}
	}
	return 0;
}
