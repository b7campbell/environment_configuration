#!/bin/bash -e

# command colors {{{
  if grep -q 'xterm-256*' <<< "$TERM"; then
    alias    ls='gls --color=auto'

    alias  grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi
# }}}

# verbose aliases {{{
  alias cpy='cp -n'
# }}}

# development tools {{{
  alias g++='g++-5'
# }}}

