#!/bin/bash

printf "\nInstalling Flux\n"

if [ $(lsb_release -sc) = "bionic" ]; then 
    sudo add-apt-repository ppa:nathan-renniewaldock/flux -y
    sudo apt-get update
    sudo apt-get install fluxgui
    printf "\n\n"
else
    printf "Skipping... fluxed is installed only on bionic\n\n"
fi

