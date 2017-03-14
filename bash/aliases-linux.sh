#!/bin/bash -e

# command colors {{{
if [ -x /usr/bin/dircolors ] ; then
  alias ls='ls --color=auto'

  alias  grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
# }}}

# general conveniences {{{
  alias        apt-get='sudo apt-get'
  alias apt-get-update='sudo apt-get update && sudo apt-get upgrade'
# }}}

# utitilies {{{
  alias       ram='free -m -l -t'

  alias      halt='sudo /sbin/halt'
  alias    reboot='sudo /sbin/reboot'
  alias  poweroff='sudo /sbin/poweroff'
  alias  shutdown='sudo /sbin/shutdown'
# }}}

# defensive aliases {{{
  alias   del='rm -I --preserve-root'
  alias   mov='mv --no-clobber'
  alias   cpy='cp --no-clobber'
  alias chwn='chown --preserve-root'
  alias chmd='chmod --preserve-root'
  alias chgr='chgrp --preserve-root'
# }}}

