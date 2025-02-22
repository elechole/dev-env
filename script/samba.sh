#!/bin/bash

APT="apt-get"

if [[ -z "${CI}" ]] ; then
	APT="apt"
fi

CONF_PATH=/root/config
CONF_BACKUP=/root/.config-backup

echo "Installing Samba Service..."

sudo ${APT} ${APT_CACHE_OPTION} install -y -qq samba
#sudo smbpasswd -a jyhuh
#sudo vi /etc/samba/smb.conf
sudo cp -a --backup=numbered /etc/samba/smb.conf $CONF_BACKUP
sudo cp -a $CONF_PATH/smb.conf /etc/samba/smb.conf
sudo /etc/init.d/smbd restart
#(echo vagrant; echo vagrant) | sudo smbpasswd -s -a vagrant
