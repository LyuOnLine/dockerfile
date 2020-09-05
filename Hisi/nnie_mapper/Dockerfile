FROM ubuntu:14.04

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test

RUN apt-get update \
    && apt-get install -y make git gcc-4.8 g++-4.8 gcc-4.8-base \
        cmake3 autoconf automake libtool libc-bin \
        wget curl vim
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 10 && update-alternatives --config gcc
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 10 && update-alternatives --config g++

ADD ./*.sh /tmp/

ENV PROTOBUF_VERSION=v3.6.1
RUN /tmp/install_protobuf.sh

# install openCV
RUN apt-get install -y libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev
ENV OPENCV_VERSION=3.4.2
RUN /tmp/install_opencv.sh

#RUN /tmp/install_cuda.sh

# clean apt cache
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /tmp/*

COPY mapper/* /nnie/
ENV PATH=/usr/local/cuda-8.0:/nnie/:$PATH