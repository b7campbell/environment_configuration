#!/bin/sh -e

##
## configure.sh: bootstrap environment_configuration
##

# Configure only if bash is being run interactively
if [ -z "$PS1" ]; then
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

setup-terminal

