#!/bin/sh


##
## vim-setup
##

ensure-package-installed() {
  if ! dpkg -l | grep --quiet "${1}"; then
    sudo apt-get install "${1}"
  fi
}

install-vim-on-linux() {
  sudo apt-get install vim
}

##
## terminal-appearance
##

install-solarized-terminal-profile() {

  local notification_message

  local repo_name='gnome-terminal-colors-solarized'
  local author_name='Anthony25'
      #1. 1
      #2. %{Solarized}
      #3. YES

  if [ -e "$TMP_DIR/solarized_terminal_installation_successful" ]; then
    echo "Solarized terminal already configured. Skipping..."
  else
    ensure-package-installed 'dconf-cli'

    quiet pushd "$TMP_DIR"
      git clone git@github.com:"${author_name}"/"${repo_name}"

      cd "${repo_name}"
      ./install.sh
    quiet popd
  fi
}

install-solarized-terminal-dircolors() {
  local repo_name='dircolors-solarized'
  local dircolors_db='dircolors.256dark'

  quiet pushd "$TMP_DIR"

    git_clone_or_update_if_installed "${repo_name}" "seebi"

    if ! grep 'eval `dircolors' "$HOME/.bashrc"; then
      write_to_bashrc "eval `dircolors../${repo_name}/${dircolors_db}`"
    fi

  quiet popd
}

