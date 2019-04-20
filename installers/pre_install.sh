#!/usr/bin/env bash

# Fail on first error.
set -e

# Install common tools.
sudo apt-get update -y
sudo apt-get upgrade -y
apt-get install -y \
    sudo \
    curl \
    wget \
    zip \
    git \
    vim \
    software-properties-common

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-indigo-desktop-full

sudo rosdep init
sudo rosdep update
sudo apt-get install python-rosinstall


#add-apt-repository ppa:ubuntu-toolchain-r/test
#apt-get update -y
#apt-get install -y \
#    libgeos++-dev \
#    gcc-5 \
#    g++-5
#update-alternatives \
#    --install /usr/bin/gcc gcc /usr/bin/gcc-5 60 \
#    --slave /usr/bin/g++ g++ /usr/bin/g++-5

#add-apt-repository ppa:openjdk-r/ppa  # only Ubuntu 17.4 and earlier
#apt update
#apt install -y openjdk-8-jdk
# apt install openjdk-8-source #this is optional, the jdk source code
#export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
#export PATH=$PATH:$JAVA_HOME/bin
