#!/bin/bash

printf "\nInstalling Flux\n"

sudo add-apt-repository ppa:nathan-renniewaldock/flux
sudo apt-get update
sudo apt-get install fluxgui

