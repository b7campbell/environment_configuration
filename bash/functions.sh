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

