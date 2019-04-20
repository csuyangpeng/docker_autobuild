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

# Install dependencies.
sudo apt-get update -y && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libtool \
  libvorbis-dev \
  pkg-config \
  texinfo \
  wget \
  zlib1g-dev

wget https://www.nasm.us/pub/nasm/releasebuilds/2.14rc15/nasm-2.14rc15.tar.bz2 && \
tar xjvf nasm-2.14rc15.tar.bz2 && \
cd nasm-2.14rc15 && \
./autogen.sh && \
./configure && \
make -j && \
sudo make install

sudo apt-get -y install \
  yasm \
  libx264-dev \
  libnuma-dev \
  libvpx-dev \
  libfdk-aac-dev \
  libmp3lame-dev 

cd .. && \
wget -O ffmpeg-4.0.2.tar.bz2 https://ffmpeg.org/releases/ffmpeg-4.0.2.tar.bz2 && \
tar xjvf ffmpeg-4.0.2.tar.bz2  && \
cd ffmpeg-4.0.2 && \
./configure \
  --prefix=/usr/local/ffmpeg \
  --enable-shared \
  --enable-gpl \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libvorbis \
  --enable-libx264 \
  --enable-nonfree && \
make -j && \
sudo make install &&\
cd ..
#clean up
rm -rf nasm-2.14rc15.tar.bz2 nasm-2.14rc15 ffmpeg-4.0.2 ffmpeg-4.0.2.tar.bz2 



