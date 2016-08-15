#!/bin/bash -e

. "helpers/helpers.sh"

TMP_DIR='../tmp'

download-and-unpack-solarized-theme() {

  local   download_path="${1}"
  local    archive_name='solarized.zip'
  local online_location='http://ethanschoonover.com/solarized/files/solarized.zip'
  local    curl_command='curl --silent --show-error --location --output ./solarized.zip'" ${online_location}"

  quiet pushd "${download_path}"
    if [ -s "${archive_name}" ]; then
      checkbox-echo 'solarized theme archive present in tmp/'
    else
      run-command-with-spinner 'curl-ing solarized profile archive to tmp/' "${curl_command}"
    fi

    # from unzip help: -o  overwrite without prompting
    run-command-with-spinner 'unpacking solarized theme archive' 'unzip -qo ./solarized.zip'
  quiet popd
}

##
## Solarized Terminal
##

ensure-directory-exists "$TMP_DIR"
install-solarized-terminal-profile "$TMP_DIR"

##
## Solarized Terminal Colors
##

if [ "$OS_TYPE" = 'linux' ]; then
  install-solarized-terminal-dircolors
fi

