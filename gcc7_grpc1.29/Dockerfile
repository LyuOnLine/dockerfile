FROM ubuntu:artful

LABEL version="1.0.0" maintainer="Jianfeng Lv <superlvjf@gmail.com>"

ENV PYENV_ROOT=/opt/pyenv \
    PATH=/opt/pyenv/shims:${PATH} \
    CXX=/usr/bin/g++ \
    CC=/usr/bin/gcc

COPY sources.list /etc/apt/sources.list

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo=1.* \
       binutils=2.* \
       wget=1.* \
       git=1:2.* \
       libc6-dev-i386=2.* \
       linux-libc-dev:i386=4.* \
       g++-7-multilib=7.* \
       libgmp-dev=2:6.* \
       libmpfr-dev=3.* \
       libmpc-dev=1.* \
       libc6-dev=2.* \
       nasm=2.* \
       dh-autoreconf=14 \
       ninja-build=1.* \
       libffi-dev=3.* \
       libssl-dev=1.* \
       pkg-config=0.* \
       subversion=1.* \
       zlib1g-dev=1:1.* \
       libbz2-dev=1.* \
       libsqlite3-dev=3.* \
       libreadline-dev=7.* \
       xz-utils=5.* \
       curl=7.* \
       libncurses5-dev=6.* \
       libncursesw5-dev=6.* \
       liblzma-dev=5.* \
       ca-certificates \
       autoconf-archive \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-7 100 \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/* \
    && wget --no-check-certificate --quiet https://cmake.org/files/v3.16/cmake-3.16.4-Linux-x86_64.tar.gz \
    && tar -xzf cmake-3.16.4-Linux-x86_64.tar.gz \
       --exclude=bin/cmake-gui \
       --exclude=doc/cmake \
       --exclude=share/cmake-3.12/Help \
    && cp -fR cmake-3.16.4-Linux-x86_64/* /usr \
    && rm -rf cmake-3.16.4-Linux-x86_64 \
    && rm cmake-3.16.4-Linux-x86_64.tar.gz 

ENV GRPC_RELEASE_TAG v1.29.x
RUN git clone -b ${GRPC_RELEASE_TAG} https://github.com/grpc/grpc /var/local/git/grpc && \
    cd /var/local/git/grpc && \
    git submodule update --init && \
    echo "--- installing protobuf ---" && \
    cd third_party/protobuf && \
    git submodule update --init && \
    ./autogen.sh && ./configure --enable-shared && \
    make -j$(nproc) && make -j$(nproc) check && make install && make clean && ldconfig && \
    echo "--- installing grpc ---" && \
    cd /var/local/git/grpc && \
    make -j$(nproc) && make install && make clean && ldconfig && \
    rm -rf /var/local/git/grpc
