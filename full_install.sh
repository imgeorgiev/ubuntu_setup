#!/bin/bash

# Setup colors
RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "\n${GREEN}## installing linux packages ##${NC}\n"

packages="cifs-utils clipit calibre freecad handbrake openvpn easy-rsa network-manager-openvpn-gnome kazam jstest-gtk meshlab pinta vim xrdp gnome-tweak-tool gnome-tweaks pdftk terminator nmap python-catkin-tools xclip unetbootin htop git sshpass tree transmission-gtk curl net-tools bat blender latte-dock"

failed=""

for pack in $packages; do
    printf "installing $pack..."
    if sudo apt-get install -y $pack > /dev/null ; then
        printf "success"
    else
        printf "failed"
        failed="$failed $pack"
    fi
    printf "\n"
done

if [ -z "$failed" ]; then
    printf "${GREEN}All packages installed succesfully${NC}\n"
else
    printf "${RED}The following packages failed: $failed ${NC}\n"
fi


# Install packages which are only available via snap
printf "\n${GREEN}## installing snap packages ##${NC}\n"
snaps="mailspring wps-office slack"
if [ $(lsb_release -sc) = "focal" ] || [ $(lsb_release -sc) = "jammy" ]; then
    snaps="$snaps spotify"
fi
for pack in $snaps; do
    sudo snap install $pack
done

# Install packages which are only available via snap
printf "\n${GREEN}## installing classic snap packages ##${NC}\n"
snaps="clion pycharm-professional"
for pack in $snaps; do
    sudo snap install $pack --classic
done

# Install 3rd party packages that are not just fetchable from apt-get
printf "\n${GREEN}## Installing 3rd party ##${NC}\n"""
for f in install/*.sh; do  # or wget-*.sh instead of *.sh
  bash "$f" -H
done

# Copy config files and setups into to right spots
printf "\n${GREEN}## Copying config files ##${NC}\n"
cp -r .zshrc .vimrc .custom_commands .aliases .config scripts ~/

# Trackpoint config file that makes it usable on thinkpads
if ! [ $(lsb_release -sc) = "focal" ]; then
    sudo cp configs/10-trackpoint.rules /etc/udev/rules.d/
fi

printf "\n${GREEN}## Finished install ##${NC}\n"
printf "Note that this doesn't mean that everything has been installed succesfully. If you have your doubts, please go around scroll up and check for any errors. Warning should be highlighted in orange and errors should be in red\n"

