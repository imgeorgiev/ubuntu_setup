#!/bin/bash

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "\nInstalling Spotify\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' spotify-client 2>/dev/null | grep -c    "ok installed") -eq 0 ] || [  $(snap list | grep spotify | grep -c "spotify") -eq 1 ] ;
then
    printf "Spotify already installed. Exitting...\n\n"
    exit 1
fi


# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
if [ $(lsb_release -sc) = "xenial" ]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
elif [ $(lsb_release -sc) = "bionic" ]; then
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4773BD5E130D1D45
elif [ $(lsb_release -sc) = "focal" ] || [ $(lsb_release -sc) = "jammy" ]; then
    printf "Spotify is only available on snap for focal and jammy. Skipping...\n\n"
    exit 1
else
    echo -e "${RED}ERROR could not detect ubuntu version. Only xenial and bionic are supported. Not installing Spotify\n\n${NC}"
    exit 1
fi;

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install -y spotify-client
