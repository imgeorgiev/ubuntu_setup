#!/bin/bash

printf "\nInstalling Chrome\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' google-chrome-stable 2>/dev/null | grep -c "ok installed") -eq 0  ];
then
    echo "Google Chrome already installed. Exitting..."
    exit 1
fi

sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt install google-drive-ocamlfuse
mkdir ~/gdrive

# start and configure gdrive
google-drive-ocamlfuse ~/gdrive &

# configure gdrive to work on boot
echo 'mount | grep "${HOME}/gdrive" >/dev/null || /usr/bin/google-drive-ocamlfuse "${HOME}/gdrive"&' >> ~/.profile


