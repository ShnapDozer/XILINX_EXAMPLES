#ifndef COMMON_H
#define COMMON_H

#include "xscugic.h"

#define STR(X) #X

extern XScuGic_Config* interruptConfig;

void setupInterruptSystem(XScuGic* interruptController);
void vAssertCalled(const char * pcFile, unsigned long ulLine);

#endif
