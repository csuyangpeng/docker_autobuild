#!/usr/bin/env bash

###############################################################################
# Copyright 2018 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Fail on first error.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
wget http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz
tar -xzvf binutils-2.26.tar.gz
pushd binutils-2.26
./configure -disable-werror
sudo make -j8
sudo make install 
popd

# The below install will install protobuf 8 implicitly need to remove it
# Otherwise it will affect our protobuf version
apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
  libxine2-dev libv4l-dev \
  libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
  qt5-default libgtk2.0-dev libtbb-dev \
  libatlas-base-dev \
  libfaac-dev libmp3lame-dev libtheora-dev \
  libvorbis-dev libxvidcore-dev \
  libopencore-amrnb-dev libopencore-amrwb-dev \
  x264 v4l-utils

wget https://github.com/opencv/opencv/archive/3.4.5.zip
unzip 3.4.5.zip
pushd opencv-3.4.5
mkdir build
pushd build
sudo cmake -DCMAKE_INSTALL_PREFIX=/usr/local/opencv3 ..
export CXXFLAGS="-fPIC"
sudo make -j8
sudo make install
popd
popd

# Clean up.
rm -fr 3.4.5.zip opencv-3.4.5 binutils-2.26 binutils-2.26.tar.gz
