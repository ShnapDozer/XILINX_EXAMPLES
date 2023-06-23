#ifndef NETWORKDRIVER_H
#define NETWORKDRIVER_H

#define IP_ADDR_1 192
#define IP_ADDR_2 168
#define IP_ADDR_3 1
#define IP_ADDR_4 10

#define REMOTE_IP_ADDR_1 192
#define REMOTE_IP_ADDR_2 168
#define REMOTE_IP_ADDR_3 1
#define REMOTE_IP_ADDR_4 11

#define UDP_RECV_BUFSIZE 1000
#define THREAD_STACKSIZE 1024
#define PLATFORM_EMAC_BASEADDR XPAR_XEMACPS_0_BASEADDR

#include "lwip/init.h"
#include "lwip/sockets.h"
#include "netif/xadapter.h"

int sock;

struct netif _serverNetif;

struct ip4_addr _lockalAddres;
struct ip4_addr _netmask;
struct ip4_addr _getway;

unsigned char _macAddres[];

BaseType_t setupNetwork();
BaseType_t setupUdpSocket(u16_t port);
void udpSocketApp(size_t recvBuffSize);

#endif
