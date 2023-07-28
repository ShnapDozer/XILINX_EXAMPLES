#include <driver/NetworkDriver.h>
#include <string.h>
#include <sleep.h>

#include "xemacps.h"

#include "Common.h"
#include "driver/AxiDmaDriver.h"

void setupNetwork(const char *ipAddres, const char *mask, const char *getway) {
	lwip_init();

	u8_t macAddres[] = { 0x00, 0x0a, 0x35, 0x00, 0x01, 0x02 };
	MESSAGE_ASSERT((xemac_add(&_serverNetif, NULL, NULL, NULL, macAddres, PLATFORM_EMAC_BASEADDR) != NULL), "error -network adding N/W interface\n\r");

	netif_set_default(&_serverNetif);
	netif_set_up(&_serverNetif);

	sys_thread_new("xemacif_input_thread", (void(*)(void*))xemacif_input_thread, &_serverNetif, TCPIP_THREAD_STACKSIZE, DEFAULT_THREAD_PRIO);

	int error;
	error = inet_aton(ipAddres, &_serverNetif.ip_addr);
	MESSAGE_ASSERT((error != 0), "error - network invalid default IP address");

	error = inet_aton(mask, &_serverNetif.netmask);
	MESSAGE_ASSERT((error != 0), "error - network invalid default IP MASK");

	error = inet_aton(getway, &_serverNetif.gw);
	MESSAGE_ASSERT((error != 0), "error - network invalid default gateway address");
}

int setupUdpSocket(const char *ipAddres, u16_t port) {
	int sock = socket(AF_INET, SOCK_DGRAM, 0);
	MESSAGE_ASSERT((sock >= 0), "error - creating socket fail\r\n");

	struct sockaddr_in hostAddr;
	setupSockaddr(ipAddres, port, &hostAddr);

	err_t error = bind(sock, (struct sockaddr*)&hostAddr, sizeof(hostAddr));
	if (error != ERR_OK) {
		xil_printf("error - fain on bind socket: %d\r\n", error);
		close(sock);

		return -1;
	}

	return sock;
}

void setupSockaddr(const char *ipAddres, u16_t port, struct sockaddr_in *host){
	memset(host, 0, sizeof(struct sockaddr_in));
	host->sin_family = AF_INET;
	host->sin_port = htons(port);
	host->sin_addr.s_addr = inet_addr(ipAddres);
}

int udpSendTo(int sock, const void *dataptr, size_t dataSize, const struct sockaddr *sendAddres) {
	u8_t retries = MAX_SEND_RETRY;
	
	xil_printf("udpSendTo");

	int count = -1;
	while (retries) {
		count = sendto(sock, dataptr, dataSize, 0, sendAddres, sizeof(*sendAddres));

		if (count <= 0) {
			retries--;
			usleep(RETRIE_SLEEP);
		} else {
			break;
		}
	}

	if (!retries) {
		xil_printf("Too many udpSendTo() retries\n\r");
		return -1;
	}


	return count;
}


