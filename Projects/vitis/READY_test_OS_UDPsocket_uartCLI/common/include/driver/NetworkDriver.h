#ifndef NETWORKDRIVER_H
#define NETWORKDRIVER_H

#define IP_ADDR_1 192
#define IP_ADDR_2 168
#define IP_ADDR_3 1
#define IP_ADDR_4 10

#define UDP_RECV_BUFSIZE 1000
#define THREAD_STACKSIZE 1024
#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR

#include "lwip/init.h"
#include "netif/xadapter.h"

struct netif _serverNetif;

struct ip4_addr _lockalAddres;
struct ip4_addr _netmask;
struct ip4_addr _getway;

unsigned char _macAddres[];

void setupNetwork();
void udpSocketApp(u16_t port, size_t recvBuffSize);

#endif
