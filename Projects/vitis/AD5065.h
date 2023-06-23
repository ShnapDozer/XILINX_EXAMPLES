#ifndef AD5065_H
#define AD5065_H

#include "xil_types.h"

#define UPDATE_BOTH_DAC_COMMAND 66060288 //66060288 = 001111110000000000000000 write and update both DACs

void setBothDacVoltage(UINTPTR addres, float voltage, float voltageRef);

#endif
