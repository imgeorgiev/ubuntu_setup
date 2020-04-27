#!/bin/bash

printf "\nInstalling Telegram\n"

sudo add-apt-repository ppa:atareao/telegram -y
sudo apt-get update
sudo apt-get install telegram

