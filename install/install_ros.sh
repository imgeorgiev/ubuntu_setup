#!/bin/bash

# from http://wiki.ros.org/kinetic/Installation/Ubuntu

RED='\033[0;31m'
ORANGE='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "\nInstalling ROS\n"

# first check if already installed
if ! [ $(dpkg-query -W -f='${Status}' ros-kinetic-desktop-full 2>/dev/null | grep -c "ok installed") -eq 0  ];
then
    echo "ROS Kinetic already installed. Exitting..."
    exit 1
fi

if ! [ $(dpkg-query -W -f='${Status}' ros-melodic-desktop-full 2>/dev/null | grep -c "ok installed") -eq 0  ];
then
    echo "ROS Melodic already installed. Exitting..."
    exit 1
fi

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
if [ $(lsb_release -sc) = "xenial" ]; then
    sudo apt-get install -y ros-kinetic-desktop-full
elif [ $(lsb_release -sc) = "bionic" ]; then
    sudo apt-get install -y ros-melodic-desktop-full
    sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-rosdep
else
    echo -e "${RED}ERROR could not detect ubuntu version. Only xenial and bionic are supported. Not install ROS${NC}"
fi;
sudo rosdep init
rosdep update
