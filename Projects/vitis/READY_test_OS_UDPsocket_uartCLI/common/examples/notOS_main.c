//#include <unistd.h>
//#include <stdlib.h>
//
//#include "xscugic.h"
//#include "xemacps.h"
//#include "xparameters.h"
//
//#include "xil_cache.h"
//#include "xil_exception.h"
//#include "xil_printf.h"
//
//#include "netif/xadapter.h"
//#include "lwip/udp.h"
//
//XScuGic interruptController;
//XScuGic_Config *interruptConfig;
//
//#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR
//
//struct netif serverNetif;
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
//void lwip_init();
//int setupInterruptSystem();
//static void udpRecvPerfCallback(void *arg, struct udp_pcb *tpcb, struct pbuf *p, const ip_addr_t *addr, u16_t port);
//
//int main() {
//	xil_printf("Start App \r\n");
//	Xil_DCacheDisable();
//
//	echoNetif = &serverNetif;
//	setupInterruptSystem();
//
//	IP4_ADDR(&ipAddres, 192, 168, 1, 10);
//	IP4_ADDR(&netmask, 255, 255, 255, 0);
//	IP4_ADDR(&gw, 192, 168, 0, 1);
//	IP4_ADDR(&remoteAddres, 192, 168, 1, 11);
//
//	lwip_init();
//	if (!xemac_add(echoNetif, &ipAddres, &netmask, &gw, macEthernetAddres, PLATFORM_EMAC_BASEADDR)) {
//		xil_printf("Error adding N/W interface\n\r");
//		return -1;
//	}
//	xil_printf("Setup Network Interface \n\r");
//	netif_set_default(echoNetif);
//	netif_set_up(echoNetif);
//
//	xil_printf("Create UDP server \n\r");
//
//	pcb = udp_new();
//	udp_bind(pcb, &ipAddres, udpPort);
//
//	udp_recv(pcb, udpRecvPerfCallback, NULL);
//
//	xil_printf("Start UDP server \n\r");
//
//	while(1) {
//		xemacif_input(echoNetif);
//	}
//
//}
//
//int setupInterruptSystem() {
//	int Status = 0;
//
//	interruptConfig = XScuGic_LookupConfig(XPAR_SCUGIC_0_DEVICE_ID);
//	if (NULL == interruptConfig) {
//		return XST_FAILURE;
//	}
//
//	Status = XScuGic_CfgInitialize(&interruptController, interruptConfig, interruptConfig->CpuBaseAddress);
//	if (Status != XST_SUCCESS) {
//		return XST_FAILURE;
//	}
//
//	Xil_ExceptionInit();
//	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, &interruptController);
//	Xil_ExceptionEnable();
//	return 0;
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
