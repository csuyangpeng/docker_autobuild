# version：0.0.1

FROM ubuntu:14.04

RUN  echo 'hello, buildfarm'  > README

EXPOSE 80

RUN mkdir /buildfarm

COPY installers /tmp/installers
#!/usr/bin/env bash

# Fail on first error.

# Install common tools.
RUN sudo apt-get update -y
RUN sudo apt-get upgrade -y
RUN apt-get install -y \
    sudo \
    curl \
    wget \
    zip \
    git \
    vim \
    software-properties-common

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
RUN sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
RUN sudo apt-get update -y
RUN sudo apt-get install ros-indigo-desktop-full -y

RUN sudo rosdep init
RUN sudo rosdep update
RUN sudo apt-get install python-rosinstall -y

#RUN bash /tmp/installers/pre_install.sh

WORKDIR /buildfarm

CMD ["/bin/bash"]
