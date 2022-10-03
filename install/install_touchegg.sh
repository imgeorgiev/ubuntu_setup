#!/bin/bash

printf "\nInstalling touchegg\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' touchegg 2>/dev/null | grep -c    "ok installed") -eq 0 ] ;
then
    printf "Spotify already installed. Exitting...\n\n"
    exit 1
fi

# Install
sudo add-apt-repository ppa:touchegg/stable
# hack to make this work on new ubuntus
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C0FCE32AF6B96252
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C0FCE32AF6B96252
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C0FCE32AF6B96252
sudo apt update
sudo apt install touchegg


