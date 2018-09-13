#!/bin/sh -e

##
## configure.sh: bootstrap environment_configuration
##

if [ "bash" != "${0}" -a "/bin/bash" != "${0}" -a "-bash" != "${0}" ]; then
  echo "Denied: Script cannot be invoked on the command line" 2>&1
  exit 1
fi

# Configure only if bash is being run interactively
if [ -z "$PS1" ]; then
  # only ever run inside a script
  return
fi

export ENV_PATH="$( dirname ${BASH_SOURCE[0]} )"

##
## Bash Environment
##
. "$ENV_PATH/runcoms/bashrc"

##
## Configure Terminal-Appearance
##
. "$ENV_PATH/terminal-appearance/terminal-appearance-functions.sh"

PROMPT_COMMAND="setup-prompt; $PROMPT_COMMAND"

