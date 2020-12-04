#!/bin/bash

printf "\nInstalling Telegram\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' telegram 2>/dev/null | grep -c    "ok installed") -eq 0   ];
then
    echo "Telegram already installed. Exitting...\n\n"
    exit 1
fi


sudo add-apt-repository ppa:atareao/telegram -y
sudo apt-get update
sudo apt-get install telegram

