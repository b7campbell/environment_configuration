#!/bin/bash -e

. './helpers/helpers.sh'

if [ "$OS_TYPE" = 'darwin' ]; then

  install-homebrew() {
    if check-homebrew; then
      brew update >/dev/null
      checkbox-echo "Homebrew already installed and up to date"
    else
      cross-echo "Homebrew not installed. Installing now..."

      # Ref: http://brew.sh/
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

      checkbox-echo "Homebrew successfully installed"
    fi
  }

  check-plugins-in-manifest() {

    local filename='./manifests/homebrew-pkg-manifest.txt'

    brew-install-or-update() {

      local pkg="$*"

      out=$( brew install "${pkg}" 2>&1 )
      if ! grep 'Warning: .* already installed.'  <<<"$out"; then
        checkbox-echo "** ${pkg} successfully installed"
      fi
    }

    run-command-for-each-line-of-a-file "${filename}" 'brew-install-or-update'
  } ## check-plugins-in-manifest

  install-homebrew
  check-plugins-in-manifest
  brew doctor
fi

if [ "$OS_TYPE" = 'linux' ]; then
  echo "OS not yet supported."
fi
