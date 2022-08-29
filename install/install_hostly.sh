#!/bin/bash

printf "\nInstalling Hosty (ad blocker)\n"

if test -e /usr/local/bin/hosty; then
    printf "Hosty is already installed\n"
    exit 0
fi

sudo apt install bash curl gawk gnupg cron p7zip-full gzip
curl -L git.io/hosty | sh
sudo hosty

