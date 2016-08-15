#!/bin/bash -e

. 'helpers/helpers.sh'

ssh_config_path="$HOME/.ssh/config"

if ( grep --silent --quiet "Host csil" "$ssh_config_path" ); then
  echo-yellow "** Host csil already configured! Exiting..."
  exit 0
fi

echo-green "** Enter username for csil.cs.ucsb.edu: "
printf '=> '
read -r user

echo-green "** Adding 'Host csil' for user $user to $ssh_config_path"
cat <<EOF >> ~/.ssh/config
Host csil
    Hostname csil.cs.ucsb.edu
    User $user
    IdentityFile ~/.ssh/id_rsa
    ServerAliveInterval 120
    ServerAliveCountMax 30
EOF


