#!/bin/bash

printf "\nInstalling Hostly (ad blocker)\n"
sudo apt install bash curl gawk gnupg cron p7zip-full gzip
curl -L git.io/hosty | sh

