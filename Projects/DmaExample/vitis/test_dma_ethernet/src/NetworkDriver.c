#include "NetworkDriver.h"
#include <string.h>

#include "xemacps.h"

#include "Common.h"

unsigned char _macAddres[] = {0x00, 0x0a, 0x35, 0x00, 0x01, 0x10};

BaseType_t setupNetwork() {
	lwip_init();

	IP4_ADDR(&_lockalAddres, IP_ADDR_1, IP_ADDR_2, IP_ADDR_3, IP_ADDR_4);
	IP4_ADDR(&_netmask, 255, 255, 255, 0);
	IP4_ADDR(&_getway, 192, 168, 0, 1);

	if (!xemac_add(&_serverNetif, &_lockalAddres, &_netmask, &_getway, _macAddres, PLATFORM_EMAC_BASEADDR)) {
		xil_printf("error - adding N/W interface\n\r");
		return XST_FAILURE;
	}
	xil_printf("done - adding N/W interface \r\n");

	netif_set_default(&_serverNetif);
	netif_set_up(&_serverNetif);
	xil_printf("done - setup netif \r\n");

	sys_thread_new("xemacif_input_thread", (void(*)(void*))xemacif_input_thread, &_serverNetif, THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);
	xil_printf("done - start xemacif_input_thread \r\n");

	return XST_SUCCESS;
}

BaseType_t setupUdpSocket(u16_t port) {
	sock = -1;

	if ((sock = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
		xil_printf("error - creating socket fail\r\n");
		return XST_FAILURE;
	}

	unsigned long addrTmp = 0;
	inet_pton(AF_INET, STR(IP_ADDR_1.IP_ADDR_2.IP_ADDR_3.IP_ADDR_4), &addrTmp);

	struct sockaddr_in hostAddr;
	memset(&hostAddr, 0, sizeof(struct sockaddr_in));
	hostAddr.sin_family = AF_INET;
	hostAddr.sin_port = htons(5001);
	hostAddr.sin_addr.s_addr = addrTmp;

	err_t error = bind(sock, (struct sockaddr*)&hostAddr, sizeof(hostAddr));
	if (error != ERR_OK) {
		xil_printf("error - fain on bind socket: %d\r\n", error);
		close(sock);

		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

void udpSocketApp(size_t recvBuffSize) {

	int count;
	int recv_id;
	u8_t recv_buf[recvBuffSize];

	struct sockaddr_in reciveHost;
	for(;;) {
		if((count = recvfrom(sock, recv_buf, recvBuffSize, 0, (struct sockaddr*)&reciveHost, (socklen_t *)sizeof(reciveHost))) <= 0) {
			continue;
		}

		recv_id = ntohl(*((int *)recv_buf));

		xil_printf("receive- recv_id: %d\r\n", recv_id);
		sendto(sock, recv_buf, count, 0, (struct sockaddr*)&reciveHost, sizeof(reciveHost));
	}
}
