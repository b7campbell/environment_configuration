#!/bin/bash -e

. "helpers/helpers.sh"

install-vim() {
  if [ "$OS_TYPE" = 'darwin' ]; then
    install-vim-on-mac
  elif [ "$OS_TYPE" = 'linux' ]; then
    install-vim-on-linux
  else
    echo-stderr "$SCRIPT_NAME: Error: script does not support $OS_TYPE"
  fi
}

ensure-vim-directories-exist() {
  ensure-directory-exists "$HOME/.vim/autoload"
  ensure-directory-exists "$HOME/.vim/bundle"
}

check-pathogen() {

  local pathogen_path="$HOME/.vim/autoload/pathogen.vim"

  # pathogen is a single file, so its existence implies installation
  if [ -s "${pathogen_path}" ]; then
    checkbox-echo 'Pathogen already installed.'
  else
    ## Ref: https://github.com/tpope/vim-pathogen#installation
    if curl --location --silent --show-error --output "${pathogen_path}" 'https://tpo.pe/pathogen.vim'; then
      checkbox-echo 'Pathogen successfully installed'
    else
      echo-stderr "$( cross-echo 'Error: Pathogen could not be installed' )"
      exit 1
    fi
  fi
}

install-or-update-vim-plugin() {

  local author="${1}"
  local   name="${2}"

  local    vim_path="$HOME/.vim/bundle"
  local plugin_path="${vim_path}/${name}"

  if quiet-stderr pushd "${vim_path}"; then
    install-or-update-git-repo "${author}" "${name}"
  fi
}

check-plugins-in-manifest() {

  local filename='./manifests/vim-plugin-manifest.txt'

  run-command-for-each-line-of-a-file "${filename}" 'install-or-update-vim-plugin'
}

##
## Begin Execution
##

install-vim
ensure-rc-symlink-exists      "vimrc" "vim"
ensure-vim-directories-exist
check-pathogen
check-plugins-in-manifest

