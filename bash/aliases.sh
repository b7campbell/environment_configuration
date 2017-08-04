#!/bin/bash -e

##
## Personal aliases
##

# command colors {{{
if [ -x /usr/bin/dircolors ] ; then
  alias ls='ls --color=auto'

  alias  grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
# }}}

# ls aliases {{{
  alias  l='ls -C'            # force multiline output
  alias la='ls -A'            # show hidden and regular files
  alias ll='ls -l'            # long format
  alias ll='ls -alF'
  alias lt='ls -alrt'
# }}}

# git aliases {{{
  alias gbr='git branch'
  alias gst='git status'
  alias gco='git checkout'

  alias  gs="git status"
  alias  ga="git add"
  alias  gc="git commit -m"
  alias  gl="git pull"
  alias glm="git pull origin master"
  alias  gp="git push"
# }}}

# vim {{{
  alias   vi='vim'
  alias  svi='sudo vi'
  alias svim='sudo vi'

  alias  cim='vim'
  alias  bim='bim'
# }}}

# general conveniences {{{
  alias path='printf "${PATH//:/\\n}\n"'
  alias  now='date +"%T"'

  alias ackl="ack -l"

  alias tree="find . -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'"

  alias   ff='find . -name $1'

  alias bman='bash-man'

  alias         todos="ag --nogroup '(TODO|FIX(ME)?)[: ]'"
  alias cat-nocomment='egrep -v "^([[:space:]]*#)"'
  alias   cat-minimal='egrep -v "^([[:space:]]*#.*|$)"'

# }}}

# verbose aliases {{{
  alias chmod='chmod -v'
  alias    mv='mv -v'
  alias    cp='cp -v'
# }}}

# utilities {{{
  alias           mov='/bin/mv --interactive --verbose --no-clobber'
  alias           del='/bin/rm --interactive=once --preserve-root'
  alias           cpy='/bin/cp --no-clobber'
  alias          diff='/usr/bin/diff -W $(( $(tput cols) - 2 ))'
  alias          diff='/usr/bin/diff -W $(( $(tput cols) - 2 ))'

  alias          chwn='/bin/chown --preserve-root'
  alias          chmd='/bin/chmod --preserve-root'
  alias          chgr='/bin/chgrp --preserve-root'

  alias      disk-use='du -ch 2>/dev/null | tail -1'
  alias partition-use='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

  alias         flush='sync'
  alias           cpu='top -o cpu'
  alias           mem='top -o rsize' # memory

# }}}

# avoid 'command not found' {{{
  alias cd..='cd ..'
  alias sl='l'
# }}}

# development tools {{{
  alias gcc='gcc -Wall -Wpedantic -Werror'
# }}}


# general conveniences {{{
  alias            apt='sudo apt-get'
  alias        apt-get='sudo apt-get'
# }}}

# utitilies {{{
  alias       ram='free -m -l -t'

  alias      halt='sudo /sbin/halt'
  alias    reboot='sudo /sbin/reboot'
  alias  poweroff='sudo /sbin/poweroff'
  alias  shutdown='sudo /sbin/shutdown'
# }}}

# defensive aliases {{{

  alias    rm="echo 'ECU: use >del< instead'"
  alias    mv="echo 'ECU: use >mov< instead'"
  alias    cp="echo 'ECU: use >cpy< instead'"
  alias chown="echo 'ECU: use >chwn< instead'"
  alias chmod="echo 'ECU: use >chmd< instead'"
  alias chgrp="echo 'ECU: use >chgr< instead'"

  alias script='echo you disabled this command'
# }}}


