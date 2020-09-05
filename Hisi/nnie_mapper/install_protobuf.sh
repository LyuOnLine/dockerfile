#!/usr/bin/env sh
set -e

git clone https://github.com/google/protobuf -b ${PROTOBUF_VERSION}

cd ./protobuf
#./autogen.sh && ./configure -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr \
mkdir build && cd build && cmake -Dprotobuf_BUILD_TESTS=OFF -Dprotobuf_BUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX=/usr ../cmake \
  && make -j 4 && make install

#cd .. && rm -rf protobuf