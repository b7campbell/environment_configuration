#!/bin/bash -e

##
## add OS agnostic aliases
##

# ls aliases {{{
  alias  l='ls -C'             # force multiline output
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
# }}}

# general conveniences {{{
  alias path='printf "${PATH//:/\\n}\n"'
  alias  now='date +"%T"'

  alias ackl="ack -l"

  alias tree="find . -print | sed -e 's;[^/]*/;|__;g;s;__|; |;g'"

  alias   ff='find . -name $1'

  alias bman='bash-man'
  alias script='echo you disabled this command'

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
  alias           mov='mv -i'
  alias           del='rm -i'
  alias          diff='diff -W $(( $(tput cols) - 2 ))'
  alias          diff='diff -W $(( $(tput cols) - 2 ))'

  alias      disk-use='du -ch 2>/dev/null | tail -1'
  alias partition-use='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

  alias         flush='sync'
  alias           cpu='top -o cpu'
  alias           mem='top -o rsize' # memory

# }}}

# avoid 'command not found' {{{
  alias cd..='cd ..'

  alias cim='vim'
  alias bim='bim'
# }}}

# development tools {{{
  alias gcc='gcc -Wall'
# }}}


