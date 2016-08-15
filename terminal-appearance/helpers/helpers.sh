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
  local add_on="${1}"
  local color="${2:-${NONE}}"
  local prefix_flag="${3}"

  local DELIMITER_CHARACTER='|'

  if [ -z "${prefix_flag}" -o "${prefix_flag}" != '--no-prefix' ]; then
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
  local character_used_in_border
  local border

  if is-color-terminal; then
    character_used_in_border=' '
  else
    character_used_in_border='='
  fi

  border="$( for (( c=1; c<=$COLUMNS; c++ )); do printf "$character_used_in_border"; done )"

  if is-color-terminal; then
    PS1="${DEFAULT_COLOR}${UNDERLINE}${border}${RESET}"
  else
    PS1="${border}"
  fi
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

  reset-ps1-color

  # Time
  concatenate-ps1 "${PS1_TIME_HEADER_IS_DISPLAYED}" "${LIGHT_GRAY}" --no-prefix

  # Exit Status of Previous Command

  if [ -z "$MINIMAL_PROMPT" ]; then
    concatenate-ps1 '\$?: ' "${LIGHT_GRAY}"
    concatenate-ps1 "${PS1_EXIT_STATUS}" "${ORANGE}" --no-prefix

    # Number of Background Jobs Running
    concatenate-ps1 'jobs: ' "${LIGHT_GRAY}"
    concatenate-ps1 "${PS1_JOBS}" "${ORANGE}" --no-prefix

    # Print if login shell
    if is-login-shell; then
      concatenate-ps1 "login shell" "${LOGIN_COLOR}${LOGIN_HIGHLIGHT}"
    fi
  fi

  # Print Working Directory
  concatenate-ps1 'pwd: ' "${LIGHT_GRAY}"
  concatenate-ps1 "${PS1_PWD}"  "${PURPLE}" --no-prefix

  # NewLine
  newline
  reset-ps1-color

  # Concatenate Command Prompt
  concatenate-ps1 " ${PROMPT} " "${ORANGE}" --no-prefix

  # Set Text Color
  set-ps1-color "${PEACH}${RESET}"

  unset newline
}

