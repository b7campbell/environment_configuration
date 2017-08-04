#!/bin/bash -e

bash-man() {

  echo-stderr() {
    echo "$*" 1>&2
  }

  usage() {
    echo-stderr "Usage: bash-man [valid shell builtin]"
  }

  local cmd

  # ignore quoted whitespace
  cmd=$( tr -d "[:space:]" <<< "$1" )

  if [ $# -ne 1 ]; then
    usage
    return 1
  fi

  if 2>&1 type "${cmd}" | grep -q "is a shell builtin"; then
    help "${cmd}" | "${PAGER:-more}"
  else
    echo-stderr "Error: '${cmd}' is not a valid shell builtin"
  fi
}

cdl() {
  cd "$@"
  ls --color=auto
}

print-readline-tip() {
  local line_num="$( ag -n '"' ~/.inputrc  | cut -f1 -d: | sort -R | head -1 )"
  figlet -f straight.flf 'Terminal Tip:'
  printf "\t\t\t"
  sed "${line_num}q;d" ~/.inputrc | sed 's/:\s*/ [maps to] /'
  printf "\n"
}

