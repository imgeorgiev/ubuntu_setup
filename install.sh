#!/bin/bash

# check for sudo rights
if [ "$(id -u)" != "0"  ]; then
    echo "Sorry, you are not root. Please use sudo with this script"
    exit 1
fi

printf "\n## installing linux packages ##\n"

packages="cifs-utils clipit calibre freecad handbrake redshift-gtk openvpn easy-rsa network-manager-openvpn-gnome kazam jstest-gtk meshlab pinta remmina synergy thunderbird nautilus vim xrdp vino gnome-tweak-tool pdftk terminator nmap python-catkin-tools mercurial"

for pack in $packages; do
    apt-get install -y $pack
done



sudo snap install mailspring odrive-unofficial


printf "\n## Installing 3rd party\n"""
for f in install/*.sh; do  # or wget-*.sh instead of *.sh
  bash "$f" -H
done


printf "\n## Copying config files##\n"

cp -r .bashrc .vimrc .custom_commands.bash .config scripts ~/
sudo cp 70-synaptics.conf /usr/share/X11/xorg.conf.d/

printf "\n## Finished install ##\n"
