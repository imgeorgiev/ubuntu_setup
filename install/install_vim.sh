#!/bin/bash

printf "\nInstalling Ultimate VIM\n"

# first check if vim ultimate is already installed
if [ -d "/root/.vim_runtime"  ]; then
    printf "Ultimate VIM is already insatlled. Exitting...\n\n"
    exit 1
fi


git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
