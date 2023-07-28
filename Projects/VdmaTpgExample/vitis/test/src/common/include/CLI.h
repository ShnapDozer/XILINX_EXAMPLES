#ifndef CLI_H
#define CLI_H

#include <stddef.h>

#define MAX_COMMANDS 100

typedef void (*cmdCallBackPtr)(const char*);
typedef struct {
  const char *name;
  cmdCallBackPtr callback;
} Command;

size_t commandsCount;
Command registeredCommands[MAX_COMMANDS];

void addCommand(const char *name, cmdCallBackPtr callback);
void findCommand(char *line);

#endif

