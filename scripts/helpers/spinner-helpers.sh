#!/bin/bash

run-command-with-spinner() {

  local CROSS=" ❌ "
  local CHECKBOX=" ☑ "
  local RED="$(tput setaf 1)"
  local GRE="$(tput setaf 2)"
  local YEL="$(tput setaf 3)"
  local NOC="$(tput sgr0)"

  spinner() {

    local counter

    local pid=${1}
    local msg="${@:2}"

    local DELAY=0.075
    local SPINCHARS='◴◷◶◵'
    local SPINCHAR_COUNT="${#SPINCHARS}"
    local WS_PREFIX="    " # 4

    tput civis || :

    counter=0
    printf "$WS_PREFIX${msg}"
    while [ -n "$( ps a | awk '{print $1}' | grep "${pid}" )" ]; do
      printf "\r $YEL${SPINCHARS:${counter}:1} "
      let counter=$(( (counter+1)%SPINCHAR_COUNT )) || :
      sleep $DELAY
    done

    tput cnorm || :
  }

  local kommand_proc_id kommand_exit_st

  local message="${1}"
  local kommand="${@:2}"

  # dispatch command
  ( $kommand ) &
  kommand_proc_id=$!

  # run spinner until background job is complete
  spinner ${kommand_proc_id} "${message}" &
  wait ${kommand_proc_id}
  kommand_exit_st=$?

  # overwrite message icon
  sleep 0.25
  if [ ${kommand_exit_st} -eq 0 ]; then
    printf "\r$GRE$CHECKBOX ${message}$NOC\n"
  else
    printf "\r$RED$CROSS ${message}\n"
    printf "  -> Unexpected Failure. Exiting with status ${kommand_exit_st}$NOC\n"
    exit ${kommand_exit_st}
  fi
}

