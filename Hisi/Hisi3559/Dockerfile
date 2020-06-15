FROM ubuntu:trusty

LABEL version="1.0.0" maintainer="Jianfeng Lv <superlvjf@gmail.com>"

COPY sources.list /etc/apt/sources.list

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
        libc6 \
        lib32z1 \
        lib32stdc++6 \
        zlib1g-dev \
        libncurses5-dev \
        ncurses-term \
        libncursesw5-dev \ 
        build-essential \
        autoconf \
        u-boot-tools \
        texinfo \
        texlive \
        gawk \
        curl \
        upx \
        pngquant \
        zlib1g-dev \
        liblzo2-dev \
        uuid-dev \
        pkg-config \
        wget \
        unzip \
        bc \
        bison \
        flex

RUN mkdir -p /var/local/gperf && cd /var/local/gperf \
    && wget http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz \
    && tar xzf gperf-3.1.tar.gz && cd gperf-3.1 \
    && ./configure && make && make install \
    && rm -rf /var/log/gperf \
    && touch /etc/ld.so.preload && echo "" > /etc/ld.so.preload

RUN mkdir -p /var/local/automake && cd /var/local/automake \
    && wget https://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.gz \
    && tar xzf automake-1.15.1.tar.gz > /dev/null \
    && cd automake-1.15.1 && ./configure && make && make install \
    && rm -rf /var/local/automake

COPY ffmpeg /usr/bin/

COPY arm-himix100-linux.tgz /var/local/toolchain/

RUN cd /var/local/toolchain && tar xzf ./arm-himix100-linux.tgz \
    && cd arm-himix100-linux \
    && ./arm-himix100-linux.install \
    && rm -rf /var/local/toolchain

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV PATH=/opt/hisi-linux/x86-arm/arm-himix100-linux/bin:$PATH
