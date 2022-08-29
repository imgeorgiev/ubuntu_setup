#!/bin/bash

printf "\nInstalling Chrome\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' google-chrome-stable 2>/dev/null | grep -c "ok installed") -eq 0  ];
then
    echo "Google Chrome already installed. Exitting..."
    exit 1
fi

if [ $(lsb_release -sc) = "xenial" ]; then
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt-get update
    sudo apt-get install google-chrome-stable
elif [ $(lsb_release -sc) = "bionic" ] || [ $(lsb_release -sc) = "focal" ] || [ $(lsb_release -sc) = "jammy" ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i ./google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
else
     echo -e "${RED}ERROR could not detect ubuntu version. Only xenial and bionic are supported. Not installing Chrome${NC}"
fi;
