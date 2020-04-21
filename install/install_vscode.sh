#!/bin/bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "\nInstalling VSCode\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' code 2>/dev/null | grep -c "ok installed") -eq 0  ];
then
    echo "VSCode already installed. Exitting..."
    exit 1
fi

# First add the source repo for either xenial or bionic
if [ $(lsb_release -sc) = "xenial" ]; then
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
elif [ $(lsb_release -sc) = "bionic" ]; then
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
else
    echo -e "${RED}ERROR could not detect ubuntu version. Only xenial and bionic are supported. Not installing VSCode${NC}"
fi;

# Finally install vscode
sudo apt update
sudo apt install code

