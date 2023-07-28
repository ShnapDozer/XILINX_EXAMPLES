#include "driver/AxiVdmaDriver.h"

#include "xil_exception.h"
#include "xil_printf.h"

#include "Common.h"

int readDone;
int readError;
int writeDone;
int writeError;

void setupVdma(XScuGic *interruptController, UINTPTR writeBaseAddress, UINTPTR readBaseAddress) 
{
    
    XAxiVdma_Config *axiVdmaConfig = XAxiVdma_LookupConfig(VDMA_DEVICE_ID);
    MESSAGE_ASSERT((axiVdmaConfig != NULL), "error - no video DMA found for ID");

    BaseType_t status;
    status = XAxiVdma_CfgInitialize(&_axiVdma, axiVdmaConfig, axiVdmaConfig->BaseAddress);
    MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma configuration Initialization failed");

	#ifdef AXIVDMA_READ_ENABLE
    status = vdma_setupRead(&_axiVdma, readBaseAddress); // Setup your video IP that reads from the memory. Setup the read channel
    if (status != XST_SUCCESS) {
        xil_printf( "Read channel setup failed %d\r\n", status);
        if(status == XST_VDMA_MISMATCH_ERROR) {
            xil_printf("DMA Mismatch Error\r\n");
        }
        return;
    }
	#endif

	#ifdef AXIVDMA_WRITE_ENABLE
    status = vdma_setupWrite(&_axiVdma, writeBaseAddress); // Setup your video IP that writes to the memory. Setup the write channel
    if (status != XST_SUCCESS) {
        xil_printf("error - XAxiVdma write channel setup failed %d\r\n", status);
        if(status == XST_VDMA_MISMATCH_ERROR) {
            xil_printf("error - XAxiVdma mismatch Error\r\n");
        }
        return;
    }
	#endif

	#ifdef AXIVDMA_READ_ENABLE
    XScuGic_SetPriorityTriggerType(interruptController, READ_INTR_ID, 0xA0, 0x3);
	#endif

	#ifdef AXIVDMA_WRITE_ENABLE
    XScuGic_SetPriorityTriggerType(interruptController, WRITE_INTR_ID, 0xA0, 0x3);
	#endif

	#ifdef AXIVDMA_READ_ENABLE
    status = XScuGic_Connect(interruptController, READ_INTR_ID, (Xil_InterruptHandler)XAxiVdma_ReadIntrHandler, &_axiVdma);
    MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma XScuGic_Connect read interrupt");

	XScuGic_Enable(interruptController, READ_INTR_ID);
	#endif

	#ifdef AXIVDMA_WRITE_ENABLE
    status = XScuGic_Connect(interruptController, WRITE_INTR_ID, (Xil_InterruptHandler)XAxiVdma_WriteIntrHandler, &_axiVdma);
    MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma XScuGic_Connect write interrupt");

	XScuGic_Enable(interruptController, WRITE_INTR_ID);
	#endif

	
	#ifdef AXIVDMA_READ_ENABLE
    XAxiVdma_SetCallBack(&_axiVdma, XAXIVDMA_HANDLER_GENERAL, vdma_readCallBack, (void *)&_axiVdma, XAXIVDMA_READ);
    XAxiVdma_SetCallBack(&_axiVdma, XAXIVDMA_HANDLER_ERROR, vdma_readErrorCallBack, (void *)&_axiVdma, XAXIVDMA_READ);
	#endif

	#ifdef AXIVDMA_WRITE_ENABLE
    XAxiVdma_SetCallBack(&_axiVdma, XAXIVDMA_HANDLER_GENERAL, vdma_writeCallBack, (void *)&_axiVdma, XAXIVDMA_WRITE);
    XAxiVdma_SetCallBack(&_axiVdma, XAXIVDMA_HANDLER_ERROR, vdma_writeErrorCallBack, (void *)&_axiVdma, XAXIVDMA_WRITE);
	#endif

	#ifdef AXIVDMA_READ_ENABLE
    XAxiVdma_IntrEnable(&_axiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_READ);
	#endif

	#ifdef AXIVDMA_WRITE_ENABLE
    XAxiVdma_IntrEnable(&_axiVdma, XAXIVDMA_IXR_ALL_MASK, XAXIVDMA_WRITE);
	#endif


}

