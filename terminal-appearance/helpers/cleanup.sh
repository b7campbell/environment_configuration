#!/bin/bash -e

unset BOLD  LOGIN_COLOR     STEEL  LIGHT_GRAY
unset PEACH LOGIN_HIGHLIGHT PURPLE ORANGE
unset RESET DEFAULT_COLOR   NONE   UNDERLINE

unset -f is-color-terminal   reset-ps1-color  set-ps1-color
unset -f concatenate-ps1     construct-border is-login-shell
unset -f ps1-newline         construct-cmd-prompt-header

