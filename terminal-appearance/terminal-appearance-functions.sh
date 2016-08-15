#!/bin/bash -e

set-command-prompt() {

  source-helper-script() {
    . "$ENV_PATH/terminal-appearance/helpers/${@}"
  }

  source-helper-script "helpers.sh"

  construct-border
  construct-cmd-prompt-header

  export PS1
  source-helper-script "cleanup.sh"
}

setup-terminal() {

  source-helper-script() {
    . "$ENV_PATH/terminal-appearance/helpers/${@}"
  }

  set-command-prompt

  # TODO: Add support for linux preferred terminal
  if [ "$TERM_PROGRAM" == "iTerm.app" -o : ]; then
    RESOURCES_DIR="$ENV_PATH/terminal-appearance/resources" source-helper-script "iTerm-helpers.sh"
  fi
}