void vdma_readCallBack(void *callbackRef, u32 mask)
{
	if (mask & XAXIVDMA_IXR_FRMCNT_MASK) {
		readDone += 1;
	}
}

void vdma_readErrorCallBack(void *callbackRef, u32 mask)
{
	if (mask & XAXIVDMA_IXR_ERROR_MASK) {
		readError += 1;
	}
}


void vdma_writeCallBack(void *callbackRef, u32 mask)
{
	if (mask & XAXIVDMA_IXR_FRMCNT_MASK) {
		writeDone += 1;
	}
}


void vdma_writeErrorCallBack(void *callbackRef, u32 mask)
{
	if (mask & XAXIVDMA_IXR_ERROR_MASK) {
		writeError += 1;
	}
}

#ifdef AXIVDMA_READ_ENABLE
int vdma_setupRead(XAxiVdma *instancePtr, , UINTPTR readBaseAddress)
{
    XAxiVdma_DmaSetup readConfig;

	readConfig.VertSizeInput = FRAME_HORIZONTAL_LEN;
	readConfig.HoriSizeInput = FRAME_HORIZONTAL_LEN;
	readConfig.Stride = FRAME_HORIZONTAL_LEN;
	readConfig.FrameDelay = 0;  /* This example does not test frame delay */
	readConfig.EnableCircularBuf = 1;
	readConfig.EnableSync = 0;  /* No Gen-Lock */
	readConfig.PointNum = 0;    /* No Gen-Lock */
	readConfig.EnableFrameCounter = 0; /* Endless transfers */
	readConfig.FixedFrameStoreAddr = 0; /* We are not doing parking */

    BaseType_t status;
	status = XAxiVdma_DmaConfig(instancePtr, XAXIVDMA_READ, &readConfig);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma read channel config failed");

	UINTPTR address = readBaseAddress; // Initialize buffer addresses. These addresses are physical addresses
	for(int i = 0; i < NUMBER_OF_READ_FRAMES; i++) {
		readConfig.FrameStoreStartAddr[i] = address;

		address += FRAME_HORIZONTAL_LEN * FRAME_VERTICAL_LEN;
	}

	status = XAxiVdma_DmaSetBufferAddr(instancePtr, XAXIVDMA_READ, readConfig.FrameStoreStartAddr); // Set the buffer addresses for transfer in the DMA engine. The buffer addresses are physical addresses
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma read channel set buffer address failed");

	return XST_SUCCESS;
}
#endif

// 1_0100_1000_0001_0000
// 1_0000_1000_0001_0000
// 1_1101_0000_1001_0000
// 1_0000_1000_0001_0000 

// 10111000010001011
// 1_0111_0001_0000_1011
// 1_1111_0000_0000_1011

#ifdef AXIVDMA_WRITE_ENABLE
int vdma_setupWrite(XAxiVdma * instancePtr, UINTPTR writeBaseAddress)
{
    XAxiVdma_DmaSetup writeConfig;

	memset(&writeConfig, 0, sizeof(XAxiVdma_DmaSetup));

	writeConfig.VertSizeInput = FRAME_VERTICAL_LEN;
	writeConfig.HoriSizeInput = FRAME_HORIZONTAL_LEN;
	writeConfig.Stride = FRAME_HORIZONTAL_LEN;

	writeConfig.FrameDelay = 0;  // This example does not test frame delay

	writeConfig.EnableCircularBuf = 1;
	writeConfig.EnableSync = 1; // No Gen-Lock

	writeConfig.PointNum = 0;	// Master we synchronize with -> vdma instance being worked with
	writeConfig.EnableFrameCounter = 0; // Endless transfers

	writeConfig.FixedFrameStoreAddr = 0; // We are not doing parking
	writeConfig.GenLockRepeat = 0; // Do not repeat previous frame on frame errors

    BaseType_t status;
	status = XAxiVdma_DmaConfig(instancePtr, XAXIVDMA_WRITE, &writeConfig);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma write channel config failed");

	UINTPTR address = writeBaseAddress;
	for(int i = 0; i < NUMBER_OF_WRITE_FRAMES; i++) {
		writeConfig.FrameStoreStartAddr[i] = address;
		address += FRAME_HORIZONTAL_LEN * FRAME_VERTICAL_LEN;
	}

	status = XAxiVdma_DmaSetBufferAddr(instancePtr, XAXIVDMA_WRITE, writeConfig.FrameStoreStartAddr); // Set the buffer addresses for transfer in the DMA engine
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma write channel set buffer address failed");

	UINTPTR WriteFrameAddr = writeBaseAddress;
	memset((void *)WriteFrameAddr, 1, FRAME_HORIZONTAL_LEN * FRAME_VERTICAL_LEN * NUMBER_OF_WRITE_FRAMES);

	return XST_SUCCESS;
}
#endif

