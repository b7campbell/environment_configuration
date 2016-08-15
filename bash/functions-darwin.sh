#!/bin/bash -e

# utilities {{{

  cdl() {
    cd "$@"
    gls --color=auto
  }

# }}}

# iTerm Related {{{

  if [ "$TERM_PROGRAM" == 'iTerm.app' ]; then

    set-profile() {
      local profile="${1}"
      echo -e "\033]1337;SetProfile=${profile}\a"
    }

    toggle-fontsize() {
      local DEFAULT_PROFILE='Default'
      local LARGER_FONTSIZE_PROFILE='LargerFontDefault'

      local LARGER_COLS=100
      local LARGER_ROWS=35

      local DEFAULT_COLS=80
      local DEFAULT_ROWS=25

      resize-terminal() {
        local rows="${1}"
        local cols="${2}"

        #echo -e "\033[8;${rows};${cols}t"
      }

      if [ -z "$LARGER_FONTSIZE_ENABLED" ]; then
        set-profile  "${LARGER_FONTSIZE_PROFILE}"
        TERM="xterm" resize -s ${LARGER_ROWS} ${LARGER_COLS}
        set-command-prompt

        LARGER_FONTSIZE_ENABLED="on"
      else
        set-profile         "${DEFAULT_PROFILE}"

        osascript -e "
        set theApp to \"iTerm\"
        set appHeight to 530
        set appWidth  to 730

        tell application \"Finder\"
          set screenResolution to bounds of window of desktop
        end tell

        set screenWidth to item 3 of screenResolution
        set screenHeight to item 4 of screenResolution

        tell application theApp
          activate
          reopen
          set yAxis to (screenHeight - appHeight) / 2 as integer
          set xAxis to (screenWidth - appWidth) / 2 as integer
          set the bounds of the first window to {xAxis, yAxis, appWidth + xAxis, appHeight + yAxis}
        end tell"

        set-command-prompt
        unset LARGER_FONTSIZE_ENABLED
      fi
    }

    clear-iTerm() {
      # http://stackoverflow.com/questions/2198377/how-to-clear-previous-output-in-terminal-in-mac-os-x
      clear
      printf '\033[3J'
    }

  fi ## $TERM_PROGRAM == "iTerm.app"
# }}}

