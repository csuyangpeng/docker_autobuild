#!/usr/bin/env bash

###############################################################################
# Copyright 2018 The MoonX Authors. All Rights Reserved.
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

apt-get update -y
apt-get install -y \
        automake \
        bison \
        flex \
        g++ \
        git \
        libboost-all-dev \
        libevent-dev \
        libssl-dev \
        libtool \
        make \
        pkg-config

cd "$(dirname "${BASH_SOURCE[0]}")"
wget https://www-us.apache.org/dist/thrift/0.12.0/thrift-0.12.0.tar.gz
tar xzvf thrift-0.12.0.tar.gz
cd thrift-0.12.0
./bootstrap.sh
./configure
make -j8
make install

cd ..
rm -rf thrift-0.12.0.tar.gz thrift-0.12.0
