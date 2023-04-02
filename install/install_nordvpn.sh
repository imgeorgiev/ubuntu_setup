#!/bin/bash

printf "\nInstalling NordVPN (ad blocker)\n"

if test -e /usr/bin/nordvpn; then
    printf "NordVPN is already installed\n"
    exit 0
fi

sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)

