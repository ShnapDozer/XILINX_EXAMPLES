#ifndef AXIVDMA_DRIVER_H
#define AXIVDMA_DRIVER_H

#include "FreeRTOS.h"
#include "queue.h"
#include "semphr.h"
#include "portmacro.h"

#include "xparameters.h"
#include "xscugic.h"
#include "xaxivdma.h"

#define DMA_DEVICE_ID   XPAR_AXIVDMA_0_DEVICE_ID

/* Memory space for the frame buffers
 *
 * This example only needs one set of frame buffers, because one video IP is
 * to write to the frame buffers, and the other video IP is to read from the
 * frame buffers.
 *
 * For 16 frames of 1080p, it needs 0x07E90000 memory for frame buffers
 */
#define MEM_BASE_ADDR   (DDR_BASE_ADDR + 0x01000000)
#define MEM_HIGH_ADDR	DDR_HIGH_ADDR
#define MEM_SPACE		(MEM_HIGH_ADDR - MEM_BASE_ADDR)

//Read channel and write channel start from the same place
#define READ_ADDRESS_BASE	MEM_BASE_ADDR
#define WRITE_ADDRESS_BASE	MEM_BASE_ADDR

//Frame size related constants
#define FRAME_HORIZONTAL_LEN  0x1E00   // 1920 pixels each pixel 4 bytes
#define FRAME_VERTICAL_LEN    0x438    // 1080 pixels


#endif

