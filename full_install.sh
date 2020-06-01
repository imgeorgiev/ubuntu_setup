#!/bin/bash

# Setup colors
RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# check for sudo rights
if [ "$(id -u)" != "0"  ]; then
    echo "${RED}Sorry, you are not root. Please use sudo with this script${NC}"
    exit 1
fi

printf "\n${GREEN}## installing linux packages ##${NC}\n"

packages="cifs-utils clipit calibre freecad handbrake openvpn easy-rsa network-manager-openvpn-gnome kazam jstest-gtk meshlab pinta remmina synergy vim xrdp vino gnome-tweak-tool pdftk terminator nmap python-catkin-tools mercurial xclip unetbootin htop git sshpass tree zsh fonts-powerline"

for pack in $packages; do
    apt-get install -y $pack
done


# Install packages which are only available via snap
printf "\n${GREEN}## installing snap packages ##${NC}\n"
snaps="mailspring blender wps-office"
for pack in $snaps; do
    sudo snap install $pack
done

# Install 3rd party packages that are not just fetchable from apt-get
printf "\n${GREEN}## Installing 3rd party ##${NC}\n"""
for f in install/*.sh; do  # or wget-*.sh instead of *.sh
  bash "$f" -H
done

# Setup terminal
sudo chsh -s $(which zsh) # Change default terminal to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended # install oh-my-zsh
echo "emulate sh -c 'source /etc/profile'" | sudo tee -a /etc/zsh/zprofile # add this to make snap apps available to zsh

# Copy config files and setups into to right spots
printf "\n${GREEN}## Copying config files ##${NC}\n"
cp -r .zshrc .vimrc .custom_commands .aliases .config scripts ~/

# Trackpoint config file that makes it usable on thinkpads
sudo cp 10-trackpoint.rules /etc/udev/rules.d/

printf "\n${GREEN}## Finished install ##${NC}\n"
printf "Note that this doesn't mean that everything has been installed succesfully. If you have your doubts, please go around scroll up and check for any errors. Warning should be highlighted in orange and errors should be in red"

