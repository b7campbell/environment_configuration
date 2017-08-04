#!/bin/bash -e

# Ansi Colors
# http://misc.flogisoft.com/bash/tip_colors_and_formatting

# Note: http://unix.stackexchange.com/questions/28827/why-is-my-bash-prompt-getting-bugged-when-i-browse-the-history
BOLD="\[$(tput bold)\]"
LOGIN_COLOR="${BOLD}\[\033[38;5;16m\]"
LOGIN_HIGHLIGHT="\[\033[48;5;12m\]"
LIGHT_GRAY="${BOLD}\[\033[38;5;12m\]"
PEACH="\[\033[38;5;136m\]"
ORANGE="\[\033[38;5;130m\]"
PURPLE="\[\033[38;5;104m\]"
STEEL="\[\033[38;5;241m\]"

DEFAULT_COLOR="${BOLD}$STEEL"

RESET="\[$(tput sgr0)\]"
NONE="$RESET"
UNDERLINE="\[$(tput smul)\]"

###########
# Helpers #
###########

is-color-terminal() {
  # 0 is color terminal
  # 1 is non-color terminal
  test "$TERM" == "xterm-256color*" -o "$TERM == xterm"
  return $?
}

reset-ps1-color() {
  PS1="${PS1}${RESET}"
}

set-ps1-color() {
  PS1="${PS1}${1}"
}

newline() {
  PS1="${PS1}${NEWLINE}"
}

concatenate-ps1() {
  local prefix_flag="${1}"
  local add_on="${2}"
  local color="${3:-${NONE}}"

  if [ "${prefix_flag}" != '--no-prefix' ]; then
    add_on="${1}"
    color="${2:-${NONE}}"
  fi

  local DELIMITER_CHARACTER='|'

  if [ "${prefix_flag}" != '--no-prefix' ]; then
    if is-color-terminal; then
      set-ps1-color "${DEFAULT_COLOR}"
    fi

    PS1="$PS1 ${DELIMITER_CHARACTER} "

    if is-color-terminal; then
      reset-ps1-color
    fi
  fi

  if is-color-terminal; then
    set-ps1-color "${color}"
  fi

  PS1="$PS1${add_on}"

  if is-color-terminal; then
    reset-ps1-color
  fi
}

#############
# Functions #
#############

construct-border() {
  local border_char
  local border
  local cols

  cols=$(( COLUMNS - 3 ))

  border_char='═'

  border="$( for (( c=0; c<=$cols; c++ )); do printf "$border_char"; done )"

  PS1="╔${border}╗"
}

is-login-shell() {
  shopt -q login_shell
  return $?
}

construct-cmd-prompt-header() {

  local PS1_HOST='\H'
  local PS1_JOBS='\j'
  local PS1_PWD='\w'
  local PS1_TIME_HEADER_IS_DISPLAYED='\@'
  local PS1_EXIT_STATUS='${?}'

  local NEWLINE='\n'

  local PROMPT='=>'

  concatenate-ps1 --no-prefix '╠ǁ'

  # Time
  concatenate-ps1 --no-prefix "${PS1_TIME_HEADER_IS_DISPLAYED}" "${LIGHT_GRAY}"

  # Exit Status of Previous Command

  if [ -z "$MINIMAL_PROMPT" ]; then
    concatenate-ps1 '\$?: ' "${LIGHT_GRAY}"
    concatenate-ps1 --no-prefix "${PS1_EXIT_STATUS}" "${ORANGE}"

    # Number of Background Jobs Running
    concatenate-ps1 'jobs: ' "${LIGHT_GRAY}"
    concatenate-ps1 --no-prefix "${PS1_JOBS}" "${ORANGE}"

    # Print if login shell
    if is-login-shell; then
      concatenate-ps1 "login shell" "${LOGIN_COLOR}${LOGIN_HIGHLIGHT}"
    fi
  fi

  # Print Working Directory
  concatenate-ps1 'pwd: ' "${LIGHT_GRAY}"
  concatenate-ps1 --no-prefix "${PS1_PWD}"  "${PURPLE}"

  # NewLine
  newline
  reset-ps1-color
  concatenate-ps1 --no-prefix '╚═'

  # Concatenate Command Prompt
  if [ -d .git ]; then
     
    branch_name='$( parse_git_branch)'
    concatenate-ps1 --no-prefix " [git] ${branch_name}" "${PURPLE}"
  fi

  concatenate-ps1 --no-prefix " ${PROMPT} " "${ORANGE}"

  # Set Text Color
  set-ps1-color "${RESET}"

  unset newline
}

