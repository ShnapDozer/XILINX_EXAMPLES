#include <stdbool.h>
#include <stddef.h>

#include "xil_printf.h"
#include "xil_cache.h"
#include "xparameters.h"

#include "Common.h"
#include "driver/AxiVdmaDriver.h"
#include "driver/NetworkDriver.h"
#include "driver/UartDriver.h"

#define HOST_IP_ADDRESS 	"192.168.1.10"
#define HOST_RX_SOCK_PORT 	5001
#define HOST_TX_SOCK_PORT	5002
#define HOST_IP_MASK 		"255.255.255.0"
#define HOST_GETWAY_ADDRESS "192.168.1.1"

#define REMOTE_IP_ADDRESS 	"192.168.1.11"
#define REMOTE_SOCK_PORT 	5001

#define NORMAL_TASK_PRIORITI 1
#define DMA_BUFF_SIZE 1024

#define WRITE_BASE_ADDR   (0x100000 + 0x01000000)

TaskHandle_t readCameraUartTaskHandle;
void readCameraUartTask(void* arg);

int _rxSocket;
int _txSocket;

void networkThread();
void readCameraDataApp(int socket);

int main() {
	xil_printf("\n\r\n\rstart - app\n\r");

	Xil_DCacheDisable();

	setupInterruptSystem(&xInterruptController);
	setupUart(&xInterruptController, 9600, 1000);
	setupVdma(&xInterruptController, WRITE_BASE_ADDR, NULL);
	xil_printf("done - setup hardware\n\r");

	sys_thread_new("udpNetworkThread",
					(void(*)(void*))networkThread,
					NULL,
					TCPIP_THREAD_STACKSIZE,
					DEFAULT_THREAD_PRIO);

	vTaskStartScheduler();

	for(;;){ }
	return 0;

}

void networkThread() {
	xil_printf("start - networkThread\r\n");

	setupNetwork(HOST_IP_ADDRESS, HOST_IP_MASK, HOST_GETWAY_ADDRESS);
	
	_rxSocket = setupUdpSocket(HOST_IP_ADDRESS, HOST_RX_SOCK_PORT);
	_txSocket = setupUdpSocket(HOST_IP_ADDRESS, HOST_TX_SOCK_PORT);

	readCameraDataApp(_txSocket);
}

void readCameraDataApp(int socket) {

	struct sockaddr_in remoteHost;
	setupSockaddr(REMOTE_IP_ADDRESS, REMOTE_SOCK_PORT, &remoteHost);

	for(;;) {
		vdma_startTransfer(&_axiVdma);
		vdma_debugReportStatus(&_axiVdma, 8);

		udpSendTo(socket, (void*)WRITE_BASE_ADDR, FRAME_HORIZONTAL_LEN*2, (struct sockaddr *)&remoteHost);
		udpSendTo(socket, (void*)WRITE_BASE_ADDR + FRAME_HORIZONTAL_LEN*6, FRAME_HORIZONTAL_LEN*2, (struct sockaddr *)&remoteHost);
		udpSendTo(socket, (void*)WRITE_BASE_ADDR + FRAME_HORIZONTAL_LEN*8, FRAME_HORIZONTAL_LEN*2, (struct sockaddr *)&remoteHost);
		udpSendTo(socket, (void*)WRITE_BASE_ADDR + FRAME_HORIZONTAL_LEN*12, FRAME_HORIZONTAL_LEN*2, (struct sockaddr *)&remoteHost);
	}
}

void readCameraUartTask(void* arg) {
	xil_printf("start - readCameraUartTask\r\n");

	// char message[100] = "w TestPattern 14\r";
	// uartPutString(&message, 100);

	// uartGetLine(&message, portMAX_DELAY);
	// xil_printf("Read: %s \r\n", message);
	// uartGetLine(&message, portMAX_DELAY);
	// xil_printf("Read: %s \r\n", message);
	// uartGetLine(&message, portMAX_DELAY);
	// xil_printf("Read: %s \r\n", message);
	// uartGetLine(&message, portMAX_DELAY);
	// xil_printf("Read: %s \r\n", message);

	for(;;) {

	}
}