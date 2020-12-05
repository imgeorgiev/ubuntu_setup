#!/bin/bash

printf "\nInstalling Rust\n"

# first check if eigen already installed
if [ -d "/home/$USER/.cargo"  ]; then
    printf "rust is already insatlled. Exitting...\n\n"
    exit 1
fi


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

