#!/bin/bash

printf "\nInstalling Wiregaurd\n"
printf "****** WARNING ******"
printf "\nThis might break the kernel. Install with cauting and if you lose network interfaces, then just rever to older kernel\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' wireguard 2>/dev/null | grep -c "ok installed") -eq 0  ];
then
    echo "Wireguard already installed. Exitting..."
    exit 1
fi

if [ $(lsb_release -sc) = "xenial" ] || [ $(lsb_release -sc) = "bionic" ]; then
    sudo add-apt-repository ppa:wireguard/wireguard -y
    sudo apt install -y wireguard openresolv resolvconf net-tools
else
     echo -e "${RED}ERROR could not detect ubuntu version. Only xenial and bionic are supported. Not installing Spotify${NC}"
fi;
