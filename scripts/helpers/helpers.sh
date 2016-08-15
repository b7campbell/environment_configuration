#!/bin/sh

. './helpers/spinner-helpers.sh'

BASHRC="$ENV_PATH/runcoms/bashrc"
CHECKBOX=" ☑ "
CROSS="❌  "
OS_TYPE=$( uname | tr '[:upper:]' '[:lower:]')
SCRIPT_NAME="$( basename $0 )"


if [ "$OS_TYPE" = 'darwin' -o "$OS_TYPE" = 'linux' ]; then
  :
else
  echo-stderr "$SCRIPT_NAME: Error: script does not support $OS_TYPE"
fi

if [ -s "./helpers/${OS_TYPE}-helpers.sh" ]; then
  . "./helpers/${OS_TYPE}-helpers.sh"
fi

##
## Console Logging
##

echo-red() {
  local RED="$(tput setaf 1)"
  local NOC="$(tput sgr0)"
  printf "$RED$*$NOC\n"
}

echo-yellow() {
  local YEL="$(tput setaf 3)"
  local NOC="$(tput sgr0)"
  printf "$YEL$*$NOC\n"
}

echo-green() {
  local GRE="$(tput setaf 2)"
  local NOC="$(tput sgr0)"
  printf "$GRE$*$NOC\n"
}

checkbox-echo() {
 echo-green "${CHECKBOX} $*"
}

cross-echo() {
 echo-red "${CROSS} $*"
}

ensure-directory-exists() {
  if [ ! -d "${1}" ]; then
    mkdir -p "${1}"
  fi
}

echo-stderr() {
  echo-red "$*" 1>&2
}

# Note: use these only when failure is an expected result
quiet() {
  >/dev/null $*
}

quiet-stderr() {
  &>/dev/null $*
}

##
## Utilities
##

write-to-bashrc() {
  if ! grep -qs "$*" "$BASHRC"; then
    echo "$*" >> "$BASHRC"
  fi
}

source-bashrc() {
  source "$BASHRC"
}

ensure-rc-symlink-exists() {

  local   rcfilename="${1}"
  local   rcfilepath="$HOME/.${rcfilename}"
  local       rcprog="${2}"
  local rc_repo_path="environment_configuration/runcoms/${rcfilename}"

  if [ ! -e "${rcfilepath}" ]; then
    ln -s "$ENV_PATH/runcoms/${rcfilename}" "${rcfilepath}"
    checkbox-echo ".${rcfilename} is now a symlink to environment configuration's ${rcfilename}"
  elif [ -L "${rcfilepath}" ] && [ "$( readlink "${rcfilepath}" )" = "$HOME/"*"${rc_repo_path}" ] ; then
    checkbox-echo ".${rcfilename} is a symlink to environment_configuration's ${rcfilename}"
  else
    echo-stderr "${CROSS} Warning: ~/.${1} already exists and is not a symlink to environment-configuration's ${rcfilename}. Manual conflict resolution required (i.e. have ${rcfilepath} reference this repo's ${rcfilename}. Or, delete ${rcfilepath} and rerun this script."
  fi
}

run-command-for-each-line-of-a-file() {

  local filename kommand line

  filename="${1}"
  kommand="${@:2}"

  if [ -f "${filename}" ]; then
    while read line; do
      # important that $line is not quoted or
      #   it will be treated as one argument
      "${kommand}" ${line}
    done < "${filename}"
  else
    echo-stderr "$( cross-echo "$SCRIPT_NAME: Error: No file ${filename} found. Exiting..." )"
    exit 1
  fi
}

##
## Git
##

## Reference: http://stackoverflow.com/questions/3258243/check-if-pull-needed-in-git
need-to-pull-remote-git-repo () {

  local  LOCAL=$( git rev-parse @       )
  local REMOTE=$( git rev-parse @{u}    )
  local   BASE=$( git merge-base @ @{u} )

  if [ "$LOCAL" = "$REMOTE" ]; then
    echo "Up-to-date"
    return 1
  elif [ "$LOCAL" = "$BASE" ]; then
    echo "Need to pull"
    return 0
  else
    echo-stderr "Warning: Git repo has diverged. Aborting..."
    exit 1
  fi
}

fast-forward-repo-to-remote() {

  local output=$( 2>&1 git pull origin master )

  if ! ( grep --quiet "^Already up-to-date.$" <<<"${output}" ); then
    echo "${output}"
  fi
}

install-or-update-git-repo() {

  local author="${1}"
  local   name="${2}"
  local   path="${3:-.}"

  if quiet-stderr pushd "${path}/${name}"; then
    quiet git fetch
    if quiet need-to-pull-remote-git-repo; then
      cross-echo "${name} needs to be updated"
      fast-forward-repo-to-remote
      checkbox-echo "${name} updated"
    else
      checkbox-echo "${name} up-to-date"
    fi
    quiet-stderr popd
  else
    git clone "git@github.com:${author}/${name}" "${name}"
    checkbox-echo "${name} successfully installed"
  fi
}

