#include "driver/Ad5065Driver.h"

#include "xil_io.h"

void setBothDacVoltage(UINTPTR addres, float voltage, float voltageRef) {
	float voltageRelative = voltage / voltageRef;
	int voltageValue = (int)(65535*voltageRelative);

	// Multiply the value by 16 in order to compensate for the 4 LSB zeros
	Xil_Out32(addres, UPDATE_BOTH_DAC_COMMAND + 16*voltageValue);
}

