#!/bin/bash -e

# enable lesspipe {{{
  # see lesspipe(1)
  if [ -x /usr/bin/lesspipe ]; then
    eval "$(SHELL=/bin/sh lesspipe)"
  fi
# }}}

