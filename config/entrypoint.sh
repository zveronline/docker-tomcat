#!/bin/bash
set -e

set_root_passwd() {
  echo "root:$USR_PASSWORD" | chpasswd
}

set_usr_passwd() {
  echo "$USER:$USR_PASSWORD" | chpasswd
}

# Set root password from the commandline
set_root_passwd
set_usr_passwd

if [ ! -f /etc/ssh/ssh_host_rsa_key ]
then
  ssh-keygen -A
fi
if [ ! -f /etc/ssh/sshd_config ]
then
  cp /etc/sshd_config /etc/ssh/
fi
if [ ! -f /usr/local/tomcat/bin/setenv.sh ]
then
  cp /etc/default/setenv.sh /usr/local/tomcat/bin/
fi

exec "$@"
