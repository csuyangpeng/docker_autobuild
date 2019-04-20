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

mkdir -p /home/tmp
cd /home/tmp

checksum() {
  cat /tmp/installers/bazel_packages.md5 | grep $1 > /tmp/md5
  md5sum -c /tmp/md5
}

wget -O googletest-release-1.8.0.tar.gz \
    https://github.com/google/googletest/archive/release-1.8.0.tar.gz
checksum googletest-release-1.8.0.tar.gz
wget -O opencv-2.4.13.6.zip \
    https://github.com/opencv/opencv/archive/2.4.13.6.zip
checksum opencv-2.4.13.6.zip
wget -O benchmark-1.1.0.tar.gz \
    https://github.com/google/benchmark/archive/v1.1.0.tar.gz
checksum benchmark-1.1.0.tar.gz
wget -O eigen-3.2.10.tar.gz \
    https://bitbucket.org/eigen/eigen/get/3.2.10.tar.gz
checksum eigen-3.2.10.tar.gz
wget -O civetweb-1.10.tar.gz \
    https://github.com/civetweb/civetweb/archive/v1.10.tar.gz
checksum civetweb-1.10.tar.gz
wget -O curlpp-0.8.1.tar.gz \
    https://github.com/jpbarrette/curlpp/archive/v0.8.1.tar.gz
checksum curlpp-0.8.1.tar.gz
wget -O yaml-cpp-0.5.3.zip \
    https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.5.3.zip
checksum yaml-cpp-0.5.3.zip
wget -O qp-oases-3.2.1-1.zip \
    https://github.com/startcode/qp-oases/archive/v3.2.1-1.zip
checksum qp-oases-3.2.1-1.zip
wget -O proj.4-4.9.3.zip \
    https://github.com/OSGeo/proj.4/archive/4.9.3.zip
checksum proj.4-4.9.3.zip
wget -O tinyxml2-5.0.1.zip \
    https://github.com/leethomason/tinyxml2/archive/5.0.1.zip
checksum tinyxml2-5.0.1.zip
wget -O protobuf-all-3.6.1.tar.gz \
    https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz
checksum protobuf-all-3.6.1.tar.gz
wget -O libspiro-8c7a31e.tar.gz \
    https://github.com/KitFung/libspiro/archive/kitfung.tar.gz
checksum libspiro-8c7a31e.tar.gz
wget -O miniz-2.0.4.zip \
    https://github.com/richgel999/miniz/archive/2.0.4.zip
checksum miniz-2.0.4.zip
wget -O fmt-5.3.0.tar.gz \
    https://github.com/fmtlib/fmt/archive/5.3.0.tar.gz
checksum miniz-2.0.4.zip
wget -O grpc-1.16.1.tar.gz \
    https://github.com/grpc/grpc/archive/v1.16.1.tar.gz
checksum grpc-1.16.1.tar.gz
