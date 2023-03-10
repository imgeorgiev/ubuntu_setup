#!/bin/bash

printf "\nInstalling Eigen\n"

# first check if eigen already installed
if [ -L "/usr/local/include/eigen3"  ]; then
    echo "Eigen is already insatlled. Exitting..."
    exit 1
fi

git clone https://gitlab.com/libeigen/eigen ~/git/eigen
sudo ln -sf /home/ignat/git/eigen /usr/local/include/eigen3
