#ifndef COMMON_H
#define COMMON_H

#include <stddef.h>

#include "xscugic.h"
#include "xscuwdt.h"

#include "FreeRTOS.h"
#include "task.h"

#include "xil_printf.h"

#define STR(X) #X

#define MESSAGE_ASSERT(a, message)  if(a == 0) { messageAssertCalled(__FILE__, __LINE__, message); }

extern XScuGic xInterruptController;
XScuWdt xWatchDogInstance; // The private watchdog is used as the timer that generates run time stats.  This frequency means it will overflow quite quickly.

void setupInterruptSystem(XScuGic* interruptController);

enum ErrorCode { No_Error, Error_SetParameter, Error_CommandExecution,  Error_CrcCode};
enum CommandNumber { UndefinedCommand, TestConnection, StartStream, SetParameter };

typedef unsigned short crc16;

struct AnswerPackage {
	unsigned int id;
	enum CommandNumber commandNumber;
	enum ErrorCode errorCode;
	crc16 crcCode;
};

struct CommandPackage {
	unsigned int id;
	enum CommandNumber commandNumber;
	double arg;
	crc16 crcCode;
};


crc16 getCrcValue(const char* data, size_t dataSize);

void messageAssertCalled(const char *pcFile, unsigned long ulLine, const char *assertMessage);
void vInitialiseTimerForRunTimeStats(void);

extern void vPortInstallFreeRTOSVectorTable(void);

void vApplicationMallocFailedHook(void);
void vApplicationStackOverflowHook(TaskHandle_t pxTask, char *pcTaskName);
void vApplicationIdleHook(void);
void vApplicationTickHook(void);

void *memcpy(void *pvDest, const void *pvSource, size_t xBytes);
void *memset(void *pvDest, int iValue, size_t xBytes);
int memcmp(const void *pvMem1, const void *pvMem2, size_t xBytes);

#endif
