#ifndef NETWORKDRIVER_H
#define NETWORKDRIVER_H

#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR

#define MAX_SEND_RETRY 10
#define RETRIE_SLEEP 100

#include "lwip/init.h"
#include "lwip/sockets.h"
#include "netif/xadapter.h"

struct netif _serverNetif;

void setupNetwork(const char *ipAddres, const char *mask, const char *getway);
int setupUdpSocket(const char *ipAddres, u16_t port);
void setupSockaddr(const char *ipAddres, u16_t port, struct sockaddr_in *host);

int udpSendTo(int sock, const void *dataptr, size_t dataSize, const struct sockaddr *sendAddres);

#endif
