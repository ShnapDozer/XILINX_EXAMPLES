#include "CLI.h"

#include <string.h>

size_t commandsCount = 0;

void addCommand(const char *name, cmdCallBackPtr callback)
{
  if (commandsCount == MAX_COMMANDS) {
    return;
  }
    
  registeredCommands[commandsCount].name = name;
  registeredCommands[commandsCount].callback = callback;
  ++commandsCount;
}

void findCommand(char *line)
{
    char *commandName = strtok(line, " ");
    for(int i = 0; i < commandsCount; ++i) {
        if (strcmp(commandName, registeredCommands[i].name) == 0) {
             registeredCommands[i].callback(strtok(NULL, ""));
        }
    }
      
}
