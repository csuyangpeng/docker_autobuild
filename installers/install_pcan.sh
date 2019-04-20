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

apt-get update -y && apt-get install -y libpopt-dev

wget https://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-8.6.0.tar.gz -O peak-linux-driver-8.6.0.tar.gz
tar zxf peak-linux-driver-8.6.0.tar.gz
pushd peak-linux-driver-8.6.0
make clean
make
make install -j8
cp driver/pcan.h /usr/include
popd

rm -rf peak-linux-driver-8.6.0.tar.gz
rm -rf peak-linux-driver-8.6.0
