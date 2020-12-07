#!/bin/bash

printf "\nInstalling zsh\n"

# first check if eigen already installed
if [ -d "/home/$USER/.oh-my-zsh/oh-my-zsh.sh"  ]; then
    echo "zsh is already insatlled. Exitting..."
    exit 1
fi

# Setup terminal
sudo apt install zsh fonts-powerline -y
sudo chsh -s $(which zsh) # Change default terminal to zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended # install oh-my-zsh
echo "emulate sh -c 'source /etc/profile'" | sudo tee -a /etc/zsh/zprofile # add this to make snap apps available to zsh

