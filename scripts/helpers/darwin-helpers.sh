#!/bin/sh -e

##
## vim-setup
##

check-homebrew() {
  if ! quiet which brew; then
    echo-stderr "$( cross-echo 'Error: Install homebrew first'  )"
    exit 1
  fi
}

install-vim() {
  if [ -n "$( brew ls --versions vim )" ]; then
    checkbox-echo 'vim already installed'
  else
    echo-stderr "$( cross-echo 'vim not installed. Attempting to install...' )"
    check-homebrew

    TERM='xterm-256color' brew install vim

    checkbox-echo 'vim successfully installed'
  fi
}

##
## terminal-colors-setup
##

install-solarized-terminal-profile() {

  local download_path="${1}"
  local BOL="$(tput bold)"

  local source='/Users/*/'
  local target='~/'

  download-and-unpack-solarized-theme "${download_path}"

  printf "$BOL
  -----------------------------------
  Note: iTerm2 requires manual setup:
  -----------------------------------
  * iTerm -> preferences -> profiles -> colors -> presets
  * import the colorschemes just downloaded into the desired iTerm profiles
  * set solarized as the default

  * import path: ${ENV_PATH/$source/$target}/tmp/solarized/iterm2-colors-solarized/
  -----------------------------------$NOC\n"
}

