#!/usr/bin/env sh

set -e

git clone https://github.com/opencv/opencv.git -b ${OPENCV_VERSION}

cd opencv
mkdir build && cd build \
  && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
     -D WITH_GPHOTO2=OFF -D WITH_GTK=OFF -D WITH_CUDA=OFF -D WITH_FFMPEG=OFF -D WITH_LAPACK=OFF .. \
  && make -j 4 && make install

echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf && ldconfig

cd .. && rm -rf opencv