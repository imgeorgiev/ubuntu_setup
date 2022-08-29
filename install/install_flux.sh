#!/bin/bash

ORANGE='\033[0;33m'
NC='\033[0m'

printf "\nInstalling Flux\n"

if [ $(lsb_release -sc) = "bionic" ]; then
    sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
    sudo apt-get update
    sudo apt-get install fluxgui
    printf "\n\n"
else
    printf "${ORANGE}Flux is only installed on bionic. Newer ubuntus should have flux-like functionality built-in${NC}\n"
fi

