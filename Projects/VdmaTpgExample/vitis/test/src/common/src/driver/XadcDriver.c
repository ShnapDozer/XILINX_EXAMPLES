#include <driver/XadcDriver.h>

#include "xil_printf.h"

#include "Common.h"

void setupXadc() {

	XAdcPs_Config *config = XAdcPs_LookupConfig(XADC_DEVICE_ID);
	MESSAGE_ASSERT((config != NULL), "error - error - xadc lookup config");

	BaseType_t status;
	status = XAdcPs_CfgInitialize(&xadcDevice, config, config->BaseAddress);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - xadc config initialize");

	XAdcPs_SetSequencerMode(&xadcDevice, XADCPS_SEQ_MODE_SAFE); // mode for change settings

	XAdcPs_SetSeqChEnables(&xadcDevice, XADCPS_SEQ_CH_VPVN | XADCPS_SEQ_CH_AUX00 | XADCPS_SEQ_CH_AUX07);
	XAdcPs_SetSeqInputMode(&xadcDevice, XADCPS_SEQ_CH_AUX00 | XADCPS_SEQ_CH_AUX07);
	XAdcPs_SetAvg(&xadcDevice, XADCPS_AVG_16_SAMPLES);

	XAdcPs_SetSequencerMode(&xadcDevice, XADCPS_SEQ_MODE_CONTINPASS);
}

void setupXadcWithInterrupt(XScuGic *interruptController) {
	 setupXadc();

	 BaseType_t status;
	 status = XScuGic_Connect(interruptController, 61 ,(Xil_ExceptionHandler)xadcInterruptHandler, (void *)&xadcDevice);
	 MESSAGE_ASSERT((status == XST_SUCCESS), "error - xadc connect interrupt to controller");

	 XScuGic_SetPriorityTriggerType(interruptController, 61, 0xa0, 3);
}

void xadcInterruptHandler(void *pair) {
	u32 channelMask = XAdcPs_GetSeqChEnables(&xadcDevice);
	u32 channel = 0;

	if(channelMask == 0x00010000) {// only 4 channels are supported
		channel = 16;
	} else if(channelMask == 0x00020000) {
		channel = 17;
	} else if(channelMask == 0x00040000) {
		channel = 18;
	} else if(channelMask == 0x00080000) {
		channel = 19;
	} else {
		return;
	}
}

float getAdcDataFromChannel(u8 channelAddres) {
	return XAdcPs_RawToVoltage(XAdcPs_GetAdcData(&xadcDevice, channelAddres));
}
