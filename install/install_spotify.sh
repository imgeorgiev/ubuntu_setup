#!/bin/bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "\nInstall Spotify\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' spotify-client 2>/dev/null | grep -c    "ok installed") -eq 0   ];
then
    echo "Spotify already installed. Exitting..."
    exit 1
fi


# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
if [ $(lsb_release -sc) = "xenial" ]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
elif [ $(lsb_release -sc) = "bionic" ]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
else
    echo -e "${RED}ERROR could not detect ubuntu version. Only xenial and bionic are supported. Not installing Spotify${NC}"
fi;

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install -y spotify-client
