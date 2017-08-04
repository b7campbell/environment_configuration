#!/bin/bash -e

##
## Configure shell environment
##

eval `dircolors $ENV_PATH/tmp/dircolors.256dark`

# see lesspipe(1)
if [ -x /usr/bin/lesspipe ]; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi

##
## Documentation for 'set' At:
## https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
##

set -o braceexpand
set -o notify
set -o hashall
set -o histexpand
set -o monitor
set -o physical

set -o emacs

##
## Documentation for 'shopt' At:
## http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
##

shopt -u cdable_vars
shopt -s cdspell
shopt -u checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -u execfail
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -u hostcomplete
shopt -u huponexit
shopt -s interactive_comments
shopt -u lithist
shopt -s no_empty_cmd_completion
shopt -u nocaseglob
shopt -u nullglob
shopt -s progcomp
shopt -s promptvars
shopt -u shift_verbose
shopt -u sourcepath
shopt -s xpg_echo