int vdma_startTransfer(XAxiVdma *instancePtr)
{
#ifdef AXIVDMA_WRITE_ENABLE
	BaseType_t status;
	status = XAxiVdma_DmaStart(instancePtr, XAXIVDMA_WRITE);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma start Write transfer failed");
#endif

#ifdef AXIVDMA_READ_ENABLE
	status = XAxiVdma_DmaStart(instancePtr, XAXIVDMA_READ);
	MESSAGE_ASSERT((status == XST_SUCCESS), "error - XAxiVdma start read transfer failed");
#endif

	return XST_SUCCESS;
}

void vdma_debugReportStatus(XAxiVdma *XVdmaPtr, u32 PixelWidthInBits)
{
  u32 height,width,stride;
  u32 regOffset;

  if(XVdmaPtr)
  {
    xil_printf("\r\n\r\n----->VDMA IP STATUS<----\r\n");
    xil_printf("INFO: VDMA Rd/Wr Client Width/Stride defined in Bytes Per Pixel\r\n");
    xil_printf("Bytes Per Pixel = %d.%d\r\n\r\n", (PixelWidthInBits/8), (PixelWidthInBits%8));
    xil_printf("Read Channel Setting \r\n" );
    //clear status register before reading
    XAxiVdma_ClearDmaChannelErrors(XVdmaPtr, XAXIVDMA_READ, 0xFFFFFFFF);

    //Read Registers
    XAxiVdma_DmaRegisterDump(XVdmaPtr, XAXIVDMA_READ);
    regOffset = XAXIVDMA_MM2S_ADDR_OFFSET;
    height =  XAxiVdma_ReadReg(XVdmaPtr->BaseAddr, regOffset+0);
    width  =  XAxiVdma_ReadReg(XVdmaPtr->BaseAddr, regOffset+4);
    stride =  XAxiVdma_ReadReg(XVdmaPtr->BaseAddr, regOffset+8);
    stride &= XAXIVDMA_STRIDE_MASK;

    xil_printf("Height: %d \r\n", height);
    xil_printf("Width : %d (%d)\r\n", width, (width*8/PixelWidthInBits));
    xil_printf("Stride: %d (%d)\r\n", stride, (stride*8/PixelWidthInBits));

    xil_printf("\r\nWrite Channel Setting \r\n" );
    //clear status register before reading
    XAxiVdma_ClearDmaChannelErrors(XVdmaPtr, XAXIVDMA_WRITE, 0xFFFFFFFF);

    //Read Registers
    XAxiVdma_DmaRegisterDump(XVdmaPtr, XAXIVDMA_WRITE);
    regOffset = XAXIVDMA_S2MM_ADDR_OFFSET;
    height =  XAxiVdma_ReadReg(XVdmaPtr->BaseAddr, regOffset+0);
    width  =  XAxiVdma_ReadReg(XVdmaPtr->BaseAddr, regOffset+4);
    stride =  XAxiVdma_ReadReg(XVdmaPtr->BaseAddr, regOffset+8);
    stride &= XAXIVDMA_STRIDE_MASK;

    xil_printf("Height: %d \r\n", height);
    xil_printf("Width : %d (%d)\r\n", width, (width*8/PixelWidthInBits));
    xil_printf("Stride: %d (%d)\r\n", stride, (stride*8/PixelWidthInBits));
  }
}
