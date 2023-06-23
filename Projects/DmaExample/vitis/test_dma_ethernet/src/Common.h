#ifndef COMMON_H
#define COMMON_H

#include "xscugic.h"
#include "xscuwdt.h"

#include "FreeRTOS.h"
#include "task.h"

#define STR(X) #X

extern XScuGic xInterruptController;
XScuWdt xWatchDogInstance; // The private watchdog is used as the timer that generates run time stats.  This frequency means it will overflow quite quickly.

void setupInterruptSystem(XScuGic* interruptController);

void vAssertCalled(const char * pcFile, unsigned long ulLine);
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
