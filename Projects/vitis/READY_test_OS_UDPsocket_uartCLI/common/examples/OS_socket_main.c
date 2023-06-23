//#include <unistd.h>
//#include <stdlib.h>
//
//#include "FreeRTOS.h"
//#include "task.h"
//
//#include "xparameters.h"
//#include "xscugic.h"
//
//#include "xil_cache.h"
//#include "xil_exception.h"
//#include "xil_printf.h"
//
//#include "netif/xadapter.h"
//#include "lwip/init.h"
//
//#include "drivers/UartDriver.h"
//
//#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR
//
//static struct netif serverNetif;
//struct netif *echoNetif;
//struct pbuf *pDma;
//
//struct ip4_addr remoteAddres;
//u16_t remotePort = (u16_t)40501;
//u16_t udpPort = (u16_t)40501;
//
//struct ip4_addr ipAddres;
//struct ip4_addr netmask;
//struct ip4_addr gw;
//
//struct udp_pcb *pcb;
//unsigned char macEthernetAddres[] = {0x00, 0x0a, 0x35, 0x00, 0x01, 0x10};
//
//static void udpRecvPerfCallback(void *arg, struct udp_pcb *tpcb, struct pbuf *p, const ip_addr_t *addr, u16_t port);
//
//XScuGic interruptController;
//XScuGic_Config *interruptConfig;
//
//void setupInteraptSystem();
//
//static TaskHandle_t udpSocketHandle;
//void udpSocketTask(void *pvParameters);
//
//int main(void)
//{
//	xil_printf("start:\r\n");
//
//	Xil_DCacheDisable();
//
//	setupInteraptSystem();
//	xil_printf("done - setupHardware\r\n");
//
////	xTaskCreate(udpSocketTask,
////				"udpSocketTask",
////				1000000,
////				NULL,
////				tskIDLE_PRIORITY,
////				&udpSocketHandle);
//
//	vTaskStartScheduler();
//
//	for(;;) {
//
//	}
//}
//
//void setupInteraptSystem() {
//	BaseType_t xStatus;
//
//	portDISABLE_INTERRUPTS();
//
//	interruptConfig = XScuGic_LookupConfig(XPAR_SCUGIC_SINGLE_DEVICE_ID);
//
//	configASSERT(interruptConfig);
//	configASSERT(interruptConfig->CpuBaseAddress == (configINTERRUPT_CONTROLLER_BASE_ADDRESS + configINTERRUPT_CONTROLLER_CPU_INTERFACE_OFFSET));
//	configASSERT(interruptConfig->DistBaseAddress == configINTERRUPT_CONTROLLER_BASE_ADDRESS);
//
//	xStatus = XScuGic_CfgInitialize(&interruptController, interruptConfig, interruptConfig->CpuBaseAddress);
//	configASSERT(xStatus == XST_SUCCESS);
//	(void) xStatus;
//
//	vPortInstallFreeRTOSVectorTable();
//
//	Xil_ExceptionInit();
//	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &interruptController);
//	Xil_ExceptionEnable();
//
//
//	uartSetupInterruptSystem(&interruptController, 115200, 100);
//}
//
//void udpSocketTask(void *pvParameters) {
////	echoNetif = &serverNetif;
////
////	IP4_ADDR(&ipAddres, 192, 168, 1, 10);
////	IP4_ADDR(&netmask, 255, 255, 255, 0);
////	IP4_ADDR(&gw, 192, 168, 0, 1);
////	IP4_ADDR(&remoteAddres, 192, 168, 1, 11);
//
////	lwip_init();
////	if (!xemac_add(echoNetif, &ipAddres, &netmask, &gw, macEthernetAddres, PLATFORM_EMAC_BASEADDR)) {
////		xil_printf("error - adding N/W interface\n\r");
////		return;
////	}
//
////	netif_set_default(echoNetif);
////	netif_set_up(echoNetif);
////	xil_printf("done - setup network interface \n\r");
////
////
////
////	pcb = udp_new();
////	udp_bind(pcb, &ipAddres, udpPort);
////	xil_printf("done - create UDP server \n\r");
////
////	udp_recv(pcb, udpRecvPerfCallback, NULL);
////	xil_printf("done - start UDP server \n\r");
//
//	for(;;) {
////		xemacif_input(echoNetif);
//	}
//}
//
//void udpRecvPerfCallback(void *arg, struct udp_pcb *tpcb, struct pbuf *p, const ip_addr_t *addr, u16_t port) {
//	u8_t *data = p->payload;
//	char helloLine[] = "Hello from UDP server";
//
//	if(data[0] == 0xF1) {
//		xil_printf("F1\n\r");
//		pbuf_free(p);
//		p = pbuf_alloc(PBUF_TRANSPORT, sizeof(helloLine), PBUF_POOL);
//		memcpy(p->payload, &helloLine, sizeof(helloLine));
//		udp_sendto(pcb, p, &remoteAddres, remotePort);
//		pbuf_free(p);
//		return;
//
//	}
//
//	if(data[0] == 0x55){
//		xil_printf("0x55\n\r");
//		pbuf_free(p);
//		return;
//	}
//
//	pbuf_free(p);
//	xil_printf("Get interrupt \n\r");
//}
//
//
//
//
