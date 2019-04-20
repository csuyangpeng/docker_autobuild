#!/usr/bin/env bash

###############################################################################
# Copyright 2019 The MoonX Authors. All Rights Reserved.
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

# since baidu have edited the fast rtps, we jsut copy it, instead of compile it again
wget https://s3-ap-northeast-1.amazonaws.com/moonx/tensorrt.tar.gz
tar zxvf tensorrt.tar.gz
cp -r tensorrt/tensorrt /usr/include/tensorrt
cp tensorrt/tensorrtlib/* /usr/lib/x86_64-linux-gnu/

rm -rf tensorrt.tar.gz tensorrt
